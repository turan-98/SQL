CREATE DATABASE Empresa;
 USE Empresa;
CREATE TABLE Fornecedores(
	CodFor		INT NOT NULL AUTO_INCREMENT,
	Empresa		VARCHAR(40),
	Contato		VARCHAR(30),
	Cargo		VARCHAR(30),
	Endereco	VARCHAR(60),
	Cidade		VARCHAR(15),
	CEP		VARCHAR(10),
	Pais		VARCHAR(15),
	PRIMARY KEY (CodFor)
);

CREATE TABLE Categorias(
	CodCategoria	INT NOT NULL AUTO_INCREMENT,
	Descr			VARCHAR(15),
	PRIMARY KEY (CodCategoria)
);

CREATE TABLE Clientes(
	CodCli		CHAR(5) NOT NULL,
	Nome		VARCHAR(40) NOT NULL,
	Contato		VARCHAR(30) NOT NULL,
	Cargo		VARCHAR(30) NOT NULL,
	Endereco	VARCHAR(60) NOT NULL,
	Cidade		VARCHAR(15) NOT NULL,
	Regiao		VARCHAR(15) NOT NULL,
	CEP			VARCHAR(10) NOT NULL,
	Pais		VARCHAR(15) NOT NULL,
	Telefone	VARCHAR(24) NOT NULL,
	Fax			VARCHAR(24) NOT NULL,
	PRIMARY KEY(CodCli)
);
CREATE TABLE Funcionarios(
	CodFun		INT NOT NULL AUTO_INCREMENT,
	Sobrenome	VARCHAR(20),
	Nome		VARCHAR(10),
	Cargo		VARCHAR(30),
	DataNasc	DATE,
	Endereco	VARCHAR(60),
	Cidade		VARCHAR(15),
	CEP		VARCHAR(10),
	Pais		VARCHAR(15),
	Fone		VARCHAR(24),
	Salario		DECIMAL DEFAULT 0.0,
	PRIMARY KEY (CodFun)
);
CREATE TABLE Produtos(
	CodProd		INT NOT NULL AUTO_INCREMENT,
	Descr		VARCHAR(40),
	CodFor		INT ,
	CodCategoria	INT ,
	Preco		DECIMAL DEFAULT 0.0,
	Unidades	SMALLINT DEFAULT 0 ,
	Descontinuado	BIT ,
	PRIMARY KEY (CodProd),
	FOREIGN KEY (CodCategoria) REFERENCES Categorias(CodCategoria) ON DELETE CASCADE,
	FOREIGN KEY (CodFor) REFERENCES Fornecedores(CodFor) ON DELETE CASCADE
);

CREATE TABLE Pedidos(
	NumPed		INT NOT NULL,
	CodCli		CHAR(5),
	CodFun		INT DEFAULT 0 ,
	DataPed		DATE,
	DataEntrega	DATE,
	Frete		FLOAT DEFAULT 0.0,
	PRIMARY KEY (NumPed),
	FOREIGN KEY (CodCli) REFERENCES Clientes(CodCli) ON DELETE CASCADE,
	FOREIGN KEY (CodFun) REFERENCES Funcionarios(CodFun) ON DELETE CASCADE
);


CREATE TABLE DetalhesPed(
	NumPed		INT ,
	CodProd		INT  ,
	Preco		DECIMAL,
	Qtde		SMALLINT ,
	Desconto	FLOAT,
	PRIMARY KEY (NumPed, CodProd),
	FOREIGN KEY (NumPed) REFERENCES Pedidos(NumPed) ON DELETE CASCADE,
	FOREIGN KEY (CodProd) REFERENCES Produtos(CodProd) ON DELETE CASCADE
);

-- DATE FORMAT
-- SELECT date_format(DataPed,DataEntrega,"%y %m %d") FROM Pedidos;



-- INSERT


INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Exotic Liquids','Charlotte Cooper','Gerente de Encomendas','49 Gilbert St.','London','EC1 4SD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New Orleans Cajun Delights','Shelley Burke','Administrador de Pedidos','P.O. Box 78934','New Orleans','70117','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Grandma Kelly s Homestead','Regina Murphy','Representante de Vendas','707 Oxford Rd.','Ann Arbor','48104','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Tokyo Traders','Yoshi Nagase','Gerente de Marketing','9-8 SekimaiMusashino-shi','Tokyo','100','Japão');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Cooperativa de Quesos  Las Cabras ','Antonio del Valle Saavedra ','Administrador de Exportação','Calle del Rosal 4','Oviedo','33007','Espanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Mayumi s','Mayumi Ohno','Representante de Marketing','92 Setsuko Chuo-ku','Osaka','545','Japão');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pavlova, Ltd.','Ian Devling','Gerente de Marketing','74 Rose St.Moonie Ponds','Melbourne','3058','Austrália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Specialty Biscuits, Ltd.','Peter Wilson','Representante de Vendas','29 King s Way','Manchester','M14 GSD','Reino Unido');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('PB Knäckebröd AB','Lars Peterson','Agente de Vendas','Kaloadagatan 13','Göteborg','S-345 67','Suécia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Refrescos Americanas LTDA','Carlos Diaz','Gerente de Marketing','Av. das Americanas 12.890','São Paulo','5442','Brasil');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Heli Süßwaren GmbH & Co. KG','Petra Winkler','Gerente de Vendas','Tiergartenstraße 5','Berlin','10785','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Plutzer Lebensmittelgroßmärkte AG','Martin Bein','Ger. Marketing Internacional','Bogenallee 51','Frankfurt','60439','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Nord-Ost-Fisch Handelsgesellschaft mbH','Sven Petersen','Coord. Mercados Estrangeiros','Frahmredder 112a','Cuxhaven','27478','Alemanha');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Formaggi Fortini s.r.l.','Elio Rossi','Representante de Vendas','Viale Dante, 75','Ravenna','48100','Itália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Norske Meierier','Beate Vileid','Gerente de Marketing','Hatlevegen 5','Sandvika','1320','Noruega');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Bigfoot Breweries','Cheryl Saylor','Rep. Financeiro Local','3400 - 8th AvenueSuite 210','Bend','97101','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Svensk Sjöföda AB','Michael Björn','Representante de Vendas','Brovallavägen 231','Stockholm','S-123 45','Suécia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Aux joyeux ecclésiastiques','Guylène Nodier','Gerente de Vendas','203, Rue des Francs-Bourgeois','Paris','75004','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('New England Seafood Cannery','Robb Merchant','Agente Financeiro de Atacado','Order Processing Dept.2100 Paul Revere Blvd.','Boston','02134','EUA');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Leka Trading','Chandra Leka','Proprietário','471 Serangoon Loop, Suite #402','Singapore','0512','Cingapura');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Lyngbysild','Niels Petersen','Gerente de Vendas','LyngbysildFiskebakken 10','Lyngby','2800','Dinamarca');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Zaanse Snoepfabriek','Dirk Luchte','Gerente Financeiro','VerkoopRijnweg 22','Zaandam','9999 ZZ','Paises Baixos');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Karkki Oy','Anne Heikkonen','Gerente do Produto','Valtakatu 12','Lappeenranta','53120','Finlândia');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('G day, Mate','Wendy Mackenzie','Representante de Vendas','170 Prince Edward ParadeHunter s Hill','Sydney','2042','Austrália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Ma Maison','Jean-Guy Lauzon','Gerente de Marketing','2960 Rue St. Laurent','Montréal','H1J 1C3','Canadá');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Pasta Buttini s.r.l.','Giovanni Giudici','Administrador de Pedidos','Via dei Gelsomini, 153','Salerno','84100','Itália');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Escargots Nouveaux','Marie Delamare','Gerente de Vendas','22, rue H. Voiron','Montceau','71300','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Gai pâturage','Eliane Noz','Representante de Vendas','Bat. B3, rue des Alpes','Annecy','74000','França');
INSERT INTO Fornecedores(Empresa,Contato,Cargo,Endereco,Cidade,CEP,Pais) VALUES ('Forêts d érables','Chantal Goulet','Gerente Financeiro','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canadá');


