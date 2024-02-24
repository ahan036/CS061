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
LD R5, FUNC_PTR 

JSRR R5 ;JUMP TO SUBROUTINE ADDRESS

HALT 

;LOCAL DATA 
FUNC_PTR .FILL X3200 ;HOLDS ADDRESS OF SUBROUTINE
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

AND R0, R0, #0 ;make sure there is nothing in r0 
STR R0, R1, #0

FILL_ARRAY ;LOOP TO FILL ARRAY 
    STR R0, R1, #0 ;store address into r0 
    ADD R0, R0, #1 ;increment the address
    ADD R1, R1, #1 ;increment the val youre storing at the address
    ADD R2, R2, #-1 ;deincrement the array counter
    BRp FILL_ARRAY ;repeat as long as array counter is positive 

RET

;LOCAL DATA 
COUNTER_3200 .FILL #10
.END