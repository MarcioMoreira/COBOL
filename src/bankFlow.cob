       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKFLOW.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHEIRO-CLIENTES ASSIGN TO "data/clients.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS DYNAMIC
               RECORD KEY IS NR-CONTA-FILE
               FILE STATUS IS WS-FS-CLIENTES.
     
           SELECT FICHEIRO-LOG ASSIGN TO "data/transactions.log"
               ORGANIZATION IS LINE SEQUENTIAL.              

       DATA DIVISION.
       FILE SECTION.
       FD  FICHEIRO-CLIENTES.
       01  REG-CLIENTE.
           05 NR-CONTA-FILE          PIC 9(09).
           05 PIN-FILE               PIC 9(06).
           05 NOME-FILE              PIC A(30).
           05 SALDO-FILE             PIC 9(07)V99.

       FD  FICHEIRO-LOG.            
       01  REG-LOG-DADOS             PIC X(50).
           
       WORKING-STORAGE SECTION.
       77  WS-FS-CLIENTES          PIC XX.
       77  WS-VALOR-OPERACAO       PIC 9(07)V99.
       77  WS-VALOR-FORMATADO      PIC Z,ZZZ,ZZ9.99.
       77  WS-EOF                  PIC X VALUE 'N'.
       

       01  WS-REGISTO-LOG.
           05 WS-LOG-ID-OPERACAO   PIC 9(09).
           05 WS-LOG-DATA          PIC 9(08). *> YYYYMMDD
           05 WS-LOG-CONTA         PIC 9(09).
           05 WS-LOG-TIPO-OP       PIC X(01). *> 'T', 'L', 'D', 'P'
           05 WS-LOG-VALOR         PIC 9(07)V99.

       01  WS-CLIENTE.
           05 WS-NR-CONTA          PIC 9(09).
           05 WS-PIN               PIC 9(06).
           05 WS-NOME-COMPLETO     PIC A(30). 
           05 WS-SALDO-ATUAL       PIC 9(07)V99.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           OPEN I-O FICHEIRO-CLIENTES.
           
           IF WS-FS-CLIENTES NOT = "00"
               DISPLAY "ERRO AO ABRIR BASE DE DADOS: " WS-FS-CLIENTES
               STOP RUN
           END-IF.

           DISPLAY " ".
           DISPLAY "-----------------------------".
           DISPLAY "*      BANKFLOW SYSTEM      *".
           DISPLAY "-----------------------------".
           DISPLAY " ".
           
           DISPLAY "NUMERO DE CONTA: " WITH NO ADVANCING.
           ACCEPT NR-CONTA-FILE.

           *> READ procura a conta no ficheiro   
           READ FICHEIRO-CLIENTES
               INVALID KEY
                   DISPLAY "ERRO: CONTA NAO ENCONTRADA!"
               NOT INVALID KEY
                   PERFORM VALIDATE-PIN
           END-READ.

           CLOSE FICHEIRO-CLIENTES.
           STOP RUN.

       VALIDATE-PIN.
           DISPLAY "INTRODUZA O PIN: " WITH NO ADVANCING.
           ACCEPT WS-PIN. *> Variavel que armazena o PIN

           IF WS-PIN = PIN-FILE
               DISPLAY " "
               DISPLAY "ACESSO CONCEDIDO!"
               DISPLAY "BEM-VINDO, " NOME-FILE
               DISPLAY "SALDO ATUAL: " SALDO-FILE
               DISPLAY " "
               *> Here you will call your Menu-Paragraph later
           ELSE
               DISPLAY "ERRO: PIN INVALIDO!"
               DISPLAY " "
           END-IF.

