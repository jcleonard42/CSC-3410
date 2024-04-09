.586
.MODEL FLAT
.STACK 4096
.DATA
number DWORD -105
sum DWORD ?
.CODE
main PROC
    mov eax, number
    add eax, 158
    mov sum, eax
    mov eax, 0
    ret
main ENDP
END