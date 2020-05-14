assume cs:code
data segment
DirName db 'SYSTEM'
FileName db 'loader'

PacketSize: db    16
Reserved:   db    0
BlockCount: dw    1
BufferAddr1: dw 1000h
BufferAddr2: dw 0
BlockNum1:  dw  0
BlockNum2:  dw  0
BlockNum3:  dw  0
BlockNum4:  dw  0
data ends
code segment
Label_Start:
    xor	ah,	ah
	xor	dl,	dl
	int	13h
Read_Root_Dir:
    mov cx,79h
    mov bx,3ah
    adc cx,cx
    jnc Add_No_Carry1
    inc bx
Add_No_Carry1:
    add bx,bx
    adc cx,26h
    jnc Add_No_Carry2
    inc bx
Add_No_Carry2:
    add bx,bx
    mov ax,2
    sub ax,2
    xor dx,dx
    mov dl,8
    mul dx
    adc cx,ax
    jnc Add_No_Carry3
    inc bx
Add_No_Carry3:
    add bx,dx
code ends
end