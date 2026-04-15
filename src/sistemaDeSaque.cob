       IDENTIFICATION DIVISION.
       PROGRAM-ID. SISTEMADESAQUE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  WS-SALDO-ATUAL PIC 9(7)V9(2).
       77  WS-SALDO-ATUAL-FORMATADO PIC ZZZZZZ9.99CR.
       77  WS-VALOR-DO-SAQUE PIC 9(7)V9(2).
       77  WS-VALOR-DO-SAQUE-FORMATADO PIC ZZZZZZ.
       77  WS-TAXA PIC 9(7)V9(2) VALUE 0.50.
       77  WS-TAXA-VALOR PIC 9(7)V9(2).


       PROCEDURE DIVISION.
           DISPLAY " ".
           DISPLAY "---------------------------------------".
           DISPLAY "| SISTEMA DE SAQUE - CAIXA ELETRONICA |".
           DISPLAY "---------------------------------------".
           DISPLAY " ".
           MOVE 1250.50 TO WS-SALDO-ATUAL.
           MOVE WS-SALDO-ATUAL TO WS-SALDO-ATUAL-FORMATADO.
           
           DISPLAY "SALDO ATUAL : " WS-SALDO-ATUAL-FORMATADO.
           
           DISPLAY "VALOR DO SAQUE: " WITH NO ADVANCING
           ACCEPT WS-VALOR-DO-SAQUE
           
           MOVE WS-VALOR-DO-SAQUE TO WS-VALOR-DO-SAQUE-FORMATADO.
           DISPLAY "VALOR DO SAQUE : " WS-VALOR-DO-SAQUE-FORMATADO.
           
           IF WS-VALOR-DO-SAQUE + WS-TAXA >= WS-SALDO-ATUAL
               DISPLAY "SALDO INSUFICIENTE PARA REALIZAR O SAQUE."
           ELSE
               COMPUTE WS-SALDO-ATUAL= WS-SALDO-ATUAL - 
               (WS-VALOR-DO-SAQUE + (WS-VALOR-DO-SAQUE * WS-TAXA))
               MOVE WS-SALDO-ATUAL TO WS-SALDO-ATUAL-FORMATADO
               COMPUTE WS-TAXA-VALOR = WS-VALOR-DO-SAQUE * WS-TAXA
               
               DISPLAY "SAQUE REALIZADO COM SUCESSO!"
               DISPLAY "SALDO ATUAL APOS O SAQUE : " 
               WS-SALDO-ATUAL-FORMATADO
               
               DISPLAY "VALOR-DO-SAQUE * TAXA - " WS-TAXA-VALOR
           END-IF.
           DISPLAY " ".
           DISPLAY "---------------------------------------".
           DISPLAY "|           FIM DE OPERACAO           |".
           DISPLAY "---------------------------------------".
           DISPLAY " ".
         
           STOP RUN.
