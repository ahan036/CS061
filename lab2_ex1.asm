;=================================================
; Name: Ashley Han
; Email: ahan045
; 
; Lab: lab 2. ex 1
; Lab section: 022
; TA: Sanchit Goel
; 
;=================================================
.ORIG X3000 
LD R3, DEC_65
LD R4, HEX_41 ;65 in decimal value therefore binary value is the same 

HALT 

;local data 
DEC_65 .FILL #65
HEX_41 .FILL X41

.END

;as a character they would be the letter A