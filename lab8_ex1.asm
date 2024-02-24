;=================================================
; Name: Ashley Han
; Email: ahan045@ucr.edu
; 
; Lab: lab 8, ex 1
; Lab section: 022
; TA: Sanchit Goel 
; 
;=================================================
.orig x3000

LD R6, top_stack_addr

AND R1, R1, x0000
LD R2, LOAD_FILL_VALUE_3200
JSRR R2

ADD R1, R1, #1
LD R2, OUTPUT_AS_DECIMAL_3400
JSRR R2


; Test harness
;-------------------------------------------------

HALT

; Test harness local data
;-------------------------------------------------
top_stack_addr          .fill xFE00
LOAD_FILL_VALUE_3200    .fill x3200
OUTPUT_AS_DECIMAL_3400  .fill x3400

.end

;=================================================
; Subroutine: LOAD_FILL_VALUE_3200
; Parameter: R1
; Postcondition: Loaded a hard-coded(.FILL) value into R1
; Return Value: R1 <-- hard-coded value
;=================================================

.orig x3200

ADD R6, R6, #-1                         
STR R7, R6, #0

LD R1, VALUE

LDR R7, R6, #0
ADD R6, R6, #1

RET

; Subroutine local data
;-------------------------------------------------
VALUE                  .fill #-3

.end

;=================================================
; Subroutine: OUTPUT_AS_DECIMAL_3400
; Parameter: R1(input register)
; Postcondition: print the new value out to the console as a decimal number
; Return Value: decimal number in console
;=================================================

.orig x3400

ADD R6, R6, #-1                         
STR R7, R6, #0

    ADD R1, R1, #0
    BRzp posNum
    
    NOT R1, R1
    ADD R1, R1, #1
    
    
    LD R0, neg
    OUT 

    posNum
    LEA R3, array                   ;array also has 5 elements for the decimals place 
    LD R7, counter                  ;hold counter of 5 which account of 5 decimals placed number

    cont
    AND R5, R5, #0                  
    LOOP
    ADD R4, R1, #-10                
    BRn done
    
    DO  
    ADD R1, R1, #-10                ;R1 will reduce until we get single digit
    ADD R5, R5, #1                  ;R5 will hold the value with one less decimal place
    BR LOOP
    
    DONE   
    STR R1, R3, #0                  ;store the single digit into array and increment to the next element in array(next decimal place)
    add r3, r3, #1
    and r1, r1, #0                  ;add the remaining value into R1 and continue the cycle until counter is 0
    add r1, r5, #0
    add r7, r7, #-1                 ;max element is 5
    brp cont
    
    ;start outputting
    LD R1, convert
    LD R7, counter
    and r2, r2, #0                  ;counter for first 0 digits
    ADD R3, R3, #-1                 ;decrement by one to access the array, specifically the last added value which is the number with highest decimal place
    LOOP2                           ;we do this because our previous loop increment array after every loop
    
    LDR R0, R3, #0                  ;load to register
    brz skip                        ;if we get zero from the array then we skip
    sent1
    add r0, r0, r1                  ;convert to ascii value
    OUT
    add r2, r2, #1
    sent2
    ADD R3, R3, #-1                 ;move on the next element in array
    ADD R7, R7, #-1                 ;decrement counter by 1
    BRP LOOP2
    
    br restore
    skip

    add r2, r2, #0
    brz sent2
    brnp sent1



restore
LDR R7, R6, #0
ADD R6, R6, #1

RET
; Subroutine local data
;-------------------------------------------------
convert .fill #48
array   .blkw #5
counter .fill #5
neg     .fill x2D

.end