# COBOL Training Project

This repository contains the development of logic exercises using COBOL.

## 🚀 Objective
The objective of this project is to practice COBOL intensively, automate batch file processing, procedural logic for insurance systems.

## 🛠️ Tools Used
* **Languages:** COBOL
* **COBOL Compiler:** GnuCOBOL 3.2.0 (Clang/Apple LLVM)
* **Editor:** VS Code (with *COBOL Language Support* extension)
* **Environment:** MacOS

## 🏗️ How to Compile and Run (COBOL)

Ensure you are in the project root and that the `bin` folder exists. Use the following commands:

**1. Compile:**
```bash
# Creates the bin folder if it doesn't exist and compiles the code from the src folder
mkdir -p bin && cobc -x -o bin/program_name src/your_file.cob

```
**2. Run:**
```bash
# Runs program
./bin/program_name
