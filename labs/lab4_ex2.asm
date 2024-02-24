;=================================================
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Lab: lab 4, ex 1
; Lab section: 022
; TA: Sanchit Goel 
; 
;=================================================
.ORIG X3000 
LEA R1, ARRAY;CREATE ARRAY 
LD R5, FILL_PTR 
LD R6, CONVERT_PTR

JSRR R5 ;JUMP TO SUBROUTINE ADDRESS
JSRR R6


HALT 

;LOCAL DATA 
FILL_PTR .FILL X3200 ;HOLDS ADDRESS OF SUBROUTINE
CONVERT_PTR .FILL X3400 ;HOLDS ADDR OF CONV SUBROUTINE 
ARRAY .BLKW #10 ;ARRAY

.END

;------------------------------------------------------------------------
; Subroutine: SUB_FILL_ARRAY_3200
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: The array has values from 0 through 9.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG X3200
LD R2, COUNTER_3200 ;THIS WILL COUNT THE NUMBER OF TIMES WE FILL THE ARRAY

AND R0, R0, #0 
STR R0, R1, #0

FILL_ARRAY ;LOOP TO FILL ARRAY 
    STR R0, R1, #0
    ADD R0, R0, #1
    ADD R1, R1, #1 
    ADD R2, R2, #-1
    BRp FILL_ARRAY

RET

;LOCAL DATA 
COUNTER_3200 .FILL #10
.END

;------------------------------------------------------------------------
; Subroutine: SUB_CONVERT_ARRAY_3400
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (number) in the array should be represented as a character. E.g. 0 -> ‘0’
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG X3400 
LD R0, CONVERT_3400 ;LOAD VAL 48
LD R3, COUNTER_3400 ;LOAD VAL 10 TO KEEP TRACK OF LOOP 

CONVERT_LOOP
    LDR R2, R1, #0  ;GET THE ELEMENT IN THE ARRAY @ R1 AND STORE INTO R2
    ADD R2, R2, R0  ;CONVERT THE ELEMENT IN R2, R2 <= R2 + #48
    STR R2, R1, #0  ;STORE R2 BACK INTO R1 
    ADD R3, R3, #-1 ;DEINCREMENT THIS 
    BRp CONVERT_LOOP


RET

;LOCAL DATA 
CONVERT_3400 .FILL #48
COUNTER_3400 .FILL #10

.END
