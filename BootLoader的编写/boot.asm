org 0x7c00
BaseOfStack equ 0x7c00
;程序开始，设置各个寄存器
mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov sp,BaseOfStack
;设置显卡显示模式为 640×480 256色
mov ax,0012h
int 10h

;设置软盘
xor ah,ah
xor dl,dl
int 13h
jmp $

;显示矩形
DisplayRect:
mov bx,[x]
mov ax,[width]
add ax,bx
mov cx,ax
mov bx,[y]
mov ax,[height]
add ax,bx
mov bx,ax
;循环显示像素点
drawX:
    mov dx,bx
    drawY:
        mov ax,0c0ch
        int 10h
        dec dx
    cmp dx,[y]
    jnz drawY
    dec cx
cmp cx,[x]
jnz drawX
ret
x: dw 20
y: dw 20
width: dw 10
height: dw 10
;填充0，并在末尾写上55aa，这是BIOS寻找操作系统引导程序的标记
times	510 - ($ - $$)	db	0
dw	0xaa55