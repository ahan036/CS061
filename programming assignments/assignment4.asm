;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: ashley han
; Email: ahan045@ucr.edu
; 
; Assignment name: Assignment 4
; Lab section: 022
; TA: Sanchit Goel
; 
; I hereby certify that I have not received assistance on this assignment,
; or used code, from ANY outside source other than the instruction team
; (apart from what was provided in the starter file).
;
;=================================================================================
;THE BINARY REPRESENTATION OF THE USER-ENTERED DECIMAL NUMBER MUST BE STORED IN R4
;=================================================================================

.ORIG x3000		
;-------------
;Instructions
;-------------

MAIN
; output intro prompt
	LD R0, introPromptPtr		
	PUTS				                       
						
; Set up flags, counters, accumulators as needed
	LD R1, CNT		
EXIT_MAIN

GETCHAR
	GETC				
	ADD R3, R0, #0		
	LD R2, TEST		
	ADD R3, R3, R2

	BRnp CONT			
EXIT_GETCHAR

	
MAIN_LOOP
	ADD R3, R0, #0		
	LD R2, ASCII			
	ADD R3, R3, R2	;CONV	
	BRn LESS	;IF LESS THAN GO TO LOOP (LESS THAN 0)
	
	ADD R3, R0, #0		
	LD R7, LIMIT ;GREATER THAN 9 		
	ADD R3, R3, R7		
	BRp GREATER	

	ADD R3, R1, #0		
	ADD R3, R3, #-6		
	BRz IF_FIRST		

	ADD R4, R4, R4		
	ADD R2, R4, R4		
	ADD R2, R2, R2		
	ADD R4, R4, R2
	
	LD R7, ASCII		
	ADD R0, R0, R7		
	ADD R4, R4, R0 ;CONVERT
	
	ADD R1, R1, #-1		
	BRp GETCHAR			
	BRz END			
EXIT_MAIN_LOOP


CONT
	OUT					
	BR MAIN_LOOP		
EXIT_CONT
	
	
PRINT_ERROR
	LD R0, NL	
	OUT 				
	BR WRONG			
EXIT_PRINT_ERROR

	
FIRST_CHAR
	NOT R4, R4			
	ADD R4, R4, #1		
	BR END		
EXIT_FIRST_CHAR

IF_FIRST
	LD R2, ASCII		
	ADD R4, R0, R2		
	ADD R1, R1, #-2		
	
	BR GETCHAR			
EXIT_IF_FIRST
	
	
FIRST
	ADD R3, R1, #0		
	ADD R3, R3, #-6		
	
	BRz END		
	
	ADD R3, R1, #0		
	ADD R3, R3, #-5		
	
	BRnp END			
	
	ADD R3, R5, #0		
	ADD R3, R3, #-1		
	
	BRz PRINT_ERROR		
	BRnp END		
EXIT_FIRST

POSITIVE
	ADD R3, R1, #0		
	ADD R3, R3, #-6		
	BRnp GREATER	
	ADD R6, R6, #0		
	ADD R5, R5, #1		
	ADD R1, R1, #-1		
	BR GETCHAR			
EXIT_POSITIVE
	
NEGATIVE
	ADD R3, R1, #0		
	ADD R3, R3, #-6		
	BRnp GREATER	
	ADD R6, R6, #1		
	ADD R5, R5, #1		
	ADD R1, R1, #-1	

	BR GETCHAR			
EXIT_NEGATIVE

LESS
	LD R2, POS	
	ADD R3, R0, #0		
	ADD R3, R3, R2		
	BRz POSITIVE		
	
	LD R2, NEG		
	ADD R3, R0, R2
	BRz NEGATIVE		
	
	LD R2, TEST		
	ADD R3, R0, #0		
	ADD R3, R3, R2		
	BRz FIRST		
EXIT_LESS
	
GREATER
	ADD R3, R0, #0		
	ADD R3, R3, #-10	
	
	BRnp PRINT_ERROR		
EXIT_GREATER

WRONG
	LD R0, errorMessagePtr	
	PUTS				
	
	AND R4, R4, #0 ; IM SO STUPID WTH I MISSED ONE LINE TO RESET THE REGISTER
	BR MAIN			
EXIT_WRONG


DIFF
    NOT R4, R4		
    ADD R4, R4, #1
    
    ADD R6, R6, #-1
	BRz END
EXIT_DIFF

END
    ADD R6, R6, #0 
    
    BRp DIFF 
	LD R0, NL 	
	OUT	
	
EXIT_END

					
HALT

;---------------	
; Program Data
;---------------

introPromptPtr  .FILL xB000
errorMessagePtr .FILL xB200
CNT .FILL #6
NL	.FILL X0A		
TEST	.FILL #-10	
POS		.FILL #-43	
NEG 	.FILL #-45
ASCII		.FILL #-48	
LIMIT		.FILL #-57
.END

;------------
; Remote data
;------------
.ORIG xB000	 ; intro prompt
PROMPT .STRINGZ	 "Input a positive or negative decimal number (max 5 digits), followed by ENTER\n"

.END					
					
.ORIG xB200	 ; error message
PRNTERROR .STRINGZ	 "ERROR: invalid input\n"

;---------------
; END of PROGRAM
;---------------
.END

;-------------------
; PURPOSE of PROGRAM
;-------------------
; Convert a sequence of up to 5 user-entered ascii numeric digits into a 16-bit two's complement binary representation of the number.
; if the input sequence is less than 5 digits, it will be user-terminated with a newline (ENTER).
; Otherwise, the program will emit its own newline after 5 input digits.
; The program must end with a *single* newline, entered either by the user (< 5 digits), or by the program (5 digits)
; Input validation is performed on the individual characters as they are input, but not on the magnitude of the number.
