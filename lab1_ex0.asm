;=================================================
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Lab: lab 1, ex 0
; Lab section: 02
; TA: Sanchit Goel
; 
;=================================================

.orig x3000

	LEA R0, MSG_TO_PRINT
	PUTS 

	HALT

;---------------
;Local Data
;---------------
	MSG_TO_PRINT	.STRINGZ "Hello world!!!\n"


.END



