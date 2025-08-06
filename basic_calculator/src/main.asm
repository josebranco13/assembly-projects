global _main

extern _printf
extern _scanf

section .data
    msgInput1 db "Enter first number: ", 0
    msgInput2 db "Enter second number: ", 0
    msgOutput db "You entered: %d and %d", 0xA, 0
    msgSum db "Sum = %d", 0xA, 0
    msgMul db "Multiplication = %d", 0xA, 0
    msgSub db "Subtraction = %d", 0xA, 0
    msgDiv db "Division = %d", 0xA, 0
    msgGt db "Number 1 is greater", 0xA, 0
    msgEq db "Numbers are equal", 0xA, 0
    msgLt db "Number 1 is lower", 0xA, 0
    formatInt db "%d", 0


section .bss
    num1 resd 1
    num2 resd 1


section .text
    _main:
        ;msg for number 1
        push msgInput1
        call _printf
        add esp, 4

        ;user type number 1
        push num1
        push formatInt
        call _scanf
        add esp, 8

        ;msg for number 2
        push msgInput2
        call _printf
        add esp, 4

        ;msg for number 2
        push num2
        push formatInt
        call _scanf
        add esp, 8

        push dword [num2]
        push dword [num1]
        push msgOutput
        call _printf
        add esp, 12

        ;-----------SUM--------------

        mov eax, [num1]
        add eax, [num2]
        push eax
        push msgSum
        call _printf
        add esp, 8

        ;-----------SUBTRACTION--------------

        mov eax, [num1]
        sub eax, [num2]
        push eax
        push msgSub
        call _printf
        add esp, 8

        ;-----------MULTIPLICATION--------------

        mov eax, [num1]
        imul dword [num2]
        push eax
        push msgMul
        call _printf
        add esp, 8

        ;-----------DIVISION--------------

        mov eax, [num1]
        cdq
        idiv dword [num2]
        push eax
        push msgDiv
        call _printf
        add esp, 8

        ;-----------COMPARE--------------
        mov eax, [num1]
        cmp eax, [num2]
        je num_equals
        jg num1_greater
        jl num1_lower


    num1_greater:
        push msgGt
        call _printf
        add esp, 4
        jmp end_compare


    num1_lower:
        push msgLt
        call _printf
        add esp, 4
        jmp end_compare


    num_equals:
        push msgEq
        call _printf
        add esp, 4
        jmp end_compare


    end_compare:
        ret
