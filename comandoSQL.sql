use empresa;
DESC funcionarios;
SELECT Nome,Salario FROM funcionarios WHERE Salario >= 1000;
SELECT Nome,Cidade FROM funcionarios; 

-- SELECIONA OS CAMPOS NOME E CIDADE QUE NÃO ESTÃO VAZIOS 
SELECT Nome,Cargo FROM funcionarios WHERE Cargo IS NOT NULL;

-- SELECIONA O CAMPO PAIS E PEGA O SALARIO ENTRE 300 E 14000
SELECT Pais FROM funcionarios WHERE Salario BETWEEN 300 AND 14000;

-- SELECIONA AS CIDADES ONDE TEM AS PALAVRAS (DO)
SELECT Cidade FROM funcionarios WHERE Cidade LIKE '%do%';

-- PEGA ADATA E DIVIDE ELA EM DIA,MES E ANO 
SELECT Nome,day(DataNasc), month(DataNasc), year(DataNasc) FROM funcionarios;

-- ALTERA O NOME DO CMAPO E BUSCA O NOME
SELECT DISTINCT MONTHNAME(DataNasc) as gisele FROM funcionarios ORDER BY gisele;
-- altera o nome da tabela DISTINCT
SELECT DISTINCT MONTH(Datanasc) as FOME  From funcionarios ORDER BY FOME asc;
