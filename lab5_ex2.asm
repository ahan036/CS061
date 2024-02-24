;=================================================
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Lab: lab 5, ex 1
; Lab section: 022
; TA: Sanchit Goel 
; 
;=================================================
.orig x3000
; Initialize the stack. Don't worry about what that means for now.
ld r6, top_stack_addr ; DO NOT MODIFY, AND DON'T USE R6, OTHER THAN FOR BACKUP/RESTORE

; your code goes here
LEA R1, ARRAY ;HARD CODE ARRAY 
LD R2, SUB_GET ;LOAD SUBROUTINE ADDR
LD R3, SUB_PALINDROME 

JSRR R2 ;JUMP TO SUBROUTINE 

LEA R0, ARRAY ;SUBROUTINE SHOULD HAVE STORES THE STRING IN THE ARRAY SO PRINT THE ARRAY TO TEST 
PUTS 

JSRR R3 


halt

; your local data goes here
ARRAY .BLKW #50
SUB_GET .FILL X3200 
SUB_PALINDROME .FILL X3400 
top_stack_addr .fill xFE00 ; DO NOT MODIFY THIS LINE OF CODE
.end

; your subroutines go below here

;------------------------------------------------------------------------
; Subroutine: SUB_GET_STRING
; Parameter (R1): The starting address of the character array
; Postcondition: The subroutine has prompted the user to input a string,
;	terminated by the [ENTER] key (the "sentinel"), and has stored 
;	the received characters in an array of characters starting at (R1).
;	the array is NULL-terminated; the sentinel character is NOT stored.
; Return Value (R5): The number of non-sentinel chars read from the user.
;	R1 contains the starting address of the array unchanged.
;-------------------------------------------------------------------------
.ORIG X3200 
LEA R0, PROMPT 
PUTS 

AND R5, R5, #0 ;CLEAR THE REGISTER MAKE IT ALL 0
GETC ;GET THE STRING INPUTTED BY USER 
OUT ;PRINT IT 

DO_WHILE 
    STR R0, R1, #0 ;STORE THE FIRST ITEM IN R0 TO R1
    ADD R1, R1, #1 ; ADD 1 TO R1 TO MOVE TO NEXT ADDR IN ARRAY 
    ADD R5, R5, #1 ; ;INCREASE THE COUNT OF NUMBER OF CHARACTERS 
    GETC ;GET NEXT CHAR
    OUT ;PRINT 
    ADD R2, R0, #-10 
    BRnp DO_WHILE 

;AND R0, R0, #0 
;STR R0, R1, #0 

RET

;LOCAL DATA 
PROMPT .STRINGZ "ENTER A STRING, END WITH NEW LINE  \n"
.END 
;-------------------------------------------------------------------------
; Subroutine: SUB_IS_PALINDROME
; Parameter (R1): The starting address of a null-terminated string
; Parameter (R5): The number of characters in the array.
; Postcondition: The subroutine has determined whether the string at (R1)
;		 is a palindrome or not, and returned a flag to that effect.
; Return Value: R4 {1 if the string is a palindrome, 0 otherwise}
;-------------------------------------------------------------------------
.ORIG X3400 
ADD R1, R0, R5
ADD R1, R1, #-1 

DO_WHILE2
    

.END 
