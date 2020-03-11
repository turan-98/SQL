Use Pessoa_Veiculo;
-- exercicio 1 
--SELECT 
--	c.NomeCidade,u.nomeUF
--FROM 
--	Cidade c
--INNER JOIN 
--UF u on u.IdUF = c.IdUF

--*---

--exercicio 2
-- SELECT 
--	p.NomePessoa,c.NomeCidade as 'chá com pão'
--FROM 
	--Pessoa p
--INNER JOIN 
  -- Cidade c on c.IdCidade = p.CidadeReside

  --*---

--exercicio 3
--SELECT 
--	P.NomePessoa, c.idUf, c.NomeCidade
--FROM
-- Pessoa p
--INNER JOIN
--Cidade c on c.IdCidade = p.CidadeReside
--*---

--EXERCICIO 4---
SELECT
	p.NomePessoa, v.Placa, v.Ano, c.NomeCidade
 From 
	Pessoa p
INNER JOIN
	Veiculo v on v.IdPessoa = p.IdPessoa
Inner join 
	Cidade c on C.IdCidade = v.Cidade
ORDER BY 1
--*--
-- terminar 
SELECT 
	p.nomePessoa, v.Placa, v.Cor, F.NomeFabricante, p.CidadeReside
from 
 Veiculo v
inner join Fabricante f on v.Marca = f.IdFabricante

