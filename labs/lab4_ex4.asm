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
LD R4, FILL_PTR 
LD R5, CONVERT_PTR
LD R6, PRETTY_PTR


JSRR R4 ;JUMP TO SUBROUTINE ADDRESS

JSRR R5

JSRR R6



HALT 

;LOCAL DATA 
FILL_PTR .FILL X3200 ;HOLDS ADDRESS OF SUBROUTINE
CONVERT_PTR .FILL X3400 ;HOLDS ADDR OF CONV SUBROUTINE 
PRINT_PTR .FILL X3600
PRETTY_PTR .FILL X3800
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
    
ADD R1, R1, #-10

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
    ADD R1, R1, #1 ;INCREMENT R1 SO IT MOVES TO NEXT ELEMENT IN ARRAY
    ADD R3, R3, #-1 ;DEINCREMENT THIS 
    BRp CONVERT_LOOP
    
ADD R1, R1, #-10

RET

;LOCAL DATA 
CONVERT_3400 .FILL #48
COUNTER_3400 .FILL #10

.END

;------------------------------------------------------------------------
; Subroutine: SUB_PRINT_ARRAY_3600
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Each element (character) in the array is printed out to the console.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG X3600
LD R3, COUNTER_3600 

PRINT_LOOP 
    LDR R0, R1, #0 ;LOAD ELEMENET IN MEM ADDR TO R0 TO PRINT 
    OUT 
    
    ADD R1, R1, #1 ;INCREMENT MEM ADDR 
    ADD R3, R3, #-1 ;DEINCREMENT COUNTER
    BRp PRINT_LOOP
    
ADD R1, R1, #-10 ;REVERSE INCREMENT SO THAT R1 HOLDS THE ADDR OF THE START OF THE ARRY 
    
RET
;LOCAL DATA 
COUNTER_3600 .FILL #10
.END

;------------------------------------------------------------------------
; Subroutine: SUB_PRETTY_PRINT_ARRAY_3800
; Parameter (R1): The starting address of the array. This should be unchanged at the end of the subroutine!
; Postcondition: Prints out “=====” (5 equal signs), prints out the array, and after prints out “=====” again.
; Return Value (None)
;-------------------------------------------------------------------------
.ORIG X3800
LEA R0, EQUAL 
PUTS 

LD R6, SUB_PRINT 
JSRR R6

LEA R0, EQUAL ;r7 is still storing this instruction after entering the other subroutine causing the infinite loop
PUTS

RET 

;LOCAL DATA 
SUB_PRINT .FILL X3600 
EQUAL .STRINGZ "====="
.END

