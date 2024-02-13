AREA lab1, CODE, READONLY
    ENTRY
	EXPORT main
	EXPORT PROB2
	EXPORT PROB3
	EXPORT PROB4
	EXPORT PROB5
X EQU -1
Y EQU 8s
Z EQU 5

main 
	MOV r1, #2
	MOV r2, #4
	MOV r3, #5
	ADD r0,r1,r2
	ADD r0,r0,r3
PROB2
	
	MOV r1, #8
	MOV r2, #4
	SUB r0,r1,r2

PROB3
	MOV r1, #12
	MOV r2, #4
	MOV r3, #5
	SUB r0,r1,r2
	SUB r0,r0,r3
PROB4
	MOV r1, #8
	MOV r2, #4
	MUL r0,r1,r2
PROB5
	MOV r4, #X
	MOV r3, #Y
	MOV r2, #Z
	ADD r0,r3,r4
	ADD r0,r0,r2
stop B stop
	END