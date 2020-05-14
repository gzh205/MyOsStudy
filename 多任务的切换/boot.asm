org 0x7c00
BaseOfStack equ 0x7c00

mov ax,cs
mov ds,ax
mov ss,ax
mov sp,BaseOfStack


struc

endstruc

times	510 - ($ - $$)	db	0
dw	0xaa55