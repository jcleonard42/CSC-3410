.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.DATA
ai_array DWORD 3, -5, 5, 0, 1   ; array of integer values

.CODE
main proc

    mov edx, 0                  ; sets edx register to 0
    mov eax, 0                  ; assigns 0 to accumulator
    lea esi, ai_array           ; assigns esi to the location of the first array element
    mov ecx, 5                  ; assigns 5 to ecx for for-loop execution
    mov ebx, 0                  ; assigns 0 to ebx register

forCount: mov eax, [esi]        ; move array value to eax for comparison
    cmp eax, 0
    jle lessThan                ; jumps if array element is less than or equal to 0
    add ebx, [esi]
    inc edx

lessThan:
    add esi, 4                  ; moves esi to next element
    loop forCount

    invoke ExitProcess, 0
main ENDP
end main