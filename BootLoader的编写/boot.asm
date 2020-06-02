org 0x7c00
BaseOfStack equ 0x7c00

;U盘第一扇区的前90个字节的数据，没有该数据系统无法识别U盘
    jmp short Label_Start;短跳转只需要2个字节，因此后面需要填充nop指令，但是如果使用长跳转就需要3个字节，后面的nop就必须删掉
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
	BPB_SecPerTrk:	dw	63;每个磁道的扇区数
	BPB_NumHeads:	dw	255;磁头数量
	BPB_HiddSec:	dd	0
	BPB_TotSec32:	dd	0xea58bc;硬盘中的扇区总数
    BPB_FATSz32: dd  0x3a79;FAT表扇区数
    BPB_ExtFlags:    dd  0
    BPB_RootClus:    dd 2;起始簇号
    BPB_FSInfo:  dw  1
    BPB_BkBootSec:   dw  6
    BPB_Reserved:times 12 db 0;保留区域
    BS_DrvNum:   db  0x80,0,0x29,0xe5,0xf7,0x0d,0x12;不知道这一块数据是干什么的
    BS_ZERO:    times 11 db 0x20
    BS_FilSysType db 'FAT32   ';文件系统的名称，实际上没什么用

Label_Start:
    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack
;清屏
    mov ax,600h
    mov bx,700h
    mov cx,0
    mov dx,184fh
    int 10h
;设置光标
    mov ax,200h
    mov bx,0
    mov dx,0
    int 10h
;设置颜色
    mov	ah,	0eh
	mov	al,	'.'
	mov	bl,	0fh
	int	10h
;输出boot信息
    mov ax,1301h
    mov bx,000fh
    mov cx,12
    mov si,ds
    mov es,	si
    mov bp,StartBootMessage
    int 10h
;准备加载loader程序
    jmp $

StartBootMessage: db "hello world!"
;填充0，并在末尾写上55aa，这是BIOS寻找操作系统引导程序的标记
times	510 - ($ - $$)	db	0
dw	0xaa55