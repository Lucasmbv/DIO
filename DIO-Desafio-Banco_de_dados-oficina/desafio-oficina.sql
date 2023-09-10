-- Criação do BD para o cenário de E-commerce
CREATE DATABASE oficina;
USE oficina;

-- Criar tabela cliente 
CREATE TABLE clients( 
	IdClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    SocialName VARCHAR(255),
    CNPJ CHAR(15),
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF),
    CONSTRAINT unique_cnpj_client UNIQUE (CNPJ)
);
ALTER TABLE clients AUTO_INCREMENT=1;
SELECT * FROM clients;

-- Criar tabela produto
CREATE TABLE servico( 
	Idservico INT AUTO_INCREMENT PRIMARY KEY,
    ServeName VARCHAR(10) NOT NULL,
    Category ENUM('Eletrico', 'Pintura', 'Motor', 'Capotaria', 'Outro'),
    Duracao FLOAT DEFAULT 24,
    Valor FLOAT
);
ALTER TABLE servico AUTO_INCREMENT=1;
SELECT * FROM servico;

CREATE TABLE objetoServe(
	idObjeto INT PRIMARY KEY,
    idclient INT NOT NULL,
    objname VARCHAR(15),
    CONSTRAINT fk_obj_client FOREIGN KEY (idObjeto) REFERENCES clients(IdClient)
);

-- Criar tabela pagamentos
CREATE TABLE payments(
	IdPayment INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    IdClient INT,
    TypePayment ENUM('Dinheiro', 'Boleto', 'Cartão', 'Dois cartões'),
    Valor FLOAT,
    CONSTRAINT fk_pay_client FOREIGN KEY (IdClient) REFERENCES clients(IdClient)
);
SELECT * FROM payments;

-- Criar tabela funcionario
CREATE TABLE funcionario(
	IdFunc INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    Relacionamento ENUM('CLT', 'Contratado', 'Diarista'),
    CONSTRAINT unique_cpf_func UNIQUE(CPF)
);
ALTER TABLE funcionario AUTO_INCREMENT=1;
SELECT * FROM funcionario;

-- Criar tabela pedido
CREATE TABLE orders(
	IdOrder INT AUTO_INCREMENT PRIMARY KEY,
    IdOrderClient INT,
    IdOrderServ INT,
    IdOrderfunc INT,
    IdOrderObj INT,
    OrderStatus ENUM('Em processamento', 'Cancelado', 'Concluído') DEFAULT 'Em processamento',
    OrderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    Paymentcash BOOL DEFAULT FALSE,
    PaymentId INT,
    CONSTRAINT fk_orders_client FOREIGN KEY (IdOrderClient) REFERENCES clients(IdClient),
    CONSTRAINT fk_orders_serv FOREIGN KEY (IdOrderServ) REFERENCES servico(Idservico),
    CONSTRAINT fk_orders_func FOREIGN KEY (IdOrderfunc) REFERENCES funcionario(IdFunc),
    CONSTRAINT fk_orders_obj FOREIGN KEY (IdOrderObj) REFERENCES objetoServe(idObjeto),
    CONSTRAINT fk_orders_pay_id FOREIGN KEY (PaymentId) REFERENCES payments(IdPayment)
);
ALTER TABLE orders AUTO_INCREMENT=1;
SELECT * FROM orders;