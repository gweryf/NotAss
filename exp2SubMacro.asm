subMacro macro num1,num2  
    mov ax,num1
    sub ax,num2
    mov ans,ax
endm

.model small
.data
num1 dw 1234h
num2 dw 1000h
ans dw ?
.code 
mov ax,@DATA
mov ds,ax
subMacro num1,num2
mov ah,4ch 
int 21h
ends 
End