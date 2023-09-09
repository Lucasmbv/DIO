-- Criação do BD para o cenário de E-commerce
CREATE DATABASE ecommerce;
USE ecommerce;

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
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);
ALTER TABLE clients AUTO_INCREMENT=1;
SELECT * FROM clients;

-- Criar tabela produto
CREATE TABLE product( 
	IdProduct INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10) NOT NULL,
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis', 'Musical','Iluminação'),
    Avaliação FLOAT DEFAULT 0,
    Size VARCHAR(10)
);
ALTER TABLE product AUTO_INCREMENT=1;
SELECT * FROM product;

-- Criar tabela pagamentos
CREATE TABLE payments(
	IdPayment INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    IdClient INT,
    TypePayment ENUM('Dinheiro', 'Boleto', 'Cartão', 'Dois cartões'),
    Valor FLOAT,
    CONSTRAINT fk_pay_client FOREIGN KEY (IdClient) REFERENCES clients(IdClient)
);
SELECT * FROM payments;

-- Criar tabela pedido
CREATE TABLE orders(
	IdOrder INT AUTO_INCREMENT PRIMARY KEY,
    IdOrderClient INT,
    OrderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    OrderDescription VARCHAR(255),
    SendValue FLOAT DEFAULT 10,
    Paymentcash BOOL DEFAULT FALSE,
    PaymentId INT,
    CONSTRAINT fk_orders_pay_id FOREIGN KEY (PaymentId) REFERENCES payments(IdPayment),
    CONSTRAINT fk_orders_client FOREIGN KEY (IdOrderClient) REFERENCES clients(IdClient) ON UPDATE CASCADE
);
ALTER TABLE orders AUTO_INCREMENT=1;
SELECT * FROM orders;

-- Criar tabela de entrega: Estatus do pedido e código de rastreio
CREATE TABLE entrega(
	Id_entrega_ord INT, 
    Entrega_rastreio CHAR(7),
    Entrega_status ENUM('Em processamento', 'Enviado', 'Entregue', 'Entrega frustrada') DEFAULT 'Em processamento',
    CONSTRAINT fk_entrega_order FOREIGN KEY (Id_entrega_ord) REFERENCES orders(IdOrder)
);
SELECT * FROM entrega;

-- Criar tabela estoque
CREATE TABLE productStorage(
	IdProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    StorageLocation VARCHAR(255),
    Quantity INT DEFAULT 0
);
ALTER TABLE productStorage AUTO_INCREMENT=1;
SELECT * FROM productStorage;

-- Criar storage - produto - local
CREATE TABLE storageLocation(
	IdLProduct INT,
    IdLStorage INT,
    Location CHAR(2),
    CONSTRAINT fk_prod_loc_storge FOREIGN KEY (IdLProduct) REFERENCES product(IdProduct),
    CONSTRAINT fk_storage_loc_prod FOREIGN KEY (IdLStorage) REFERENCES productStorage(IdProdStorage)
);
SELECT * FROM storageLocation;


-- Criar tabela fornecedor
CREATE TABLE supplier(
	IdSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE(CNPJ)
);
ALTER TABLE supplier AUTO_INCREMENT=1;
SELECT * FROM supplier;

-- Criar tabela vendedor
CREATE TABLE seller(
	IdSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    Location VARCHAR(255),
    Contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE(CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE(CPF)
);
ALTER TABLE seller AUTO_INCREMENT=1;
SELECT * FROM seller;

-- Criar tabela relação produto-fornecedor
CREATE TABLE productsupplier(
	IdPSupplier INT,
    IdPProduct INT,
    ProdQuantity INT DEFAULT 1,
    CONSTRAINT fk_product_supplier FOREIGN KEY (IdPSupplier) REFERENCES supplier(IdSupplier),
    CONSTRAINT fk_product_product_supplier FOREIGN KEY (IdPProduct) REFERENCES product(IdProduct)
);
SELECT * FROM productsupplier;

-- Criar tabela produto-pedido
CREATE TABLE productOrder(
	IdPOproduct INT,
    IdPOorder INT,
    PoQuantity INT DEFAULT 1,
    PoStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (IdPOproduct, IdPOorder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (IdPOproduct) REFERENCES product(IdProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (IdPOorder) REFERENCES orders(IdOrder)
);
SELECT * FROM productOrder;