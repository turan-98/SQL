CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE Veiculo(
	chassi 	CHAR(17) PRIMARY KEY,
    marca VARCHAR(10),
    modelo VARCHAR(20),
    anoFabricacao INT,
    anoModelo INT,
    combustivel CHAR(1)
);
 # CHAR(17) NÃO É obrigatorio inserir o valor 
 # com os 17 digitos  e o VACHAR(10) é obrigatorio possui
 # os 10 digitos

-- add valor para a tabela veiculo
ALTER TABLE Veiculo
ADD valor VARCHAR(20);

ALTER TABLE Veiculo
ADD motor VARCHAR(20);

ALTER TABLE Veiculo 
-- apagando o campo motor
DROP COLUMN motor;

-- criando index para ganhar velocidade de acesso
CREATE INDEX VeiculoMarcaModelo on Veiculo (marca,modelo);

-- apagando o index
DROP INDEX VeiculoMarcaModelo on Veiculo;

DROP TABLE Veiculo;

USE MASTER;
DROP DATABASE concessionaria;


