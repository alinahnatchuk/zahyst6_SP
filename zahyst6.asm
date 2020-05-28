model small
stack 256
.data
my struc
mySurname db 30 dup(' ')
myName db 30 dup(' ')
Age db 30 dup(' ')
City db 30 dup(' ')
my ends
step = 120
my <'Hello, my name is Alina $','Hnatchuk $','and I am 18 years old $','and I live in Khmelnitskyi! $'>
expan my<>
       
.code

ShowMy proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,4

    mov     bx,si
    mov     dl, 10
    mov     ah, 02h
    int     21h

    mov     ah,09h
    lea     dx, my.mySurname[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, my.myName[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, my.Age[bx]
    int     21h
    
    mov     ah,09h
    lea     dx, my.City[bx]
    int     21h

ret
endp    
main:
    mov ax,@data
    mov ds,ax
    call ShowMy 
      
exit:
    mov ax,4c00h
    int 21h
    end main