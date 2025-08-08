# Number Base Converter in Assembly (NASM + GCC on Windows)

This project demonstrates a simple 32-bit Assembly program (using NASM) that:

1. Reads a **decimal integer** from the user
2. Displays the same number in **decimal, hexadecimal, octal, and binary** formats

Compiled and linked with **GCC (MinGW)**, fully integrated with **Visual Studio Code**.

---

## 📁 Project Structure

```
convert_number/
├─ src/
│  └─ main.asm           # Assembly source code
├─ build/                # Compiled object files and executables
├─ .vscode/
│  ├─ tasks.json         # Tasks for building and running in VS Code
│  └─ launch.json        # Debug configuration for GDB in VS Code
└─ README.md             # This file
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
build\convert_number.exe
```

Example output:

```
Enter a number: 30
Decimal: 30
hexadecimal: 1e
Octal: 36
Binary: 00000000000000000000000000011110
```

---

## 🖥️ How to Debug

1. Press **`F5`** to start debugging
2. The program will stop at the first instruction of `_main`
3. Step through instructions and inspect registers or memory

---

## 🔹 Assembly Code Highlights

```asm
extern _printf
extern _scanf
global _main

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

    ; Print Decimal, Hexadecimal, Octal, and Binary
    ; (Conversion to binary is done manually)
```

---

## 📝 Notes

* **Build and run** are configured using `.vscode/tasks.json`
* **Debugging** is set up in `.vscode/launch.json` using **GDB**
* The binary conversion is implemented manually in Assembly

Feel free to **extend** this project with:

* Input validation
* Conversion from other bases
* Removing leading zeros in binary output

---

Made with ❤️ José Branco
