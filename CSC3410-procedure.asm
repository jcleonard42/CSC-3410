.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
sum DWORD ?
n1 dword 1
value1 DWORD 3
n7pop dword 0
ai_array DWORD -01h, 1h, 4h, 4h, -0Ah   ; 1, 2, 5, -1, -10 ;-0Ah;
i_arsize DWORD 4

.code

add2   PROC                  ; add two words passed on the stack
                             ; return the sum in the EAX register
       push   ebp            ; save EBP
       mov    ebp,esp        ; establish stack frame
       mov    eax,[ebp+8]    ; copy first parameter value
       add    eax,[ebp+12]   ; add second parameter value
       pop    ebp            ; restore EBP
       ret                   ; return
add2   ENDP


main proc

	mov eax, 0
    lea  esi, ai_array   ; esi points to the 1st element in the array
	push esi
	pushfd
	; mov eax, [esp]
	; mov ebx, [esp]  ;will it advance the pointer? 
	; mov ebx, [esp+4]  ;will it advance the pointer?
	pop ecx
	pop edx
	; pushw 02
	mov ecx,LENGTHOF ai_array
	; mov ecx, i_arsize
	; pop ebx
	; pop n7pop   ; what if n7pop has type DWORD instead of WORD? 
	
	mov eax, 0
	mov ecx, 2

	push   ecx       ; assuming value2 in ECX
	push   value1    ; assuming value1 in memory
	call   add2      ; call procedure to find sum: = value1 + value2
	add    esp, 8    ; remove parameters from stack
	mov    sum, eax  ; sum in memory
	
	invoke ExitProcess,0
main endp
end main