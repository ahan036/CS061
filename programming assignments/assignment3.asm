;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Assignment name: Assignment 3
; Lab section: 022
; TA: Sanchit Goel
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=========================================================================


.ORIG x3000			; Program begins here
;-------------
;Instructions
;-------------
LD R6, Value_ptr		; R6 <-- pointer to value to be displayed as binary
LDR R1, R6, #0			; R1 <-- value to be displayed as binary 
;-------------------------------
;INSERT CODE STARTING FROM HERE
;--------------------------------

LD R2, BITS_CNT ;16 BITS
LD R3, BITS_CNT ;16 BITS
LD R4, SPACE_CNT ;3 SPACES


LOOP
    ADD R1, R1, #0 ;IF THE VAL IS ZERO OR POS PRINT A ZERO
    BRn PRINT_ONE ;IF ITS NEGATIVE PRINT ONE
    
    ADD R1, R1, #0 
    BRzp PRINT_ZERO ;IF THE VAL IS ZERO OR POS PRINT A ZERO

PRINT_ONE 
    LD R0, ONE ;PRINT ONE
    OUT 
    ADD R1, R1, R1 
    ADD R3, R3, #-1 ;DEINCREMENT # OF BITS PRINTED
    BRz NEWLINE ;IF WE HAVE REACHED 0 BITS WE PRINT ENDL
    ADD R4, R4, #-1 ;DEINCREMENT SPACES
    BRn PRINT_SPACE ;IF WE REACH NEGATIVE NUMBER THEN WE NEED TO PRINT A SPACE
    ADD R2, R2, #-1 ;ONCE AGAIN DEINCREMENT BIT COUNT 
    BRp LOOP ;AS LONG AS THE BIT COUNT IS POSITIVE RETURN TO LOOP 
    
PRINT_ZERO ;REPEAT SAME STEPS
    LD R0, ZERO ;PRINT 0
    OUT 
    ADD R1, R1, R1 
    ADD R3, R3, #-1 
    BRz NEWLINE 
    ADD R4, R4, #-1 
    BRn PRINT_SPACE 
    ADD R2, R2, #-1  
    BRp LOOP 
    
PRINT_SPACE 
    LEA R0, SPACE 
    PUTS 
    LD R4, SPACE_CNT ;RESET SPACE COUNTER EVERYTIME U PRINT A SPACE
    ADD R2, R2, #0 ;AS LONG ADS NUMBER OF BITS IS POS RETURN TO LOOP 
    BRp LOOP 

NEWLINE ;PROGRAM HAS ENDED SO WE ONLY PRINT NEWLINE
    LD R0, ENDL 
    OUT
    
HALT
;---------------	
;Data
;---------------
Value_ptr	.FILL xCA01	; The address where value to be displayed is stored
BITS_CNT .FILL #16
SPACE_CNT .FILL #3
ZERO .FILL #48
ONE .FILL #49
ENDL .FILL X0A
SPACE .STRINGZ " "

.END

.ORIG xCA01					; Remote data
Value .FILL xABCD			; <----!!!NUMBER TO BE DISPLAYED AS BINARY!!! Note: label is redundant.
;---------------	
;END of PROGRAM
;---------------	
.END
