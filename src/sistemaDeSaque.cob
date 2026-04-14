       IDENTIFICATION DIVISION.
       PROGRAM-ID. SISTEMADESAQUE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 SALDO-ATUAL PIC 9(7)V9(2).
       77 SALDO-ATUAL-FORMATADO PIC ZZZZZZ9.99CR.
       77  VALOR-DO-SAQUE PIC 9(7)V9(2).
       77  VALOR-DO-SAQUE-FORMATADO PIC ZZZZZZ.
       77  TAXA PIC 9(7)V9(2) VALUE 0.50.
       77  TAXA-VALOR PIC 9(7)V9(2).


       PROCEDURE DIVISION.
           DISPLAY " ".
           DISPLAY "---------------------------------------".
           DISPLAY "| SISTEMA DE SAQUE - CAIXA ELETRONICA |".
           DISPLAY "---------------------------------------".
           DISPLAY " ".
           MOVE 1250.50 TO SALDO-ATUAL.
           MOVE SALDO-ATUAL TO SALDO-ATUAL-FORMATADO.
           
           DISPLAY "SALDO ATUAL : " SALDO-ATUAL-FORMATADO.
           
           DISPLAY "VALOR DO SAQUE: " WITH NO ADVANCING
           ACCEPT VALOR-DO-SAQUE
           
           MOVE VALOR-DO-SAQUE TO VALOR-DO-SAQUE-FORMATADO.
           DISPLAY "VALOR DO SAQUE : " VALOR-DO-SAQUE-FORMATADO.
           
           IF VALOR-DO-SAQUE + TAXA >= SALDO-ATUAL
               DISPLAY "SALDO INSUFICIENTE PARA REALIZAR O SAQUE."
           ELSE
               COMPUTE SALDO-ATUAL= SALDO-ATUAL - 
               (VALOR-DO-SAQUE + (VALOR-DO-SAQUE * TAXA))
               MOVE SALDO-ATUAL TO SALDO-ATUAL-FORMATADO
               COMPUTE TAXA-VALOR = VALOR-DO-SAQUE * TAXA
               
               DISPLAY "SAQUE REALIZADO COM SUCESSO!"
               DISPLAY "SALDO ATUAL APOS O SAQUE : " 
               SALDO-ATUAL-FORMATADO
               
               DISPLAY "VALOR-DO-SAQUE * TAXA - " TAXA-VALOR
           END-IF.
           DISPLAY " ".
           DISPLAY "---------------------------------------".
           DISPLAY "|           FIM DE OPERACAO           |".
           DISPLAY "---------------------------------------".
           DISPLAY " ".
         
           STOP RUN.
