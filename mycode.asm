;TO LEARN MOV/ADD/SUB/XCHG INSTRUCTION
.MODEL SMALL ;TO ALLOCATE DATA AND CODE SEGMENT =64KB
.STACK 100H  ;TO ALLOCATE STACK SEGMEN T OF 100 BYTES AREA
.DATA   ;LOGICAL AREA OF DATA SEGMENT
A DB 90H ;DECLARE VARIABLES
B DB 64H
.CODE
   
    MAIN PROC 
        MOV AX,@DATA ; TO INNITIALIZE DS
        MOV DS,AX
        MOV AL,A 
        MOV BL,B 
        ADD AL,B ;AL=AL+B
        SUB AL,B;AL=AL-B
        XCHG AL,BL;SWAP AL,BL
       
    MAIN ENDP
         


END MAIN