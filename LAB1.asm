;---------------------------------------
;HAN, ASHLEY 
;LOGIN: AHAN (AHAN045@UCR.EDU)
;SECTION:024
;TA: ADIL MIRZA & DANIEL TAN
;LAB 01
;--------------------------------------
.ORIG x3000
;------------
;Instructions
;------------
    LEA R0, MSG_TO_PRINT 
    PUTS                 
    
    HALT                 
;------------
;Local data
;------------
    MSG_TO_PRINT    .STRINGZ    "Hello world!!!/n"  
    
.END