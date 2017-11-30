;----------------------------------------------------------
;- Experiment #9 Test Program
;- 
;- Description: This program verifies the interrupt 
;- mechanism is working properly, including the 
;- C & Z shadow flag (context saving & resotring)
;----------------------------------------------------------
.CSEG
.ORG  0x01

init:   MOV   r0,0x01
        SEI
      
main:   OR    r0,0x01
        MOV   r0,r0
        BRN   main

.CSEG
.ORG  0x20

;----------------------------------------------------------
;- Interupt Service Routine
;- 
;- Description: This ISR sets the C & Z flags and returns
;- with interrupts enabled. 
;----------------------------------------------------------
ISR:    AND   r0,0x00
        SEC 
        MOV   r0,r0
        RETIE
;----------------------------------------------------------


.CSEG
.ORG  0x3FF
        BRN    ISR
