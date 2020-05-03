org 0x7c00
BaseOfStack equ 0x7c00

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
;输出boot信息
    mov ax,1301h
    mov bx,000fh
    mov cx,10
    mov si,ds
    mov es,	si
    mov bp,StartBootMessage
    int 10h
;准备加载loader程序
    jmp $

StartBootMessage: db "start boot"
;填充0，并在末尾写上55aa，这是BIOS寻找操作系统引导程序的标记
times	510 - ($ - $$)	db	0
dw	0xaa55