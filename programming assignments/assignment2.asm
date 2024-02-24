;=========================================================================
; Name & Email must be EXACTLY as in Gradescope roster!
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Assignment name: Assignment 2
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

;----------------------------------------------
;output prompt
;----------------------------------------------	
LEA R0, intro			; get starting address of prompt string
PUTS			    	; Invokes BIOS routine to output string

;-------------------------------
;INSERT YOUR CODE here
;--------------------------------
GETC ;GET USER INPUT AND STORES INTO R0
OUT ;PRINT WHAT IS IN R0 
ADD R1, R0, #0 ;R1 HOLD FIRST USER INPUT

LD R0, NEWLINE ;PRINT NEWLINE 
OUT

GETC 
OUT 
ADD R2, R0, #0 ;R2 HOLDS SECOND INPUT

LD R0, NEWLINE ;PRINT NEWLINE FOR FORMATTING
OUT

;I HAVE OUTPUTED EACH INPUT AND STORED THEM INTO R1 AND R2 NOW WHAT?
;NOW WE HAVE TO OUT PUT THEM IN A SINGLE LINE ALONG WITH THE STRINGS 

ADD R0, R1, #0 
OUT 

LEA R0, subtract
PUTS

ADD R0, R2, #0 
OUT

LEA R0, equal
PUTS 


;WHATS NEXT? CONVERT THE ASCII CODE FOR THE INPUT VALUE INTO THE BINARY REPRESENTATION 
;convert the ascii code into the number 5 and store it back into the same register

NOT R2, R2 ;TAKE 2'S COMPLEMENT 
ADD R2, R2, #1 

ADD R4, R1, R2 ;find the difference 
BRzp PRINT_POS ;if the value of r4 is positive that means we jump to the next line 

LEA R0, negative ;if it doesnt enter print_pos that means the value is negative 
PUTS

NOT R4, R4 
ADD R4, R4, #1

PRINT_POS ;IF THE VALUE IS POS THEN JUST PRINT THE VALUE REGULARLY
LD R3, conv_ascii 
ADD R4, R4, R3 ;CONVERT BACK TO ASCII 
ADD R0, R4, #0 
OUT 

LD R0, newline 
OUT


HALT				; Stop execution of program
;------	
;Data
;------
; String to prompt user. Note: already includes terminating newline!
intro 	.STRINGZ	"ENTER two numbers (i.e '0'....'9')\n" 		; prompt string - use with LEA, followed by PUTS.
newline .FILL x0A	; newline character - use with LD followed by OUT
negative .STRINGZ "-"
subtract .STRINGZ " - "
equal .STRINGZ " = "
conv_ascii .FILL x030
conv_bin .FILL #-48 

;---------------	
;END of PROGRAM
;---------------	
.END

