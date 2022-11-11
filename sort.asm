.model  small
.stack 100h
.data
a dw -1,54h,100h,-3				;unsorted array
N equ 4							;array length


.code
	mov	ax,	@data
	mov	ds,	ax

	push offset a
	push N
	call bubbleSort
	
	.exit
;gets 2 parameter - the offset of the signed word size array and its length, and sorts the array 
;if you want to change from signed to unsigned change the line "jle skipper" to "jbe skipper"
bubbleSort proc near
push bp
mov bp,sp


mov si,[bp+6] ;pointer to the offset of the current element in the array
mov cl,1 ;counter for looper
mov ch,1 ;counter for loopa
mov bx,0
mov dx,0 

looper:

;reset values
mov ch,1		
mov si,[bp+6]

loopa:
mov di,si
add di,2		;pointer to the offset of the element after the current one
mov bx,[di]

cmp [si],bx			
jle skipper
mov dx,[si] 
mov [di], dx		;swaps the current element and the next one 
mov [si], bx

skipper:

add si,2
inc ch
cmp ch,[bp+4]
jne loopa

inc cl
cmp cl,[bp+4]
jne looper
	
pop bp
ret 4
bubbleSort endp	
	
	
	
end
	
		