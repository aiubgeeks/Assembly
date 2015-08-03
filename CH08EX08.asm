.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'TYPE A CHARACTER: $'
    MSG2 DB 0DH,0AH,'THE ASCII CODE OF $'
    MSG3 DB ' IN BINARY IS $'
    MSG4 DB 0DH,0AH,'THE NUMBER OF 1 BITS IS $'
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,9
        LEA DX,MSG1
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        MOV AH,2
        MOV DL,BL
        INT 21H
        MOV AH,9
        LEA DX,MSG3
        INT 21H
        
        XOR BH,BH
        MOV CX,8
        MOV AH,2
        
     TOP:
        ROL BL,1
        JNC  ZERO
        INC BH
        MOV DL,'1'
        JMP NEXT
        
    ZERO:
        MOV DL,'0'
    NEXT:
        INT 21H
        LOOP TOP
        
        MOV AH,9
        LEA DX,MSG4
        INT 21H
        MOV AH,2
        MOV DL,'0'
        ADD DL,BH
        INT 21H  
        
   END_IF:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN
