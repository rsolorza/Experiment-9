

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || ;----------------------------------------------------------
(0002)                            || ;- Experiment #9 Test Program
(0003)                            || ;- 
(0004)                            || ;- Description: This program verifies the interrupt 
(0005)                            || ;- mechanism is working properly, including the 
(0006)                            || ;- C & Z shadow flag (context saving & resotring)
(0007)                            || ;----------------------------------------------------------
(0008)                            || .CSEG
(0009)                       001  || .ORG  0x01
(0010)                            || 
(0011)  CS-0x001  0x36001  0x001  || init:   MOV   r0,0x01
(0012)  CS-0x002  0x1A000         ||         SEI
(0013)                            ||       
(0014)  CS-0x003  0x22001  0x003  || main:   OR    r0,0x01
(0015)  CS-0x004  0x04001         ||         MOV   r0,r0
(0016)  CS-0x005  0x08018         ||         BRN   main
(0017)                            || 
(0018)                            || .CSEG
(0019)                       032  || .ORG  0x20
(0020)                            || 
(0021)                            || ;----------------------------------------------------------
(0022)                            || ;- Interupt Service Routine
(0023)                            || ;- 
(0024)                            || ;- Description: This ISR sets the C & Z flags and returns
(0025)                            || ;- with interrupts enabled. 
(0026)                            || ;----------------------------------------------------------
(0027)  CS-0x020  0x20000  0x020  || ISR:    AND   r0,0x00
(0028)  CS-0x021  0x18001         ||         SEC 
(0029)  CS-0x022  0x04001         ||         MOV   r0,r0
(0030)  CS-0x023  0x1A003         ||         RETIE
(0031)                            || ;----------------------------------------------------------
(0032)                            || 
(0033)                            || 
(0034)                            || .CSEG
(0035)                       1023  || .ORG  0x3FF
(0036)  CS-0x3FF  0x08100         ||         BRN    ISR





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
INIT           0x001   (0011)  ||  
ISR            0x020   (0027)  ||  0036 
MAIN           0x003   (0014)  ||  0016 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
