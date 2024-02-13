		AREA Largest, CODE, READONLY
		ENTRY
		EXPORT main
		EXPORT fnd_max
main
		MOV r1, #0          ; Maximum number
		
		BL fnd_max
Stop B Stop

fnd_max
		LDR r2, =numbers    ; Load the address of the numbers array
		LDR r3, =0x0005     ; Load the value of n
loop
		LDR r4, [r2], #4    ; Load next nmbr
		CMP r4, r1          
		BGT update_max      ; Branch if the number is greater than the current maximum
 
		SUBS r3, r3, #1     ; Decrement n and update the flags
		BNE loop            ; while n>0
 
update_max
		MOV r1, r4          
		SUBS r3, r3, #1     
		BNE loop
		
		BX LR ;return to main function
numbers DCD 1,5,3,4,7    ; Array of numbers
 
        END