-------------------
-- Dados Categorias
-------------------

INSERT INTO Categorias(Descr) VALUES ('Bebidas');
INSERT INTO Categorias(Descr) VALUES ('Condimentos');
INSERT INTO Categorias(Descr) VALUES ('Confeitos');
INSERT INTO Categorias(Descr) VALUES ('Laticínios');
INSERT INTO Categorias(Descr) VALUES ('Grãos/Cereais');
INSERT INTO Categorias(Descr) VALUES ('Carnes/Aves');
INSERT INTO Categorias(Descr) VALUES ('Hortigranjeiros');
INSERT INTO Categorias(Descr) VALUES ('Frutos do Mar');


-- Dados Clientes

-- SELECT * FROM  Clientes
-- INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('DUMON','Du monde entier','Janine Labrune','Proprietário','67, rue des Cinquante Otages','Nantes','','44000','França','40.67.88.88','40.67.89.89');

INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('EASTC','Eastern Connection','Ann Devon','Agente de Vendas','35 King George','London','','WX3 6FW','Reino Unido','(171) 555-0297','(171) 555-3373');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ERNSH','Ernst Handel','Roland Mendel','Gerente de Vendas','Kirchgasse 6','Graz','','8010','Áustria','7675-3425','7675-3426');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FAMIA','Familia Arquibaldo','Aria Cruz','Assistente de Marketing','Rua Orós, 92','São Paulo','SP','05442-030','Brasil','(11) 555-9857','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Diego Roel','Gerente Financeiro','C/ Moralzarzal, 86','Madrid','','28034','Espanha','(91) 555 94 44','(91) 555 55 93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLIG','Folies gourmandes','Martine Rancé','Assistente do Agente de Vendas','184, chaussée de Tournai','Lille','','59000','França','20.16.10.16','20.16.10.17');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FOLKO','Folk och fä HB','Maria Larsson','Proprietário','Åkergatan 24','Bräcke','','S-844 67','Suécia','0695-34 67 21','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANK','Frankenversand','Peter Franken','Gerente de Marketing','Berliner Platz 43','München','','80805','Alemanha','089-0877310','089-0877451');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANR','France restauration','Carine Schmitt','Gerente de Marketing','54, rue Royale','Nantes','','44000','França','40.32.21.21','40.32.21.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FRANS','Franchi S.p.A.','Paolo Accorti','Representante de Vendas','Via Monte Bianco 34','Torino','','10100','Itália','011-4988260','011-4988261');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('FURIB','Furia Bacalhau e Frutos do Mar','Lino Rodriguez ','Gerente de Vendas','Jardim das rosas n. 32','Lisboa','','1675','Portugal','(1) 354-2534','(1) 354-2535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GALED','Galería del gastrónomo','Eduardo Saavedra','Gerente de Marketing','Rambla de Cataluña, 23','Barcelona','','08022','Espanha','(93) 203 4560','(93) 203 4561');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GODOS','Godos Cocina Típica','José Pedro Freyre','Gerente de Vendas','C/ Romero, 33','Sevilla','','41101','Espanha','(95) 555 82 82','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GOURL','Gourmet Lanchonetes','André Fonseca','Assessor de Vendas','Av. Brasil, 442','Campinas','SP','04876-786','Brasil','(11) 555-9482','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GREAL','Great Lakes Food Market','Howard Snyder','Gerente de Marketing','2732 Baker Blvd.','Eugene','OR','97403','EUA','(503) 555-7555','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('GROSR','GROSELLA-Restaurante','Manuel Pereira','Proprietário','5ª Ave. Los Palos Grandes','Caracas','DF','1081','Venezuela','(2) 283-2951','(2) 283-3397');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HANAR','Hanari Carnes','Mario Pontes','Gerente Financeiro','Rua do Paço, 67','Rio de Janeiro','RJ','05454-876','Brasil','(21) 555-0091','(21) 555-8765');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HILAA','HILARIÓN-Abastos','Carlos Hernández','Representante de Vendas','Carrera 22 con Ave. Carlos Soublette #8-35','San Cristóbal','Táchira','5022','Venezuela','(5) 555-1340','(5) 555-1948');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGC','Hungry Coyote Import Store','Yoshi Latimer','Representante de Vendas','City Center Plaza 516 Main St.','Elgin','OR','97827','EUA','(503) 555-6874','(503) 555-2376');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('HUNGO','Hungry Owl All-Night Grocers','Patricia McKenna','Assessor de Vendas','8 Johnstown Road','Cork','Co. Cork','','Irlanda','2967 542','2967 3333');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ISLAT','Island Trading','Helen Bennett','Gerente de Marketing','Garden House Crowther Way','Cowes','Isle of Wigth','PO31 7PJ','Reino Unido','(198) 555-8888','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('KOENE','Königlich Essen','Philip Cramer','Assessor de Vendas','Maubelstr. 90','Brandenburg','','14776','Alemanha','0555-09876','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LACOR','La corne d abondance','Daniel Tonini','Representante de Vendas','67, avenue de l Europe','Versailles','','78000','França','30.59.84.10','30.59.85.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAMAI','La maison d Asie','Annette Roulet','Gerente de Vendas','1 rue Alsace-Lorraine','Toulouse','','31000','França','61.77.61.10','61.77.61.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAUGB','Laughing Bacchus Wine Cellars','Yoshi Tannamuri','Assistente de Marketing','1900 Oak St.','Vancouver','BC','V3F 2K1','Canadá','(604) 555-3392','(604) 555-7293');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LAZYK','Lazy K Kountry Store','John Steel','Gerente de Marketing','12 Orchestra Terrace','Walla Walla','WA','99362','EUA','(509) 555-7969','(509) 555-6221');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LEHMS','Lehmanns Marktstand','Renate Messner','Representante de Vendas','Magazinweg 7','Frankfurt a.M. ','','60528','Alemanha','069-0245984','069-0245874');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LETSS','Let s Stop N Shop','Jaime Yorres','Proprietário','87 Polk St. Suite 5','San Francisco','CA','94117','EUA','(415) 555-5938','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LILAS','LILA-Supermercado','Carlos González','Gerente Financeiro','Carrera 52 con Ave. Bolívar #65-98 Llano Largo','Barquisimeto','Lara','3508','Venezuela','(9) 331-6954','(9) 331-7256');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LINOD','LINO-Delicateses','Felipe Izquierdo','Proprietário','Ave. 5 de Mayo Porlamar','I. de Margarita','Nueva Esparta','4980','Venezuela','(8) 34-56-12','(8) 34-93-93');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('LONEP','Lonesome Pine Restaurant','Fran Wilson','Gerente de Vendas','89 Chiaroscuro Rd.','Portland','OR','97219','EUA','(503) 555-9573','(503) 555-9646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAGAA','Magazzini Alimentari Riuniti','Giovanni Rovelli','Gerente de Marketing','Via Ludovico il Moro 22','Bergamo','','24100','Itália','035-640230','035-640231');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MAISD','Maison Dewey','Catherine Dewey','Agente de Vendas','Rue Joseph-Bens 532','Bruxelles','','B-1180','Bélgica','(02) 201 24 67','(02) 201 24 68');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MEREP','Mère Paillarde','Jean Fresnière','Assistente de Marketing','43 rue St. Laurent','Montréal','Québec','H1J 1C3','Canadá','(514) 555-8054','(514) 555-8055');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('MORGK','Morgenstern Gesundkost','Alexander Feuer','Assistente de Marketing','Heerstr. 22','Leipzig','','04179','Alemanha','0342-023176','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('NORTS','North/South','Simon Crowther','Assessor de Vendas','South House 300 Queensbridge','London','','SW7 1RZ','Reino Unido','(171) 555-7733','(171) 555-2530');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OCEAN','Océano Atlántico Ltda.','Yvonne Moncada','Agente de Vendas','Ing. Gustavo Moncada 8585 Piso 20-A','Buenos Aires','','1010','Argentina','(1) 135-5333','(1) 135-5535');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OLDWO','Old World Delicatessen','Rene Phillips','Representante de Vendas','2743 Bering St.','Anchorage','AK','99508','EUA','(907) 555-7584','(907) 555-2880');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('OTTIK','Ottilies Käseladen','Henriette Pfalzheim','Proprietário','Mehrheimerstr. 369','Köln','','50739','Alemanha','0221-0644327','0221-0765721');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PARIS','Paris spécialités','Marie Bertrand','Proprietário','265, boulevard Charonne','Paris','','75012','França','(1) 42.34.22.66','(1) 42.34.22.77');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PERIC','Pericles Comidas clásicas','Guillermo Fernández','Representante de Vendas','Calle Dr. Jorge Cash 321','México D.F.','','05033','México','(5) 552-3745','(5) 545-3745');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PICCO','Piccolo und mehr','Georg Pipps','Gerente de Vendas','Geislweg 14','Salzburg','','5020','Áustria','6562-9722','6562-9723');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('PRINI','Princesa Isabel Vinhos','Isabel de Castro','Representante de Vendas','Estrada da saúde n. 58','Lisboa','','1756','Portugal','(1) 356-5634','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEDE','Que Delícia','Bernardo Batista','Gerente Financeiro','Rua da Panificadora, 12','Rio de Janeiro','RJ','02389-673','Brasil','(21) 555-4252','(21) 555-4545');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUEEN','Queen Cozinha','Lúcia Carvalho','Assistente de Marketing','Alameda dos Canàrios, 891','São Paulo','SP','05487-020','Brasil','(11) 555-1189','');

INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('QUICK','QUICK-Stop','Horst Kloss','Gerente Financeiro','Taucherstraße 10','Cunewalde','','01307','Alemanha','0372-035188','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RANCH','Rancho grande','Sergio Gutiérrez','Representante de Vendas','Av. del Libertador 900','Buenos Aires','','1010','Argentina','(1) 123-5555','(1) 123-5556');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RATTC','Rattlesnake Canyon Grocery','Paula Wilson','Assistente do Repr. de Vendas','2817 Milton Dr.','Albuquerque','NM','87110','EUA','(505) 555-5939','(505) 555-3620');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('REGGC','Reggiani Caseifici','Maurizio Moroni','Assessor de Vendas','Strada Provinciale 124','Reggio Emilia','','42100','Itália','0522-556721','0522-556722');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICAR','Ricardo Adocicados','Janete Limeira','Assistente do Agente de Vendas','Av. Copacabana, 267','Rio de Janeiro','RJ','02389-890','Brasil','(21) 555-3412','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('RICSU','Richter Supermarkt','Michael Holz','Gerente de Vendas','Grenzacherweg 237','Genève','','1203','Suíça','0897-034214','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('ROMEY','Romero y tomillo','Alejandra Camino','Gerente Financeiro','Gran Vía, 1','Madrid','','28001','Espanha','(91) 745 6200','(91) 745 6210');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SANTG','Santé Gourmet','Jonas Bergulfsen','Proprietário','Erling Skakkes gate 78','Stavern','','4110','Noruega','07-98 92 35','07-98 92 47');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SAVEA','Save-a-lot Markets','Jose Pavarotti','Representante de Vendas','187 Suffolk Ln.','Boise','ID','83720','EUA','(208) 555-8097','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SEVES','Seven Seas Imports','Hari Kumar','Gerente de Vendas','90 Wadhurst Rd.','London','','OX15 4NB','Reino Unido','(171) 555-1717','(171) 555-5646');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SIMOB','Simons bistro','Jytte Petersen','Proprietário','Vinbæltet 34','København','','1734','Dinamarca','31 12 34 56','31 13 35 57');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPECD','Spécialités du monde','Dominique Perrier','Gerente de Marketing','25, rue Lauriston','Paris','','75016','França','(1) 47.55.60.10','(1) 47.55.60.20');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SPLIR','Split Rail Beer & Ale','Art Braunschweiger','Gerente de Vendas','P.O. Box 555','Lander','WY','82520','EUA','(307) 555-4680','(307) 555-6525');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('SUPRD','Suprêmes délices','Pascale Cartrain','Gerente Financeiro','Boulevard Tirou, 255','Charleroi','','B-6000','Bélgica','(071) 23 67 22 20','(071) 23 67 22 21');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THEBI','The Big Cheese','Liz Nixon','Gerente de Marketing','89 Jefferson Way Suite 2','Portland','OR','97201','EUA','(503) 555-3612','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('THECR','The Cracker Box','Liu Wong','Assistente de Marketing','55 Grizzly Peak Rd.','Butte','MT','59801','EUA','(406) 555-5834','(406) 555-8083');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TOMSP','Toms Spezialitäten','Karin Josephs','Gerente de Marketing','Luisenstr. 48','Münster','','44087','Alemanha','0251-031259','0251-035695');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TORTU','Tortuga Restaurante','Miguel Angel Paolino','Proprietário','Avda. Azteca 123','México D.F.','','05033','México','(5) 555-2933','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRADH','Tradição Hipermercados','Anabela Domingues','Representante de Vendas','Av. Inês de Castro, 414','São Paulo','SP','05634-030','Brasil','(11) 555-2167','(11) 555-2168');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('TRAIH','Trail s Head Gourmet Provisioners','Helvetius Nagy','Assessor de Vendas','722 DaVinci Blvd.','Kirkland','WA','98034','EUA','(206) 555-8257','(206) 555-2174');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VAFFE','Vaffeljernet','Palle Ibsen','Gerente de Vendas','Smagsløget 45','Århus','','8200','Dinamarca','86 21 32 43','86 22 33 44');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VICTE','Victuailles en stock','Mary Saveley','Agente de Vendas','2, rue du Commerce','Lyon','','69004','França','78.32.54.86','78.32.54.87');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('VINET','Vins et alcools Chevalier','Paul Henriot','Gerente Financeiro','59 rue de l Abbaye','Reims','','51100','França','26.47.15.10','26.47.15.11');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WANDK','Die Wandernde Kuh','Rita Müller','Representante de Vendas','Adenauerallee 900','Stuttgart','','70563','Alemanha','0711-020361','0711-035428');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WARTH','Wartian Herkku','Pirkko Koskitalo','Gerente Financeiro','Torikatu 38','Oulu','','90110','Finlândia','981-443655','981-443655');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WELLI','Wellington Importadora','Paula Parente','Gerente de Vendas','Rua do Mercado, 12','Resende','SP','08737-363','Brasil','(14) 555-8122','');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WHITC','White Clover Markets','Karl Jablonski','Proprietário','305 - 14th Ave. S. Suite 3B','Seattle','WA','98128','EUA','(206) 555-4112','(206) 555-4115');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WILMK','Wilman Kala','Matti Karttunen','Proprietário/Assist. Marketing','Keskuskatu 45','Helsinki','','21240','Finlândia','90-224 8858','90-224 8858');
INSERT INTO Clientes(CodCli,Nome,Contato,Cargo,Endereco,Cidade,Regiao,CEP,Pais,Telefone,Fax) VALUES ('WOLZA','Wolski  Zajazd','Zbyszek Piestrzeniewicz','Proprietário','ul. Filtrowa 68','Warszawa','','01-012','Polônia','(26) 642-7012','(26) 642-7012');

