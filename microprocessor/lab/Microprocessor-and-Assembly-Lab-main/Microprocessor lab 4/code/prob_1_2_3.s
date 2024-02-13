	AREA Llab4, CODE, READONLY
	ENTRY
	EXPORT main
	EXPORT problem_1_16
    EXPORT problem_1_32
	EXPORT problem_2
	EXPORT problem_3


X EQU 0x3243
Y EQU 0x3432
P EQU 0x10000000
Q EQU 0x10000000

main
    MOV r0, #X
    MOV r1, #Y
	BL problem_1_16;
	MOV r0,#P
	MOV r1,#Q
	BL problem_1_32;
	BL problem_2;
	BL problem_3;
	
	
stop B stop
     
		 
problem_1_16	
    AND r2, r0, r1 
    ORR r3, r0, r1 
    MVN r4, r3 
    MVN r5,r2
    EOR r6, r0, r1 
    MVN r2, r2 
    MVN r3, r1 
    ORR r7, r2, r3 
	
	BX lr;
	
problem_1_32	
    AND r2, r0, r1 
    ORR r3, r0, r1 
    MVN r4, r3 
    MVN r5, r2
    EOR r6, r0, r1 
    MVN r2, r2 
    MVN r3, r1 
    ORR r7, r2, r3 
	
	BX lr;
	
problem_2
     ASR r1,r0,#1
	 LSL r2,r0,#1
	 LSR r3,r0,#1
	 
	 BX lr;


problem_3

	 ADDS r2,r0,r1
	 BVX overflow

	 SUBS r3,r0,r1
	 BVX overflow

	 DIVS r4,r0,r1
	 BVX overflow

	 MULS r5,r0,r1
	 BVX overflow
	 BX lr;
	 
	 
overflow 
	B srop
	 
	END 
    
	

