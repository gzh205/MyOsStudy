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
    BufferAddr: dd    BaseOfLoader*10h
    BlockNumL:  dd    0
    BlockNumH:  dd    0

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
    mov ax,[BPB_FATSz32]
    add ax,ax
    add ax,[BPB_RsvdSecCnt]
    inc ax
    mov [BlockNumL],ax
    mov si,PacketSize
    mov bp,DirName
    call Func_Search_File
    sub ax,2
    xor dx,dx
    mov dl,[BPB_SecPerClus]
    mul dx
    add ax,[BlockNumL]
    mov [BlockNumL],ax
    mov si,PacketSize
    mov bp,FileName
    call Func_Search_File
;执行到这里BootLoader应该已经获取到loader所在的扇区号了，此时再将其余文件加载进内存0x10000中
    sub ax,2
    xor dx,dx
    mov dl,[BPB_SecPerClus]
    mul dx
    add ax,[BlockNumL]
    mov [BlockNumL],ax
    mov si,PacketSize
    call Read_Disk
;此时已经将loader读到了内存中，之后修改ds并跳转到0x10000
    mov ax,BaseOfLoader
    mov ds,ax
    jmp BaseOfLoader:OffsetOfLoader

    ;硬盘中寻找文件的函数，输入ds:si指向了DAP结构体，BP是需比较的文件名称，输出AX文件的起始扇区号
    Func_Search_File:
        Search_Sector:
            call Read_Disk
        ;此时根目录扇区的内容全部都在0x10000中了，需要改变es的指针利用es:[di]指向硬盘中的文件名，ds:[si]指向"文件名"变量
            mov ax,BaseOfLoader
            mov es,ax
            mov bx,0;bx指向当前扇区的一个文件项
        loop_FileName:
            mov si,bp;si现在指向的文件名
            mov di,bx;di指向扇区需要比较的文件名
            mov cx,11;循环计数器，循环11次，因为文件名长度固定为11，文件名长度不足的在后面补充0x20
        inner_loop:
            cld
            cmpsb;比较当前两个字符是否相同
            jne diff;不同则跳转
            dec cx
            cmp cx,0;判断循环是否结束
            ja inner_loop;结束则继续执行，否则跳转
            mov di,bx
            add di,1ah
            mov ax,[es:di];将bx+1ah位置的数据取出
            ret
        diff:
            cmp bx,200h
            jmp Finish
            add bx,20h
            ja loop_FileName
        Finish:
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
        mov ax,4200h
        mov al,0
        mov dl,0
        int 13h
        ret

DirName db 'SYSTEM     '
FileName db 'LOADER  BIN'
SectorNo dw 0
StartBootMessage: db "start boot"
;填充0，并在末尾写上55aa，这是BIOS寻找操作系统引导程序的标记
;注意写入数据时将DPT表的第一个字节设为80
times	510 - ($ - $$)	db	0
dw	0xaa55