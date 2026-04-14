# Projeto COBOL: Estudo de COBOL

Este repositório contém o desenvolvimento de exercícios de lógica utilizando a linguagem COBOL.

## 🚀 Objetivo
O objetivo deste projeto é Praticar intensamente COBOL / automatizar o processamento de ficheiros batch.

## 🛠️ Ferramentas Utilizadas
* **Compilador:**  GnuCOBOL 3.2.0 (Clang/Apple LLVM)
* **Editor:** VS Code (com a extensão *COBOL Language Support*)
* **Ambiente:** [Windows/Linux/Mainframe/Mac]

## 🏗️ Como Compilar e Executar

Certifique-se de que está na raiz do projeto e que a pasta `bin` existe. Utilize os seguintes comandos:

**1. Compilar:**

```bash
# Cria a pasta bin se não existir e compila o código da pasta src
mkdir -p bin && cobc -x -o bin/nome_programa src/seu_arquivo.cob
```

**2. Executar:**
```bash
./bin/nome_programa
```
