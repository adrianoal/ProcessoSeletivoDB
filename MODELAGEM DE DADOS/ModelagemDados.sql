--------------------------------------------------------------------------------------------------------------------------------
										---- MODELAGEM DE DADOS ----
--------------------------------------------------------------------------------------------------------------------------------										
 
 Software para criar os modelos:
								 MySQL Workbench 
								 Astah Professional  --> 	Utilizada por desenvovedores JAVA
								 DBDesigner 4 	    --> Apenas p/ modelagem de dados relacinal
								 SQL Power Architect --> Para projetos grandes, trabalha com os principais SGBD's ((PostgreSQL, Oracle, MS SQL, MySQL e mais) 
								 draw.io. 			--> Ferramenta web de fácil utilização p/ desenvolver diversos diagramas e principalmente ER.
								 Oracle SQL Data Modeler
 
 Importância:
 ------------
 
 A modelagem de dados deve ser feita antes de começar a desenvolver o banco de dados em si. 

 A modelagem de dados consiste em três etapas:
 
 * Modelagem Conceitual
 * Modelagem Lógica
 * Modelagem Física
 
 
 Exemplo de Modelo Conceitual:
 -----------------------------
 O modelo conceitual é baseado no diagrama de entidade relacionamento.
  Obs: No nível conceitual, não tem chaves Pk, Fk e etc.
 
 
 ------------	(1,1)						   			(0,n) -----------------
 -- Usuario -  --------------- RELACIONAMENTO --------------- -- Comentarios --
 ------------							   				 	  -----------------	
  -- id_usuario								 		 		 	-- id_comentario 
	 nome										 	 		 	 comentario
	 email										 	 		 	 data
	 senha										 	 		 	 hora



																							
 -----------   (1,n)						   			(1,n) ----------------- 
 -- Aluno --   --------------- RELACIONAMENTO --------------- -- Disciplina --   /* Quando o relacionamento é de  n,n tem q ter 
 -----------							   				 	  -----------------	     uma tabela no meio p/ guardar as chaves 
	 nome							 		 		 	 		  nome 				 das duas tabelas */
	 telefone										 	 		  carga_horaria	  -- Chamada de entidade associativa
	 email										 	 		 	  id_disciplina
	 ra										 	 		 	 




 ------------   (1,1)						   			 (1,1) --------------
 -- Pessoa --   --------------- RELACIONAMENTO --------------- -- Endereco --   
 ------------							   				 	   --------------
	 telefone							 		 		 	 	    bairro 				
	 cpf										 	 		        estado 
	 nome										 	 		 	  

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
 
 MAPEAMENTO:
 -----------
 
  Antes de começar o analise lógica, precisa entender de mapeamento, conforme exemplificado abaixo:

 1:N O lado N recebe a FK
 N:N Nova tabela 
 1:1 União de tabelas 
 

  Exemplo de Modele Lógico:
 --------------------------
 
 Obs: No nível lógico, é obrigatório o relacionamento através das chaves:
 
 -----------   							     -----------------				   			
 -- Aluno ------------------------    	     -- Comentarios --   
 -----------					 -		     ----------------- 					   				 	  
  Pk id_usuario: inteiro 		 -	  (0,n)	  Pk id_comentario: inteiro
     nome:  varchar2(30)		 ---------	     fk_id_usuario: inteiro 
	 email: varchar2(30)					     comentario: varchar2(400)
     senha: varchar2(50)					     data: date
											     hora: varchar2(5)	

 

 -----------  			                  ----------------------			   			----------------- 
 -- Aluno --    					      -- Aluno_disciplina --						-- Disciplina --   
 -----------						      ----------------------	   					-----------------	
  PK ra: varrchar2(8)  (0,1)		  (1,n)	 Fk id_disciplina: inteiro (1,n)		 (0,1)	Pk id_disciplina: inteiro 		 	 		  
	 nome: varchar2(30)	-------------------	 Fk ra: varchar2(8)	-----------------------		   nome: varchar2(30)		  
	 telefone: varchar2(30)										 	 		 	   			   carga_horaria: inteiro 
	 email: varchar2(30)										 	 		 	 




 Obs: No relacionamento de 1:1 a regra diz que deve ser feito a união das tabelas, conforme abaixo:
 ------------
 -- Pessoa --
 ------------
 Pk cpf: varchar2(11)
	nome: varchar2(30)
	telefone: varchar2(30)
	rua: varchar2(30)
	numero: number(5)
	bairro: varchar2(30)
	cidade: varchar2(30)
	estado: number(2)
 
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

 Exemplo de Modelo Físico:
 -------------------------

 Obs: No nível físico se existe tabela com Fk, essa tabela(s) deve ser criada por último.
  
  -- RELACIONAMENTO: 1:N
  CREATE TABLE USUARIOS(ID INT AUTO_INCREMENT PRIMARY KEY,
						NOME VARCHAR2(40),
						EMAIL VARCHAR(40),
						SENHA VARCHAR2(32)		  
						);

 CREATE TABLE COMENTARIOS(ID INT AUTO_INCREMENT PRIMARY KEY,
						  COMENTARIOS VARCHAR2(400),
						  DIA DATE,
						  HORARIO VARCHAR2(5),
					  fK  FK_ID_USUARIO INT,
					      FOREIGN KEY(FK_ID_USUARIO) REFERENCES USUARIOS(ID)
						  );						
						  




 -- RELACIONAMENTO: N:N
 
  Obs: Primeiro contruir as tabelas que contém as Pk's e por fim as tabelas que contém as Fk's 


 CREATE TABLE ALUNO(RA VARCHAR2(30) PRIMARY KEY,
					NOME VARCHAR2(30),
					TELEFONE VARCHAR2(30)
					);

CREATE TABLE DISCIPLINA(ID_DISCIPLINA INT AUTO_INCREMENT PRIMARY KEY,
						NOME VARCHAR2(30),
						CARGA INT
						);

						

CREATE TABLE ALUNO_DISCIPLINA(RA VARCHAR2(30),
							  ID_DISCIPLINA INT,
							  CONSTRAINT FK_ALUNO FOREIGN KEY (RA) REFERENCES ALUNO (RA),
							  CONSTRAINT FK_DIS FOREIGN KEY (ID_DISCIPLINA) REFERENCES (ID_DISCIPLINA)
							  ):

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------							  