---------------------
-- Dados Funcionarios
---------------------
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Davolio','Nancy','Representante de Vendas','1968-12-08','507 - 20th Ave. E.Apt. 2A','Seattle','98122','EUA','(206) 555-9857',5000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Fuller','Andrew','Vice-Presidente de Vendas','1952-02-19','908 W. Capital Way','Tacoma','98401','EUA','(206) 555-9482',10000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Leverling','Janet','Representante de Vendas','1963-08-30','722 Moss Bay Blvd.','Kirkland','98033','EUA','(206) 555-3412',12000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Peacock','Margaret','Representante de Vendas','1958-09-19','4110 Old Redmond Rd.','Redmond','98052','EUA','(206) 555-8122',4500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Buchanan','Steven','Gerente de Vendas','1955-03-04','14 Garrett Hill','London','SW1 8JR','Reino Unido','(71) 555-4848',11000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Suyama','Michael','Representante de Vendas','1963-07-02','Coventry House Miner Rd.','London','EC2 7JR','Reino Unido','(71) 555-7773',8000);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('King','Robert','Representante de Vendas','1960-05-29','Edgeham Hollow Winchester Way','London','RG1 9SP','Reino Unido','(71) 555-5598',11500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Callahan','Laura','Coordenador de Vendas Internas','1958-01-09','4726 - 11th Ave. N.E.','Seattle','98105','EUA','(206) 555-1189',9500);
INSERT INTO Funcionarios(Sobrenome,Nome,Cargo,DataNasc,Endereco,Cidade,CEP,Pais,Fone,Salario) VALUES ('Dodsworth','Anne','Representante de Vendas','1969-07-02','7 Houndstooth Rd.','London','WG2 7LT','Reino Unido','(71) 555-4444',4000);

-----------------
-- Dados Produtos
-----------------
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chai',1,1,18,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chang',1,1,19,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Aniseed Syrup',1,2,10,13,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton´s Cajun Seasoning',2,2,22,53,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chef Anton´s Gumbo Mix',2,2,21.35,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Grandma´s Boysenberry Spread',3,2,25,120,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Uncle Bob´s Organic Dried Pears',3,7,30,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Northwoods Cranberry Sauce',3,2,40,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mishi Kobe Niku',4,6,97,29,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ikura',4,8,31,31,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Cabrales',5,4,21,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Queso Manchego La Pastora',5,4,38,86,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Konbu',6,8,6,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tofu',6,7,23.25,35,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Genen Shouyu',6,2,15.5,39,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Pavlova',7,3,17.45,29,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Alice Mutton',7,6,39,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Carnarvon Tigers',7,8,62.5,42,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Teatime Chocolate Biscuits',8,3,9.2,25,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney´s Marmalade',8,3,81,40,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sir Rodney´s Scones',8,3,10,3,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gustaf´s Knäckebröd',9,5,21,104,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tunnbröd',9,5,9,61,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Guaraná Fantástica',10,1,4.5,20,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('NuNuCa Nuß-Nougat-Creme',11,3,14,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gumbär Gummibärchen',11,3,31.23,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Schoggi Schokolade',11,3,43.9,49,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Rössle Sauerkraut',12,7,45.6,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Thüringer Rostbratwurst',12,6,123.79,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Nord-Ost Matjeshering',13,8,25.89,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gorgonzola Telino',14,4,12.5,0,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mascarpone Fabioli',14,4,32,9,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Geitost',15,4,2.5,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sasquatch Ale',16,1,14,111,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Steeleye Stout',16,1,18,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Inlagd Sill',17,8,19,112,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gravad lax',17,8,26,11,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Côte de Blaye',18,1,263.5,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chartreuse verte',18,1,18,69,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Boston Crab Meat',19,8,18.4,123,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Jack´s New England Clam Chowder',19,8,9.65,85,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Singaporean Hokkien Fried Mee',20,5,14,26,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ipoh Coffee',20,1,46,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gula Malacca',20,2,19.45,27,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Røgede sild',21,8,9.5,5,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Spegesild',21,8,12,95,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Zaanse koeken',22,3,9.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Chocolade',22,3,12.75,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Maxilaku',23,3,20,10,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Valkoinen suklaa',23,3,16.25,65,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Manjimup Dried Apples',24,7,53,20,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Filo Mix',24,5,7,38,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Perth Pasties',24,6,32.8,0,1);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tourtière',25,6,7.45,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Pâté chinois',25,6,24,115,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gnocchi di nonna Alice',26,5,38,21,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Ravioli Angelo',26,5,19.5,36,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Escargots de Bourgogne',27,8,13.25,62,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Raclette Courdavault',28,4,55,79,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Camembert Pierrot',28,4,34,19,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Sirop d´érable',29,2,28.5,113,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Tarte au sucre',29,3,49.3,17,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Vegie-spread',7,2,43.9,24,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Wimmers gute Semmelknödel',12,5,33.25,22,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Fiery Hot Pepper Sauce',2,2,21.05,76,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Louisiana Hot Spiced Okra',2,2,17,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Laughing Lumberjack Lager',16,1,14,52,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Scottish Longbreads',8,3,12.5,6,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Gudbrandsdalsost',15,4,36,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Outback Lager',7,1,15,15,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Fløtemysost',15,4,21.5,26,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Mozzarella di Giovanni',14,4,34.8,14,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Röd Kaviar',17,8,15,101,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Longlife Tofu',4,7,10,4,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Rhönbräu Klosterbier',12,1,7.75,125,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Lakkalikööri',23,1,18,57,0);
INSERT INTO Produtos(Descr,CodFor,CodCategoria,Preco,Unidades,Descontinuado) VALUES ('Original Frankfurter grüne Soße',12,2,13,32,0);



INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10957,'HILAA',8,'1998/03/18','1998/04/15', 105.36);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10958,'OCEAN',7,'1998/03/18','1998/04/15', 49.56);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10959,'GOURL',6,'1998/03/18','1998/04/29', 4.98);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10960,'HILAA',3,'1998/03/19','1998/04/02', 2.08);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10961,'QUEEN',8,'1998/03/19','1998/04/16', 104.47);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10962,'QUICK',8,'1998/03/19','1998/04/16', 275.79);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10963,'FURIB',9,'1998/03/19','1998/04/16', 2.70);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10964,'SPECD',3,'1998/03/20','1998/04/17', 87.38);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10965,'OLDWO',6,'1998/03/20','1998/04/17', 144.38);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10966,'CHOPS',4,'1998/03/20','1998/04/17', 27.19);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10967,'TOMSP',2,'1998/03/23','1998/04/20', 62.22);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10968,'ERNSH',1,'1998/03/23','1998/04/20', 74.60);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10969,'COMMI',1,'1998/03/23','1998/04/20', 0.21);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10970,'BOLID',9,'1998/03/24','1998/04/07', 16.16);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10971,'FRANR',2,'1998/03/24','1998/04/21', 121.82);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10972,'LACOR',4,'1998/03/24','1998/04/21', 0.02);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10973,'LACOR',6,'1998/03/24','1998/04/21', 15.17);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10974,'SPLIR',3,'1998/03/25','1998/04/08', 12.96);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10975,'BOTTM',1,'1998/03/25','1998/04/22', 32.27);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10976,'HILAA',1,'1998/03/25','1998/05/06', 37.97);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10977,'FOLKO',8,'1998/03/26','1998/04/23', 208.50);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10978,'MAISD',9,'1998/03/26','1998/04/23', 32.82);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10979,'ERNSH',8,'1998/03/26','1998/04/23', 353.07);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10980,'FOLKO',4,'1998/03/27','1998/05/08', 1.26);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10981,'HANAR',1,'1998/03/27','1998/04/24', 193.37);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10982,'BOTTM',2,'1998/03/27','1998/04/24', 14.01);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10983,'SAVEA',2,'1998/03/27','1998/04/24', 657.54);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10984,'SAVEA',1,'1998/03/30','1998/04/27', 211.22);
INSERT INTO Pedidos(NumPed,CodCli,CodFun,DataPed,DataEntrega,Frete) VALUES (10985,'HUNGO',2,'1998/03/30','1998/04/27', 91.51);


