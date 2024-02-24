;=================================================
; Name: Ashley Han
; Email:  ahan045@ucr.edu
; 
; Lab: lab 2, ex 3
; Lab section: 022
; TA: Sanchit Goel
; 
;=================================================
.ORIG X3000 
LD R5, DEC_65_ADDR  ;LOAD ADDRESS INTO REGISTERS 
LD R6, HEX_41_ADDR 

LDR R3, R5 #0 ;NOW WE ASSIGN THE ADDRESS STORED IN R5, AND LOAD RELATIVE INTO R3 
LDR R4, R6, #0 

ADD R3, R3, #1 ;INCREMENT 
ADD R4, R4, #1 

STR R3, R5, #0 ;STORE VAL FROM REGISTER R3 TO A MEM ADDRESS STORED IN R5
STR R4, R6, #0 



HALT

DEC_65_ADDR .FILL   X4000
HEX_41_ADDR .FILL   X4001

.END

;remote data
.ORIG X4000
DEC_65_PTR .FILL #65
HEX_41_PTR .FILL X41

.END
