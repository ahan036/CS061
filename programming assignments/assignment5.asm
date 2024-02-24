; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Assignment name: Assignment 5
; Lab section: 022
; TA: Sanchit Goel
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
; PUT ALL YOUR CODE AFTER THE main LABEL
;=================================================================================

;---------------------------------------------------------------------------------
;  Initialize program by setting stack pointer and calling main subroutine
;---------------------------------------------------------------------------------
.ORIG x3000

; initialize the stack
ld r6, stack_addr

; call main subroutine
lea r5, main
jsrr r5

;---------------------------------------------------------------------------------
; Main Subroutine
;---------------------------------------------------------------------------------
main
    LEA R0, user_prompt
    PUTS
    LEA R1, user_string
    ADD R2, R1, #0

; get a string from the user
; * put your code here
    LD R5, get_user_string_addr
    JSRR R5

; find size of input string
; * put your code here
    LD R5, strlen_addr
    JSRR R5
    AND R7, R7, #0
    ADD R7, R7, #1
    ADD R0, R0, #0
    BRz END3000
    
; call palindrome method
; * put your code here
    ADD R0, R0, #-1
    ADD R2, R1, R0
    LD R5, palindrome_addr
    JSRR R5
    ADD R7, R0, #0
    
; determine of string is a palindrome
; * put your code here

; print the result to the screen
; * put your code here

    END3000
    LEA R0, result_string
    PUTS
    ADD R7, R7, #0
    BRp IS_PALINDROME
    LEA R0, not_string
    PUTS
    IS_PALINDROME
    LEA R0, final_string
    PUTS

HALT

;---------------------------------------------------------------------------------
; Required labels/addresses
;---------------------------------------------------------------------------------

; Stack address ** DO NOT CHANGE **
stack_addr           .FILL    xFE00

; Addresses of subroutines, other than main
get_user_string_addr .FILL    x3200
strlen_addr          .FILL    x3300
palindrome_addr      .FILL	  x3400


; Reserve memory for strings in the program
user_prompt          .STRINGZ "Enter a string: "
result_string        .STRINGZ "The string is "
not_string           .STRINGZ "not "
final_string         .STRINGZ	"a palindrome\n"

; Reserve memory for user input string
user_string          .BLKW	  100

.END

;---------------------------------------------------------------------------------
; get_user_string - gets string from user
;
; parameter: R1 - address of string start
; parameter: R2 - address of string stored
;
; returns - nothing
;---------------------------------------------------------------------------------
.ORIG x3200
get_user_string
; Backup all used registers, R7 first, using proper stack discipline
    ADD R6, R6, #-1
    STR R7, R6, #0
    
    ADD R6, R6, #-1
    STR R0, R6, #0
    
    ADD R6, R6, #-1
    STR R1, R6, #0
    
    ADD R6, R6, #-1
    STR R2, R6, #0

DO_WHILE
    GETC
    OUT
    ADD R0, R0, #-10
    BRz END_3200
    ADD R0, R0, #10
    STR R0, R2, #0
    ADD R2, R2, #1
    BR DO_WHILE
    
AND R0, R0, #0
STR R0, R1, #0

END_3200
    LDR R2, R6, #0
    ADD R6, R6, #1
    LDR R1, R6, #0
    ADD R6, R6, #1
    LDR R0, R6, #0
    ADD R6, R6, #1
    LDR R7, R6, #0
    ADD R6, R6, #1
    
    RET
.END

;---------------------------------------------------------------------------------
; strlen - get the length of the string
;
; parameter: R1 - location of string

; returns - length of string 
;---------------------------------------------------------------------------------
.ORIG x3300
strlen
; Backup all used registers, R7 first, using proper stack discipline
    ADD R6, R6, #-1
    STR R7, R6, #0
    ADD R6, R6, #-1
    STR R1, R6, #0
    AND R0, R0, #0

DO_3300
    LDR R7, R1, #0
    ADD R1, R1, #1
    ADD R0, R0, #1
    ADD R7, R7, #0
    BRz END_3300
    BR DO_3300

END_3300
    ADD R0, R0, #-1
; Resture all used registers, R7 last, using proper stack discipline
    LDR R1, R6, #0
    ADD R6, R6, #1
    LDR R7, R6, #0
    ADD R6, R6, #1
    
    RET
.END

;---------------------------------------------------------------------------------
; palindrome - if r1 is greater than r2 then it is true, if values are not equal return false. Recursive
; 
; parameter: R1 - start of the terminated string
; parameter: R2 - end of terminated string
;
; returns - return 1 if palindrome, 0 if it is not a palindrome 
;---------------------------------------------------------------------------------
.ORIG x3400
palindrome ; Hint, do not change this label and use for recursive alls
; Backup all used registers, R7 first, using proper stack discipline

ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0       
ADD R6, R6, #-1
STR R2, R6, #0        
AND R4, R4, #0      
ADD R4, R2, #0
NOT R4, R4
ADD R4, R4, #1
ADD R4, R1, R4      
BRzp BASE

AND R4, R4, #0     
LDR R4, R1, #0      
ADD R1, R1, #1

NOT R4, R4          
ADD R4, R4, #1

AND R3, R3, #0      
LDR R3, R2, #0      
ADD R2, R2, #-1
ADD R3, R3, R4
BRnp FINISH

LEA R5, palindrome ;recursive call
JSRR R5
BR END_3400

BASE
AND R0, R0, #0 ;reset R0
ADD R0, R0, #1 ;increment 
BR END_3400 ;always go to end case 

FINISH
AND R0, R0, #0
BR END_3400

END_3400
; Restore all used registers, R7 last, using proper stack discipline
LDR R2, R6, #0          
ADD R6, R6, #1
LDR R4, R6, #0          
ADD R6, R6, #1

LDR R7, R6, #0
ADD R6, R6, #1

RET
.END
