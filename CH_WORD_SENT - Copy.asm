;COUNT THE NUMBER OF CHARACTERS,WORD,SENTANCE IN A LINE
.MODEL SMALL
.STACK 100H

.DATA
COUNT_CHAR DB 0
COUNT_W DB 0
COUNT_SEN DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    MOV CX, 0H
   
    L:
   
    MOV AH, 1H
    INT 21H
    CMP AL, 20H
    JZ WORD
    WR:
    CMP AL, '.'
    JZ SEN
    SR:  
    CMP AL, 0DH
    JZ EXIT
    INC COUNT_CHAR
    LOOP L
   
    EXIT:
    MOV AH, 2H
    MOV DL, 0AH
    INT 21H    
    MOV DL, 0DH
    INT 21H
    ADD COUNT_CHAR, 30H
    MOV DL, COUNT_CHAR
    INT 21H
   
    MOV AH, 2H
    MOV DL, 0AH
    INT 21H    
    MOV DL, 0DH
    INT 21H
    ADD COUNT_W, 31H
    MOV DL, COUNT_W
    INT 21H
   
    MOV AH, 2H
    MOV DL, 0AH
    INT 21H    
    MOV DL, 0DH
    INT 21H
    ADD COUNT_SEN, 30H
    MOV DL, COUNT_SEN
    INT 21H
   
    MOV AH, 4CH
    INT 21H    
   
    WORD:
    INC COUNT_W
    JMP WR
   
    SEN:
    INC COUNT_SEN
    JMP SR
MAIN ENDP
END MAIN