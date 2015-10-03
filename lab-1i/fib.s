	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, r6, lr}
	cmp r0,#0			@if Fn=F0 return 0
	it eq
	popeq {r3, r4, r5 ,r6 ,pc}
	mov r3,#0			@r3=0
	mov r4,#1			@r4=1
	mov r5,#0			@r5=0
	mov r6,#0			@r6=0
.loop:	add r6,r4,r3			@enter loop
	mov r4,r3			@r4=r3
	mov r3,r6			@r3=sum
	adds r5,#1			@i++
	cmp r0,r5			@i<=x
	bgt .loop			
	mov r0,r6			@return sum
	pop {r3, r4, r5 ,r6 ,pc}		

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
