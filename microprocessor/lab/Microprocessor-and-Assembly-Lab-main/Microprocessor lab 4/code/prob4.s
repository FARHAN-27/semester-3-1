		; prob4 avg of n number
		AREA Avrg, CODE, READONLY
        ENTRY
		EXPORT main
main
        MOV r1, #0      	; Sum
        LDR r2, =numbers    ; Load the address of the numbers array
        LDR r3, =0x0005     ; n
	LDR r4, =0x0005
loop    					; Loop over the numbers array
        LDR r5, [r2], #4    ; Load a number into r5 and increment the address by 4 bytes
        ADD r1, r1, r5      ; Add the number to the sum
        SUBS r3, r3, #1     ; Decrement n and update the flags
        BNE loop            ; Repeat until n = 0
 
        SDIV r0, r1, r4    ; Divide the sum by n
 
Stop B Stop

numbers DCD 1, 2, 3, 0,9    ; Array of numbers
        END