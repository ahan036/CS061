;=================================================
; Name: Ashley Han
; Email:  ahan045@ucr.edu
; 
; Lab: lab 2, ex 4
; Lab section: 022
; TA: Sanchit Goel 
; 
;=================================================
.ORIG X3000 

LD R0, ASCII    ;DIRECTLY LOAD THE VALUES STORES AT LABEL INTO REGISTER
LD R1, COUNTER 

PRINT_LOOP 
    OUT 
    ADD R0, R0, #1 ;INCREMENT WHAT U WILL PRINT
    ADD R1, R1, #-1 ;DEINCREMENT COUNTER 
    BRp PRINT_LOOP  ;AS LONG AS COUNTER IS POSITIVE RETURN TO MEM ADDRESS OF PRINT_LOOP 


HALT 

;LOCAL DATA 
ASCII .FILL X61
COUNTER .FILL X1A 

.END