CREATE DATABASE Netflix;
use Netflix;

CREATE TABLE Funcionario(
	IdFuncionario INT NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(80),
	cidade VARCHAR(80) NOT NULL,
	estdado CHAR(2) NOT NULL,
	emaiL VARCHAR(80) NOT NULL,
	dataNascTo date NOT NULL
);

CREATE INDEX NetflixFuncionario on Funcionario(email,nome);

DESCRIBE funcionario;



INSERT INTO Funcionario(idFuncionario, nome,endereco,cidade,estdado,email, dataNascto) VALUES
(6,'dias','av Paulista','ITu','SP','dia@GMAIL.COM','1991-03-31');
 
 ALTER TABLE funcionario
 DROP COLUMN estdado;
 
