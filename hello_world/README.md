# Hello World in Assembly (NASM + GCC on Windows)

This project demonstrates a simple 32-bit Assembly program (using NASM) that prints "Hello, world!" to the Windows terminal, compiled and linked with GCC (MinGW), and configured to be used within Visual Studio Code.

---

## Project Structure

hello_world/
├─ src/
│  └─ main.asm           # Assembly source code
├─ build/                # Compiled object files and executables
├─ .vscode/
│  ├─ tasks.json         # Tasks for building and running in VS Code
│  └─ launch.json        # Debug configuration for GDB in VS Code
└─ README.md             # This file

---

## Prerequisites

- Windows 10/11
- [NASM](https://www.nasm.us/) installed and added to PATH
- [MinGW](http://mingw.org/) (GCC + GDB) installed and added to PATH
- Visual Studio Code with the Microsoft C/C++ extension installed

---

## How to Build and Run

1. Open the project folder in VS Code
2. Press `Ctrl + Shift + B` to build, link, and run
3. The integrated terminal should display:

```
Hello, world!
```

---

## How to Debug

1. Press `F5` to start debugging
2. The program will stop at the first instruction of `main`
3. Use debug commands to step through the code and inspect registers and stack

---

## Assembly Code Sample

```asm
global main
extern printf

section .data
msg db "Hello, world!", 0xA, 0

section .text
main:
    push msg
    call printf
    add esp, 4
    ret
```

---

## Notes

- Build and run are configured using `.vscode/tasks.json`
- Debugging is set up in `.vscode/launch.json` using GDB
- The tasks use `cmd.exe` shell to avoid PowerShell argument parsing issues

---

Feel free to extend this project by adding more Assembly functions, user input handling, or integrating other C libraries.

---

Made with ❤️ by José Branco
