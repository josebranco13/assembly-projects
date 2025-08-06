Ah, entendi! Tu queres **um ficheiro `README.md` pronto**, não um YAML para colar, correto?

Então aqui está o conteúdo final para o **`README.md`** do projeto `simple_math`:

---

# Simple Math in Assembly (NASM + GCC on Windows)

This project demonstrates a simple 32-bit Assembly program (using NASM) that:

1. Reads **two integers** from the user
2. Performs **addition, subtraction, multiplication, and division**
3. Compares the numbers and prints if they are **equal, greater, or smaller**

Compiled and linked with **GCC (MinGW)**, fully integrated with **Visual Studio Code**.

---

## 📁 Project Structure

```
simple_math/
├─ src/
│  └─ main.asm           # Assembly source code
├─ build/                 # Compiled object files and executables
├─ .vscode/
│  ├─ tasks.json          # Tasks for building and running in VS Code
│  └─ launch.json         # Debug configuration for GDB in VS Code
└─ README.md              # This file
```

---

## ⚙️ Prerequisites

* **Windows 10/11**
* [**NASM**](https://www.nasm.us/) installed and added to PATH
* [**MinGW**](http://mingw.org/) (GCC + GDB) installed and added to PATH
* **Visual Studio Code** with the Microsoft C/C++ extension

---

## 🚀 How to Build and Run

1. Open the project folder in **VS Code**
2. Press **`Ctrl + Shift + B`** to build (configured in `tasks.json`)
3. Run the program from the terminal:

```
build\simple_math.exe
```

Example output:

```
Enter first number: 7
Enter second number: 3
You entered: 7 and 3
Sum = 10
Subtraction = 4
Multiplication = 21
Division = 2
First number is greater
```

---

## 🖥️ How to Debug

1. Press **`F5`** to start debugging
2. The program will stop at the first instruction of `main`
3. Step through instructions and inspect registers or memory

---

## 🔹 Assembly Code Highlights

```asm
extern printf
extern scanf
global main

section .bss
    num1 resd 1
    num2 resd 1

section .text
main:
    ; Ask for input
    push msgInput1
    call printf
    add esp, 4

    push num1
    push fmtInt
    call scanf
    add esp, 8

    ; Compare numbers
    mov eax, [num1]
    cmp eax, [num2]
    je numbers_equal
    jg num1_greater
    jl num1_smaller
```

---

## 📝 Notes

* **Build and run** are configured using `.vscode/tasks.json`
* **Debugging** is set up in `.vscode/launch.json` using **GDB**
* **cmd.exe** is used as the shell to avoid PowerShell argument parsing issues

Feel free to **extend** this project with:

* Division by zero handling
* Negative number handling
* Floating-point operations
* More complex math functions

---

Made with ❤️ by José Branco

---
