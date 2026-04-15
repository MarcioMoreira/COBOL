       IDENTIFICATION DIVISION.
       PROGRAM-ID. SETUP-DATABASE.

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
       77  WS-RESPOSTA               PIC X VALUE 'S'.

       PROCEDURE DIVISION.
           *> OPEN OUTPUT: Cria o ficheiro do zero. 
           *> Se já existir, apaga e recria!
           OPEN OUTPUT FICHEIRO-CLIENTES.

           IF WS-FS NOT = "00"
               DISPLAY "ERRO AO CRIAR FICHEIRO. STATUS: " WS-FS
               STOP RUN
           END-IF.

           PERFORM UNTIL WS-RESPOSTA = 'N' OR 'n'
               DISPLAY " "
               DISPLAY "--- GERADOR DE BASE DE DADOS INDEXADA ---"
               DISPLAY "NR. CONTA (9 DIGITOS): " WITH NO ADVANCING
               ACCEPT NR-CONTA-FILE
               
               DISPLAY "PIN (6 DIGITOS): " WITH NO ADVANCING
               ACCEPT PIN-FILE
               
               DISPLAY "NOME (MAX 30): " WITH NO ADVANCING
               ACCEPT NOME-FILE
               
               DISPLAY "SALDO (EX: 1000,50 -> 000100050): " 
               WITH NO ADVANCING
               ACCEPT SALDO-FILE

               WRITE REG-CLIENTE
                   INVALID KEY 
                       DISPLAY "ERRO: CONTA DUPLICADA!"
                   NOT INVALID KEY
                       DISPLAY "CLIENTE GRAVADO COM SUCESSO."
               END-WRITE

               DISPLAY "INSERIR OUTRO? (S/N): " WITH NO ADVANCING
               ACCEPT WS-RESPOSTA
           END-PERFORM.

           CLOSE FICHEIRO-CLIENTES.
           DISPLAY " "
           DISPLAY "PROCESSO CONCLUIDO. O FILE clients.dat ESTA PRONTO."
           STOP RUN.
