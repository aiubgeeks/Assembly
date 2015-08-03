.MODEL SMALL
.STACK 100H
.CODE
    MAIN PROC
        MOV AH,1
        XOR CX,CX
        
     WHILE:
        INT 21H   
        CMP AL,0DH
        
        JE  END_WHILE
        INC CX
        PUSH AX
        JMP WHILE
        
     END_WHILE:
        
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        
     PRINT:
        POP DX
        INT 21H
        LOOP PRINT
        
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN
