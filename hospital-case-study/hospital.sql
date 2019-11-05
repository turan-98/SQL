CREATE database Hospital;
DROP DATABASE Hospital;
USE Hospital; 

CREATE TABLE MEDICOS(
	CodMedico INT AUTO_INCREMENT PRIMARY KEY,
	Especialidade VARCHAR(50) NOT NULL,
   	Idpaciente INT NOT NULL,
    	CONSTRAINT fk_idPaciente FOREIGN KEY(Idpaciente) REFERENCES PACIENTE (Idpaciente)
);

CREATE TABLE PACIENTE(
	Idpaciente INT AUTO_INCREMENT PRIMARY KEY,
    	Nome VARCHAR(50) NOT NULL,
    	RG VARCHAR(11) NOT NULL,
    	Endereco VARCHAR(60) NOT NULL,
    	Cidade VARCHAR(60) NOT NULL,
    	TELEFONE VARCHAR(24) NOT NULL,
	CodMedico INT NOT NULL,
    	CONSTRAINT fk_codDocto FOREIGN KEY (CodMedico) REFERENCES MEDICOS (CodMedico)
);


CREATE TABLE MEDICACAO(
	nomeRemedio VARCHAR(80) NOT NULL,
	CodDroga INT auto_increment PRIMARY KEY,
    	IdDoenca INT not null,
    	CONSTRAINT fk_doenca FOREIGN KEY(IdDoenca) REFERENCES DOENCA (IdDoenca)
);

CREATE TABLE QUARTO_LEITO(
	Idquarto INT AUTO_INCREMENT PRIMARY KEY,
    	internacao boolean NOT NULL,
    	Idpaciente INT NOT NULL,
    	CONSTRAINT fk_idPacientes FOREIGN KEY(idpaciente) REFERENCES PACIENTE (Idpaciente)
);


CREATE TABLE DOENCA(
	IdDoenca INT auto_increment PRIMARY KEY,
    	Nome_doenca VARCHAR(80) NOT NULL,
    	Idpaciente INT NOT NULL,
    	CONSTRAINT fk_idPacient FOREIGN KEY(idpaciente) REFERENCES PACIENTE (Idpaciente)
    
);

    
CREATE TABLE TRATAMENTOS(
	IdTratamentos INT AUTO_INCREMENT PRIMARY KEY,
   	CodMedico INT NOT NULL,
    	CONSTRAINT fk_codDoutor FOREIGN KEY (CodMedico) REFERENCES MEDICOS (CodMedico),
    	IdDoenca INT not null,
    	CONSTRAINT fk_doencas FOREIGN KEY(IdDoenca) REFERENCES DOENCA (IdDoenca),
     	Idpaciente INT NOT NULL,
    	CONSTRAINT fk_id_pacient FOREIGN KEY(idpaciente) REFERENCES PACIENTE (Idpaciente)
   
)
    
    
