print macro m
mov ah,09h
mov dx,offset m
int 21h
endm

.model small
.data
list db 10,20,80h,86h,23,26,12,57,89h 
count db (0) 
msg db 10,13, "The number of negative numbers is: $"
.code
start: mov ax,@data
mov ds,ax
mov ch,00 
mov si,offset list 
mov cl,09 
again: mov al,[si] 
and al,80h 
jz next 

inc ch 

next:
inc si 
dec cl 
jnz again 
mov bl,ch 

print msg 
mov cl,04 
mov al,bl 
and al,0f0h 
shr al,cl 
cmp al,09 
jbe alpha 
add al,07 
alpha: add al,30h 
mov ah,02 
mov dl,al 
int 21h
mov ah,02 
mov al,bl 
and al,00fh 


cmp al,09
jbe alpha2 
add al,07 
alpha2: add al,30h 
mov dl,al 
int 21h
mov ah,4ch 
int 21h 
end start
ends