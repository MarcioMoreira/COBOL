       IDENTIFICATION DIVISION.
       PROGRAM-ID. CRIAREGISTO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 SALDO-BANCARIO PIC 9(7)V9(2).
       77 SALDO-FORMATADO      PIC ZZZZZZ9.99CR.
       01 REGISTO-CIDADAO.
           05 NOME-COMPLETO PIC X(30).
           05 DATA-NASCIMENTO.
               10 DIA PIC 9(2).
               10 MES PIC 9(2).
               10 ANO PIC 9(4).
       05 ESTADO-CIVIL PIC X(01).
           88 SOLTEIRO VALUE "S".
           88 CASADO   VALUE "C".
           88 DIVORCIADO VALUE "D".
           88 VIUVO    VALUE "V".
           88 ESTADO-CIVIL-VALIDO VALUE "S" "C" "D" "V".
        
    
       PROCEDURE DIVISION.
           DISPLAY " ".
           DISPLAY "REGISTO DO CIDADAO".
           DISPLAY "---------------------------------------".
           MOVE "MARCIO MOREIRA" TO NOME-COMPLETO.
           MOVE "09071980" TO DATA-NASCIMENTO.
           MOVE 1250.50 TO SALDO-BANCARIO.
           MOVE SALDO-BANCARIO TO SALDO-FORMATADO.

           DISPLAY "NOME-COMPLETO : " NOME-COMPLETO.
           DISPLAY "DATA-NASCIMENTO : " DATA-NASCIMENTO.

           *> --- INICIO DA VALIDACAO ---
           PERFORM UNTIL ESTADO-CIVIL-VALIDO
               DISPLAY "ESTADO CIVIL (S/C/D/V): " WITH NO ADVANCING
               ACCEPT ESTADO-CIVIL
               
               *> Converter para maiuscula caso o utilizador use 'c' minusculo
               MOVE FUNCTION UPPER-CASE(ESTADO-CIVIL) TO ESTADO-CIVIL
               
               IF NOT ESTADO-CIVIL-VALIDO
                   DISPLAY "ERRO: OPCAO INVALIDA! USE S, C, D OU V."
               END-IF
           END-PERFORM.
           *> --- FIM DA VALIDACAO ---

           *> Mostrar o estado por extenso usando os nomes definidos no 88
           EVALUATE TRUE
               WHEN SOLTEIRO   DISPLAY "ESTADO-CIVIL    : SOLTEIRO"
               WHEN CASADO     DISPLAY "ESTADO-CIVIL    : CASADO"
               WHEN DIVORCIADO DISPLAY "ESTADO-CIVIL    : DIVORCIADO"
               WHEN VIUVO      DISPLAY "ESTADO-CIVIL    : VIUVO"
           END-EVALUATE.

           DISPLAY "---------------------------------------".
           DISPLAY "SALDO-BANCARIO : " SALDO-FORMATADO " EUR".
           DISPLAY " ".
           STOP RUN.
