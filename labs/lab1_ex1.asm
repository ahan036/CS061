;=================================================
; Name: Ashley Han
; Email:  ahan045@ucr.edu
; 
; Lab: lab 1, ex 1
; Lab section: 02
; TA: Sanchit Goel
; 
;=================================================

.ORIG X3000

    LD R1, DEC_0    ;load 0 into r1
    LD R2, DEC_12   ;r2 <- #12
    LD R3, DEC_6    ;r3 <- #6
    
    DO_WHILE_LOOP   ;label for out loop
        ADD R1, R1, R2  ;add value in R1 and 12 into R1
        ADD R3, R3, #-1     ;add -1 to 6 into R3
        BRp DO_WHILE_LOOP   ;go back to do while loop (x3003) as long as its positive
    END_DO_WHILE_LOOP
    
    
    HALT
    
;point of the program is to continually add 12, until it R3 reaches 0, which is after 6 times 
    
;----------
;LOCAL DATA
;----------
DEC_0   .FILL   #0  ;puts 0 into mem
DEC_12  .FILL   #12 ;12 in mem
DEC_6   .FILL   #6  ;6 in mem

.END
