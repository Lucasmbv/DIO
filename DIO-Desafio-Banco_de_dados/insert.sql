USE ecommerce;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
		VALUES('Lucas', 'M', 'Viana', '12345678912', 'r carvalho 46, Centro, Sobral'),
			  ('Jose', 'B', 'Silva', '10045678912', 'r camargo 16, Junco, Fortaleza'),
              ('Caio', 'M', 'Diniz', '92545648912', 'r bezerra 55, Cohab, Crato'),
              ('Maria', 'D', 'Mendes', '18845678342', 'r afonso 89, Pedrinhas, Ipu'),
              ('Joao', 'X', 'Medeiros', '19146678912', 'r saboia 15, Centro, Sobral'),
              ('Carlos', 'A', 'Campos', '13346789122', 'r sampaio 93, Centro, Sobral');
              

              
INSERT INTO product(Fname, Classification_kids, Category, Avaliação, Size)
		VALUES('Violão', DEFAULT, 'Musical', 4 , '2x0.7x0.2'),
			  ('Cavaco', DEFAULT, 'Musical', 4, '1x0.5x0.2'),
              ('Cadeira', FALSE, 'Móveis', 5, '2x0.5x0.7'),
              ('Espada', TRUE, 'Brinquedos', 5, '2x0.5'),
              ('Bolo', FALSE, 'Alimentos', 3, NULL),
              ('Escudo', TRUE, 'Brinquedos', 2, '1.5'),
              ('Camisa', DEFAULT, 'Vestimenta', 3, '1x0.8x0.3'),
              ('Celular', DEFAULT, 'Eletrônico', 4, '0.1x0.05'),
              ('Strobo', DEFAULT, 'Iluminação', 4, '0.5x0.9');

              
INSERT INTO orders (IdOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash)
		VALUES(13, 'Confirmado', 'Produto entregue', 150, DEFAULT),
			  (14, DEFAULT, 'Compra pelo website', 250, FALSE),
              (15, 'Cancelado', 'Pagamento não realizado', 0, FALSE),
              (16, DEFAULT, 'Compra pelo aplicativo', 550, FALSE),
              (17, 'Confirmado', 'Produto entregue', 50, FALSE),
              (18, 'Cancelado', 'Endereço não encontrado', 250, FALSE);

INSERT INTO orders (IdOrderClient, OrderStatus, OrderDescription, SendValue, PaymentCash)
		VALUES(13, 'Confirmado', 'Produto entregue', 150, DEFAULT),
			  (13, DEFAULT, 'Compra pelo website', 250, FALSE),
              (13, DEFAULT, 'Pagamento não realizado', 150, FALSE),
              (16, DEFAULT, 'Compra pelo aplicativo', 550, FALSE),
              (18, 'Confirmado', 'Produto entregue', 96, FALSE),
              (18, 'Cancelado', 'Endereço não encontrado', 70, FALSE);

SELECT * FROM orders;
              
INSERT INTO productOrder(IdPOproduct, IdPOorder, PoQuantity, PoStatus)
		VALUES(51, 1, 3, DEFAULT),
			  (52, 2, 2, 'Sem estoque'),
              (52, 3, DEFAULT, DEFAULT),
              (53, 4, 5, 'Sem estoque'),
              (54, 5, DEFAULT, DEFAULT),
              (54, 6, 7, DEFAULT),
              (56, 7, DEFAULT, DEFAULT),
              (57, 8, 5, 'Sem estoque'),
              (58, 9, 3, DEFAULT),
              (59, 10, 8, DEFAULT),
              (51, 10, 2, DEFAULT),
              (53, 11, 3, DEFAULT);

SELECT * FROM productOrder;

INSERT INTO productStorage (StorageLocation, Quantity)
		VALUES('Rio de Janeiro', 300),
			  ('Maranhão', 500),
              ('Fortaleza', 3000),
              ('Fortaleza', 1000),
              ('São Paulo', 5000),
              ('São Paulo', 1000),
              ('Belém', 5000),
              ('Belém', 30000),
              ('Belém', 70000);

SELECT * FROM productStorage;

INSERT INTO storageLocation (IdLProduct, IdLStorage, Location)
		VALUES(51, 1, 'RJ'),
			  (54, 1, 'RJ'),
              (54, 1, 'RJ'),
              (55, 2, 'MA'),
              (56, 3, 'CE'),
              (51, 3, 'CE'),
              (55, 4, 'CE'),
              (51, 5, 'SP'),
              (51, 6, 'SP'),
              (58, 7, 'PA'),
              (52, 8, 'PA'),
              (54, 9, 'PA'),
              (58, 4, 'CE');

              
INSERT INTO supplier(SocialName, CNPJ, Contact)
		VALUES('Dois irmãos', 123456789012345, 88361455779),
			  ('Tem de tudo', 963856789012345, 88361458670),
              ('Tudo musical', 123499789012345, 88361455749),
              ('Eletrotudo', 567345678901234, 88362097757),
              ('Mundo Kid', 166656559012345, 88333965879);
              

INSERT INTO productsupplier(IdPSupplier, IdPProduct, ProdQuantity)
		VALUES(6, 51, 100),
			  (7, 51, 10),
              (8, 51, 20),
              (9, 51, 50),
              (10, 51, 200),
              (10, 55, 300),
              (7, 56, 100),
              (10, 54, 5),
              (9, 55, 500),
              (6, 55, 10),
              (10, 56, 1000),
              (7, 58, 80),
              (8, 59, 70),
              (9, 59, 5);
              

INSERT INTO seller (SocialName, AbstName, CNPJ, CPF, Location, Contact)
		VALUES('Tech tudo', NULL, 235897465100035, NULL, 'Ceará', 88362055887),
			  ('Music tudo', NULL, 236667465100035, NULL, 'Rio de Janeiro', 88362055887),
              ('Kid tudo', NULL, 235007465100035, NULL, 'Ceará', 88362099887),
              ('Tudo de tudo', NULL, 235999465100035, NULL, 'Ceará', 88362077887);
              
INSERT INTO entrega
		VALUES(1, 3452457, 'Em processamento'),
			  (2, 3567457, 'Enviado'),
              (3, 3452227, DEFAULT),
              (4, 3400457, 'Em processamento'),
              (5, 3431457, 'Enviado'),
              (6, 3411457, DEFAULT),
              (7, 3488457, 'Entregue'),
              (8, 3400457, 'Em processamento'),
              (9, 3403457, 'Entregue'),
              (10, 3458887, DEFAULT),
              (11, 3452117, 'Em processamento'),
              (12, 3459957, 'Entrega frustrada');