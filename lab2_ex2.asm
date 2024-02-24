;=================================================
; Name: Ashley Han
; Email:  ahan045@ucr.edu
; 
; Lab: lab 2, ex 2
; Lab section: 022
; TA: Sanchit Goel
; 
;=================================================
.ORIG X3000 
LDI R3, DEC_65_ADDR
LDI R4, HEX_41_ADDR ;ACCESS ADDRESS OF LABEL FIRST, THEN STORES DATA THAT IS AT THE LABEL INTO THE REGISTER 

ADD R3, R3, #1 ;NOW INCREMENT 
ADD R4, R4, #1

STI R3, DEC_65_ADDR ;TAKES THE VALUE AT R3 AND PUT IT INTO THE ADDRESS OF THE LABEL 
STI R4, HEX_41_ADDR


HALT

DEC_65_ADDR .FILL   X4000
HEX_41_ADDR .FILL   X4001

.END

;remote data
.ORIG X4000
DEC_65_PTR .FILL #65
HEX_41_PTR .FILL X41

.END

