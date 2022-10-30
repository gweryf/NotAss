.model small
.stack
.data
msg1 db 10,13, "Mouse driver present:"
.code
disp macro xx
mov ah,09
lea dx,xx
int 21h
endm
.startup
mov ax,0000
int 33h

cmp ax,00h
je last
disp msg1

mov ax,0004
mov cx,0
mov dx,0
int 33h
mov ax, 0007 
mov cx,0010
mov dx,055h
int 33h

mov ax, 0008

mov cx,0010
mov dx,055h
int 33h

pixel:
mov ax,0001 
int 33h

mov ax,0003
int 33h
cmp bx,01 
je left
jmp right

left:
mov bx,0011h
int 10h

mov ah,0ch 
int 10h
right:
mov ax,0001
int 33h
cmp bx,02
je last
jmp pixel

last:
mov ax,00 
int 10h

.exit

end



