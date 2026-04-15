       IDENTIFICATION DIVISION.
       PROGRAM-ID. GERAR-MASSA.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHEIRO-CLIENTES ASSIGN TO "data/clients.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS NR-CONTA-FILE
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHEIRO-CLIENTES.
       01  REG-CLIENTE.
           05 NR-CONTA-FILE          PIC 9(09).
           05 PIN-FILE               PIC 9(06).
           05 NOME-FILE              PIC A(30).
           05 SALDO-FILE             PIC 9(07)V99.

       WORKING-STORAGE SECTION.
       77  WS-FS                     PIC XX.
       77  WS-CONTADOR               PIC 9(03) VALUE 1.

       PROCEDURE DIVISION.
           OPEN OUTPUT FICHEIRO-CLIENTES.

           PERFORM 100 TIMES
               MOVE WS-CONTADOR TO NR-CONTA-FILE
               MOVE 123456      TO PIN-FILE
               
               STRING "CLIENTE TESTE " DELIMITED BY SIZE
                      WS-CONTADOR      DELIMITED BY SIZE
                      INTO NOME-FILE
               
               MOVE 1000.00     TO SALDO-FILE
               
               WRITE REG-CLIENTE
               ADD 1 TO WS-CONTADOR
           END-PERFORM.

           CLOSE FICHEIRO-CLIENTES.
           DISPLAY "100 Clientes gerados com sucesso em clients.dat".
           STOP RUN.
