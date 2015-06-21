.MODEL SMALL
.STACK 100H
.DATA    
    CHAR1 DB ?
    CHAR2 DB ?
    CHAR3 DB ?
    
.CODE        
    MAIN PROC
        MOV AH,1
        INT 21H       ;INPUT FIRST CHARACTER
        MOV BH,AL
        INT 21H       ;INPUT SECOND CHARACTER
        MOV BL,AL
        INT 21H       ;INPUT THIRD CHARACTER
       
        
        CMP AL,BH
        JNL ELSE1
        CMP AL,BL
        JNL ELSE2
        MOV CHAR1,AL
        MOV CHAR2,BL
        MOV CHAR3,BH
        JMP STEP2 
        
    ELSE1:
        CMP BH,BL
        JNL ELSE2
        MOV CHAR1,BH
        MOV CHAR2,BL
        MOV CHAR3,AL
        JMP STEP2
        
    ELSE2:
        MOV CHAR1,BL
        MOV CHAR2,AL
        MOV CHAR3,BH
        
    STEP2:
        MOV BL,CHAR2
        CMP BL,CHAR3
        JL  PRINT   
        MOV BH,CHAR3
        MOV CHAR3,BL
        MOV CHAR2,BH
        
    PRINT:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
        MOV DL,CHAR3  ;THE BIGGEST CHARACTER
        INT 21H
        
        MOV DL,CHAR2  ;THE SECOND BIGGEST CHARACTER
        INT 21H
        
        MOV DL,CHAR1  ;THE SMALLEST CHARACTER
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
        MAIN ENDP
    END MAIN
                
