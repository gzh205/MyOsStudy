org 0x7c00
BaseOfLoader	equ	0x1000
OffsetOfLoader	equ	0x00
BaseOfStack equ 0x7c00
;U盘第一扇区的前90个字节的数据，没有该数据系统无法识别U盘
    jmp short Label_Start
    nop
    BS_OEMName:	db	'MINEboot';一个名字，没什么用
	BPB_BytesPerSec:	dw	512;每个扇区的字节数
	BPB_SecPerClus:	db	8;每簇扇区数
	BPB_RsvdSecCnt:	dw	0x26;保留扇区数
	BPB_NumFATs: db	2;FAT表个数
	BPB_RootEntCnt:  dw	0
	BPB_TotSec16:    dw	0
	BPB_Media:   db 0xf8
	BPB_FATSz16:	dw	0
	BPB_SecPerTrk:	dw	63
	BPB_NumHeads:	dw	255
	BPB_HiddSec:	dd	0
	BPB_TotSec32:	dd	0xea58bc
    BPB_FATSz32: dd  0x3a79;FAT表扇区数
    BPB_ExtFlags:    dd  0
    BPB_RootClus:    dd 2;起始簇号
    BPB_FSInfo:  dw  1
    BPB_BkBootSec:   dw  6
    BPB_Reserved:times 12 db 0;保留区域
    BS_DrvNum:   db  0x80,0,0x29,0xe5,0xf7,0x0d,0x12;不知道这一块数据是干什么的
    BS_ZERO:    times 11 db 0x20
    BS_FilSysType db 'FAT32   ';文件系统的名称，实际上没什么用
;显示器显示功能的实现

    PacketSize: db    16
    Reserved:   db    0
    BlockCount: dw    1
    BufferAddr: dd    BaseOfLoader
    BlockNumH:  dd    0
    BlockNumL:  dd    0

Label_Start:
    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack
;设置光标
    mov ax,200h
    mov bx,0
    mov dx,0
    int 10h
;输出boot信息
    mov	bp,	StartBootMessage
    mov cx,10
    call print
;加载loader程序，这一块主要调用BIOS的磁盘功能
Reading_Files:
;读取磁盘的几个步骤。第一步、磁盘复位
    xor	ah,	ah
	xor	dl,	dl
	int	13h
;第二步、定位根目录扇区号=(保留扇区数 +  FAT表扇区数 * FAT表个数(通常为2) + (起始簇号-2) * 每簇扇区数)，并读取根目录扇区的内容
Read_Root_Dir:
    mov cx,[BPB_FATSz32]
    mov bx,[BPB_FATSz32+2]
    adc cx,cx
    jnc Add_No_Carry1
    inc bx
Add_No_Carry1:
    add bx,bx
    adc cx,[BPB_RsvdSecCnt]
    jnc Add_No_Carry2
    inc bx
Add_No_Carry2:
    add bx,bx
    mov ax,[BPB_RootClus]
    sub ax,2
    mul word [BPB_SecPerClus]
    adc cx,ax
    jnc Add_No_Carry3
    inc bx
Add_No_Carry3:
    add bx,dx
    mov [BlockNumH],bx
    mov [BlockNumL],cx
    mov di,DAP
    mov bp,DirName
    mov si,6
    call Func_Search_File
    mov [BlockNumH],bx
    mov [BlockNumL],cx
    mov di,DAP
    mov bp,FileName
    mov si,6
    call Func_Search_File
;执行到这里BootLoader应该已经获取到loader所在的扇区号了，此时再将其余文件加载进内存0x10000中
    mov [BlockNumL],ax
    mov di,DAP
    call Read_Disk
;此时已经将loader读到了内存中，之后修改ds并跳转到0x10000
    mov ax,BaseOfLoader
    mov ds,ax
    mov cs,ax
    jmp [OffsetOfLoader]

    ;硬盘中寻找文件的函数，输入ds:di指向了DAP结构体，BP是需比较的文件名称，输出AX文件的起始扇区号
    Func_Search_File:
        Search_Sector:
            call Read_Disk
        ;此时根目录扇区的内容全部都在0x10000中了，需要改变ds的指针
            mov ax,ds
            push ax
            mov ax,BaseOfLoader
            mov ds,ax
        Search_In_Root_Dir_Begin:
            mov cx,0;外循环计数器cx
        Search_Loop:
            mov dx,cx;字符串遍历计数器dx
            mov bx,bp
        Str_Loop:
            push bp
            mov bp,cx
            call print
            pop bp
            xor ax,ax
            mov al,[bx]
            mov bx,dx
            cmp al,[bx];如果字符相等，则向下执行，否则跳转
            jne Str_Not_Equ
            inc dx;字符串遍历计数器+1
            inc bx;输入字符串计数器+1
            cmp bx,si;判断字符串是否读完，如果读完则向下执行，否则跳转
            jb Str_Loop
        ;找到了文件
            mov bx,cx
            mov ax,[bx+1ah]
            sub ax,[BPB_RootClus]
            mov dx,[BPB_SecPerClus]
            mul dx
            add ax,[BlockNumL]
            jmp Finish
        Str_Not_Equ:
            inc cx
            add cx,0x20
            cmp cx,0x200
            jb Search_Loop
        ;如果循环结束仍然未找到文件，则加载下一个扇区
            mov ax,[BlockNumL]
            add ax,0x200
            mov [BlockNumL],ax
            jmp Search_Sector
        Finish:
            pop bx
            mov ds,bx
        ret

    ;输出字符串函数，输入bp,指向字符串的指针
    print:
        mov ax,1301h
        mov bx,000fh
        mov	si,	ds
        mov	es,	si
        int	10h
        ret

    ;读硬盘函数，输入DS:DI指向一个DAP结构体的指针
    Read_Disk:
        mov ah,42h
        mov al,0
        mov dl,0
        int 13h
        ret
DirName db 'SYSTEM'
FileName db 'loader'
SectorNo dw 0
StartBootMessage: db "start boot"
;填充0，并在末尾写上55aa，这是BIOS寻找操作系统引导程序的标记
times	510 - ($ - $$)	db	0
dw	0xaa55