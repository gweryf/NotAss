.model small 
.data
num1 dw 123h
num2 dw 100h
ans dw ?
.code 
.startup
mov ax,@DATA
mov ds,ax
call addProc

mov ah,4ch
int 21h

proc addProc
    mov ax,num1
    add ax,num2
    mov ans,ax
    ret 
endp

ends 
End
