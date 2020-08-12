1. Dado o script abaixo:

CREATE OR REPLACE TRIGGER TRG_ATUALIZA_DADOS
BEFORE INSERT ON FUNCIONARIO
FOR EACH ROW
BEGIN
INSERT INTO AUDIT VALUES (CURRENT_TIMESTAMP, :NEW.MATRICULA || ‘ - ‘|| :NEW.NOME_FUNCIONARIO);
COMMIT;
END;
/

Assinale a opção correta:

a) O script não compila e apresenta erro devido a ausência do bloco DECLARE
b) O script não compila e apresenta erro devido a presença do comando COMMIT em uma trigger
c) O script compila e não deve apresentar erros em tempo de execução
d) O script compila e apresenta erros em tempo de execução devido a presença do comando COMMIT sem isolamento de transação -- Ok
e) O script compila e apresenta erros em tempo de execução ocasionando com que a tabela FUNCIONARIO seja atualizada e a tabela AUDIT não

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
2) É uma exceção pré-definida no PL/SQL:

a) TOO_MANY_LINES
b) NO_DATA_FOUND
c) TIMEOUT_FOUND
d) INVALID_NUMBER
e) DUP_VAL_ON_INDEX -- Ok – Ocorre quando se tenta armazenar um valor duplicado em uma coluna de uma tabela que possui chave única ou primária 

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
3) Marque abaixo o comportamento que melhor descreve o erro de trigger mutante:

a) É uma trigger que tem comportamento dinâmico
b) É uma trigger que modifica uma linha de uma tabela associada com a tabela que efetuou o disparo da trigger
c) É uma trigger que modifica a tabela de origem do disparo da trigger -- ok
d) É uma trigger que possui um disparo dinâmico
e) A tabela ao qual a trigger pertence tem uma coluna com fórmula

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
4) Qual a pacote PL/SQL mais usado para print de informações durante a execução de um procedimento:

a) DBMS_PRINT
b) DBMS_LOCK
c) DBMS_SYSTEM_OUT
d) DBMS_OUTPUT -- Ok
e) DBMS_JOB

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
5) São funções SQL que lidam com números:

a) COUNT -- Ok 
b) SUBSTR
c) MIN  -- Ok
d) UPPER
e) MAX -- Ok

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
6) Dado o script abaixo:

DECLARE
    WNUMERO NUMBER := 12;
    WCHAR VARCHAR2(20) := 'WCHAR EXTERNA';
    WOUTRO_NUMERO NUMBER := 5;
    
BEGIN
    DECLARE
        WNUMERO NUMBER := 10;
        WCHAR VARCHAR2(20) := 'WCHAR INTERNA';
        WTOTAL NUMBER;
        
    BEGIN
        WTOTAL := WNUMERO + WOUTRO_NUMERO;
        :MSG := WCHAR || '-' || WTOTAL;
    END;
        WTOTAL := WTOTAL + 1;
END;
/

Assinale o resultado esperado:

a) O código não compila devido a duplicidade de nomes de variáveis
b) O código compila e apresenta o resultado: “WCHAR EXTERNA-15”
c) O código compila e apresenta o resultado: “WCHAR INTERNA-15”
d) O código compila e apresenta o resultado: “WCHAR INTERNA-17” 
e) O código não compila devido a presença da variável WTOTAL -- Ok

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
7) Dado o script abaixo:

SET SERVEROUTPUT ON
DECLARE
BEGIN
FOR i IN REVERSE 1..99
LOOP
IF Mod(i,3) = 0 THEN
DBMS_OUTPUT.PUT_LINE(i);
END IF;
END LOOP;
END;
/

Qual o resultado esperado?
a) 98,97,96…
b) 99,98,97…
c) 99,96,93… -- ok
d) 99,97,95...

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
8) Assinale abaixo os tipos de argumento suportados por uma função ou procedimento

PL/SQL:

a) BOOLEAN -- Ok
b) IN -- Ok
c) SUB
d) VAR
e) OUT -- Ok

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
9) Assinale abaixo a declaração correta de uma exception customizada no PL/SQL:

a) PRAGMA MY_CUSTOM_EXCEPTION INIT;
b) MY_CUSTOM_EXCEPTION CUSTOM_EXCEPTION;
c) MY_CUSTOM_EXCEPTION INIT_EXCEPTION;
d) MY_CUSTOM_EXCEPTION EXCEPTION;
e) EXCEPTION MY_CUSTOM_EXCEPTION; -- ok
------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
10) Assinale, comente e exemplifique o uso abaixo dos artefatos que você já teve
algum tipo de contato em um banco de dados Oracle:

a) Materialized View - Nunca trabalhei, porém, entendo como funciona!
					   Visão Materializada é uma view, só que neste caso, o que é armazenado não é a consulta e sim o resultado dela.
					   MATERIALIZED VIEW é uma tabela real no banco de dados que é atualizada SEMPRE que ocorrer uma atualização em alguma tabela usada pela sua consulta


b) Trigger - Já usei em processos de auditoria.
			 Os triggers podem ser do tipo ROW LEVEL (Linha) ou STATEMENT (Tabela).
			 Além  disso, os Triggers podem ocorrer (BEFORE) antes ou (AFTER) depois que a ação tenha ocorrido, e por fim pode ocorrer para as açãoes de INSERT,UPDATE e DELETE em uma tabela.

c) View	- Já usei em várias vezes. 
		  Consulta armazenada, uma tabela "virtual" com base em uma tabela física. 
		  Vantagens da views: 
				REUSO: As views são objetos de carater permanente
				SEGURANCA: As views permitem q ocutamos determinadas colunas de uma tabela
				SIMPLIFICAÇÃO DO CODIGO: As views nos permitem criar um código de programação muito mais limpo, na medida em q podem conter um SELECT complexo.



d) Procedure - Sempre utilizei, em vários processos e por vários motivos, esse é um recurso muito utilizado em processos de banco de dados.

			   Uma store procedure é um bloco de uma instrução PL/SLQ que executa uma ou mais tarefas específicas. São bem similares com as procedures de outras linguagens de programação. Uma PROC pode ou não retornar valores, normalmente as procedures são criadas dentro de pacotes ou em blocos PL/SQL.
			   Podemos passar parâmetros para uma procedure de três maneiras.

			   IN: Passamos o valor na própria procedure.
			   OUT: Recebemos o valor a partir da chamada de blocos externos.
			   IN OUT: Passamos um valor inicial para a procedure e recebemos de volta uma atualização.
			   
e) Function - Sempre usei para retornar valores.
			  
			  Uma FUNCTION é um bloco PL/SQL muito semelhante a uma procedure. O que podemos entender de início entre esses dois tipos de blocos é que os blocos "function retornam valores" e as procedures podem ou não retornar um valor. As functions tem duas características que diferem das procedures, as quais não podemos deixar de tratar.

			  AS FUNCTIONS SEMPRE RETORNAM VALORES!!!
			  FUNCTIONS SÃO USADAS COMO PARTE DE UMA EXPRESSÃO.
			  
f) Package - Já usei muito, quando se trabalhar com vários objetos relacionado a mesma tabela.

		     Uma package é uma coleção de objetos PL/SQL agrupados logicamente sob o nome de pacote. Os packages podem incluir procedures, functions, cursore,declarações, tipos e também variáveis.
	
			 Os packages geralmente possuem duas partes, uma que se refere a spec(Especificação)  e a segunda parte que é o body(Corpo).
			 A speck é o q chamamos de interface para o package. É nela que declaramos os tipos, variáveis, constantes, exceções, cursores e subprogramas que poderão ser referenciados a partir de partes externas ao package.
	
			 Por outro lado, no body definimos as consultas para os cursores e o código para os subprogramas. Em alguns casos pode ser que não haja a necessidade de se ter um body.
	
			 Package PL/SQL é um grupo de funções relacionadas, procedimentos, tipos, cursores dentre outros. Os packages são como uma biblioteca, pois uma vez escrito é armazenado no banco de dados Oracle e pode ser usado por muitas aplicações.

g) Bloco anônimo de código 

			- Já usei muito também.
			É um bloco PL/SQL que não será armazenado definitivamente no banco. O bloco será interpretado, executado e depois será descartado.


R$ 6.500,00

80% 
20% va/vr/combustivel/reembolso educacao/D/ 
											conv intermedica/bradesco
											40% colaborador 60%empresa co
											verificar a planilha/estudo
											
odontologico odonto prev
						20,00 completo

						
						
						













