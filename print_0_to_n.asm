.model small
.stack 100h
.code
main proc
    mov cx,256
    mov ah,2
    mov dl,0
    
    loop:
    int 21h
    inc dl
    dec cx
    jnz loop
    mov ah,4ch
    main endp
end main