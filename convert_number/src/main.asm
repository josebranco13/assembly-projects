global _main

extern _printf
extern _scanf

section .data
prompt_num db "Enter a number: ", 0
fmt_num db "%d", 0
out_dec db "Decimal: %d", 10, 0
out_hex db "hexadecimal: %x", 10, 0
out_oct db "Octal: %o", 10, 0
out_bin db "Binary: %s", 10, 0


section .bss
number resd 1
binary resb 33


section .text
    _main:
        ; Prompt for input
        push prompt_num
        call _printf
        add esp, 4

        ; Read number
        push number
        push fmt_num
        call _scanf
        add esp, 8

        ; Print Decimal
        push dword [number]
        push out_dec
        call _printf
        add esp, 8

        ; Print Hexadecimal
        push dword [number]
        push out_hex
        call _printf
        add esp, 8

        ; Print Octal
        push dword [number]
        push out_oct
        call _printf
        add esp, 8

        ; Convert to Binary
        mov eax, [number]
        mov edi, binary
        mov ecx, 32


    to_bin_loop:
        shl eax, 1
        jc bin_one
        mov byte [edi], '0'
        jmp bin_next


    bin_one:
        mov byte [edi], '1'


    bin_next:
        inc edi
        loop to_bin_loop

        ; Null-terminate the binary string
        mov byte [edi], 0

        ; Print Binary
        push binary
        push out_bin
        call _printf
        add esp, 8

        ; Exit program
        xor eax, eax
        ret
