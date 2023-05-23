;Input four integer values x,y,C from user where 0 <= x,y <= 9, and C = 0 or 1. 
;If C=0 print the minimum of x,y and
;if C = 1 print the maximum of x,y in the console.  


.MODEL SMALL

.DATA

X DB  '?'
Y DB '?'
C DB '?'
STR1 DB "ENTER THE VALUE OF C $"
STR2 DB "ENTER THE VALUE OF X $"
STR3 DB "ENTER THE VALUE OF Y $"
STR4 DB "THE MAXIMUM NUMBER IS $ "
STR5 DB "THE MINIMUM NUMBER IS $ "
.CODE

MAIN PROC
    
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,9H 
        LEA DX,STR2 
        INT 21H 
        
        
        MOV AH,1H 
        INT 21H   
                 
        SUB AL,30H  
        MOV X,AL   
                             
        MOV AH,2H 
        MOV DL,0AH
        INT 21H        
        MOV DL,0DH
        INT 21H               
                  
        MOV AH,9H  
        LEA DX,STR3 
        INT 21H          
                  
        MOV AH,1H
        INT 21H  
        
        
        SUB AL,30H 
        MOV Y,AL 
        
        MOV AH,2H  
        MOV DL,0AH 
        INT 21H     
         MOV DL,0DH  
        INT 21H       
         
        MOV AH,9H  
        LEA DX,STR1 
        INT 21H    
         
         
        MOV AH,1H 
        INT 21H   
        
        SUB AL,30H 
        MOV C,AL  
        MOV BL,C
        
        
        CMP BL,0H 
        JE  MINIMUM 
        
        CMP BL,1H 
        JE MAXIMUM  
        JMP EXIT 
         
MINIMUM: 	   
        
		MOV CL,X  
        	CMP CL,Y  
        	JL PRINTX 
        	CMP CL,Y  
        	JG PRINTY 
         	JMP EXIT 
    
MAXIMUM:      
		
         	MOV CL,X    
         	CMP CL,Y  
         	JG PRINTX 
         	CMP CL,Y  
         	JL PRINTY 
          	JMP EXIT  
         
PRINTX:   
         
        	MOV AH,2H  
        	MOV DL,0AH 
        	INT 21H      
        	MOV DL,0DH 
        	INT 21H    
        
         	MOV AH, 9H   
         	LEA DX,STR4
         	INT 21H
         
         	MOV AH,2H  
         	ADD X,30H 
         	MOV DL,X  
         	INT 21H	  
         	JMP EXIT                      
PRINTY:
         
        	MOV AH,2H  
        	MOV DL,0AH 
        	INT 21H    
        	MOV DL,0DH 
        	INT 21H    
        
         	MOV AH, 9H  
         	LEA DX,STR5
         	INT 21H	   
         
         	MOV AH,2H  
         	ADD Y,30H 
         	MOV DL,Y    
         	INT 21H   
          
           	JMP EXIT
EXIT:
         	MOV AH, 4CH
         	INT 21H          
    
    MAIN ENDP
END MAIN









