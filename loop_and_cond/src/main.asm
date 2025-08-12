global _main
extern _printf
extern _scanf

section .data
    fmt_input   db "Enter a number: ", 0
    fmt_scan    db "%d", 0
    fmt_valid   db "Valid input", 0xA, 0
    fmt_invalid db "Invalid input", 0xA, 0

section .bss
    number resd 1 ; espaço para 1 inteiro (4 bytes)

section .text
_main:
    ; printf("Enter a number: ");
    push fmt_input
    call _printf
    add esp, 4

    ; scanf("%d", &number);
    push number
    push fmt_scan
    call _scanf
    add esp, 8

    ; Comparar o número
    mov eax, [number]
    cmp eax, 0
    jg positive
    jmp negative

positive:
    push fmt_valid
    call _printf
    add esp, 4
    jmp end

negative:
    push fmt_invalid
    call _printf
    add esp, 4

end:
    ret
