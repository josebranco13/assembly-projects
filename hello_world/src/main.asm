global _main
extern _printf

section .data
msg db "Hello, world!", 0xA, 0

section .text
_main:
    push msg
    call _printf
    add esp, 4
    ret
