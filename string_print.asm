.MODEl small
.stack 100h
.DATA
MSG DB 'HELLO!$'  
.CODE
MAIN PROC
; initialize DS
    MOV AX,@DATA
    MOV DS,AX
; display message
    MOV AH, 9
    LEA DX, MSG
    INT 21h
; cet ucn to DOS 
    exit:
    MOV AH,4CH 
    INT 21h
    MAIN ENDP
END MAIN