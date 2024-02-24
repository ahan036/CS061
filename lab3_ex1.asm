;=================================================
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Lab: lab 3, ex 1
; Lab section: 022
; TA: Sanchit Goel 
; 
;=================================================
.ORIG X3000 
LD R5, PTR  ;LOAD ADDRESS INTO REGISTERS 

LDR R3, R5 #0 ;NOW WE ASSIGN THE ADDRESS STORED IN R5, AND LOAD RELATIVE INTO R3 
LDR R4, R5, #1

ADD R3, R3, #1 ;INCREMENT 
ADD R4, R4, #1 

STR R3, R5, #0 ;STORE VAL FROM REGISTER R3 TO A MEM ADDRESS STORED IN R5
STR R4, R5, #1



HALT

PTR .FILL X4000

.END

;remote data
.ORIG X4000
ARRAY_1 .BLKW #10
DEC_25 .FILL #25


.END