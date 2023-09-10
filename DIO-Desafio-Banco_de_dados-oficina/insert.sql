USE oficina;

INSERT INTO clients (Fname, Minit, Lname, CPF, Address)
		VALUES('Lucas', 'M', 'Viana', '12345678912', 'r carvalho 46, Centro, Sobral'),
			  ('Jose', 'B', 'Silva', '10045678912', 'r camargo 16, Junco, Fortaleza'),
              ('Caio', 'M', 'Diniz', '92545648912', 'r bezerra 55, Cohab, Crato'),
              ('Maria', 'D', 'Mendes', '18845678342', 'r afonso 89, Pedrinhas, Ipu'),
              ('Joao', 'X', 'Medeiros', '19146678912', 'r saboia 15, Centro, Sobral'),
              ('Carlos', 'A', 'Campos', '13346789122', 'r sampaio 93, Centro, Sobral');
SELECT * FROM clients;

INSERT INTO servico(ServeName, Category, Duracao, Valor)
		VALUES('Pintura simples', 'Pintura', 72, 2000),
			  ('Pintura completa', 'Pintura', 96, 4000),
              ('Troca de oleo', 'Outro', 24, 300),
              ('Troca de bateria', 'Eletrico', 24, 200),
              ('Troca lanterna', 'Eletrico', 24, 250),
              ('Limpeza do motor', 'Motor', 96, 4000),
              ('Troca do motor', 'Motor', 72, 2000),
              ('Troca do painel', 'Eletrico', 24, 1000),
              ('Trocar estofado', 'Capotaria', 48, 1300),
              ('Instalar alarme', 'Eletrico', 24, 600),
              ('Limpeza estofado', 'Capotaria', 24, 600),
              ('Tira risco', 'Pintura', 24, 1000);
SELECT * FROM servico;

INSERT INTO objetoServe(idclient, TypeObjeto, Identif_objeto, descricao_objeto)
	VALUES(1, 'Carro', 'HJEW3478', 'celta preto'),
		  (2, 'Moto', 'HJEW3400', 'vermelha'),
          (3, 'Moto', 'HJEW7778', 'azul'),
          (4, 'Carro', 'HPOW3008', 'corolla prata'),
          (5, 'Carro', 'HJWW3558', 'hilux vermelha'),
          (1, 'Barco', 'HJEW3118', 'pequeno branco');
SELECT * FROM objetoServe;

INSERT INTO funcionario(Fname, Minit, Lname, CPF, Location, Contact, Relacionamento)
	VALUES('Chico', 'A', 'Silva', 12345558912, 'r sem saida, 555, Sobral-CE', '88999667799', 'CLT'),
		  ('José', 'B', 'Bezerra', 12345550012, 'r com saida, 111, Sobral-CE', '88999007799', 'CLT'),
          ('Carlão', 'C', 'Pereira', 12345558999, 'r do lado, 22, Sobral-CE', '88999662299', 'Contratado'),
          ('Marcão', 'D', 'Carvalho', 14445558912, 'r pereira, 33, Sobral-CE', '88999667722', 'Diarista');
SELECT * FROM funcionario;

INSERT INTO payments(IdClient, TypePayment, Valor)
	VALUES(1, 'Dinheiro', 1000),
		  (2, 'Boleto', 100),
          (3, 'Cartão', 5000),
          (4, 'Dinheiro', 10),
          (5, 'Boleto', 500),
          (1, 'Dinheiro', 3000),
          (6, 'Boleto', 2500);
SELECT * FROM payments;

INSERT INTO orders(IdOrderClient, IdOrderServ, IdOrderfunc, IdOrderObj, OrderStatus, OrderDescription, SendValue, Paymentcash, PaymentId)
	VALUES(1, 1, 1, 1, DEFAULT, 'Pintar cor vermelho vivo', 100, DEFAULT, 1),
		  (2, 2, 1, 2, DEFAULT, 'Pintar cor azul vivo', 1000, DEFAULT, 2),
          (3, 2, 2, 3, DEFAULT, 'Pintar cor amarelo vivo', 2000, DEFAULT, 3),
          (4, 3, 2, 4, DEFAULT, '2L oleo', 200, DEFAULT, 4),
          (5, 4, 3, 5, DEFAULT, 'Bateria Moura', 1500, DEFAULT, 5),
          (1, 6, 3, 6, DEFAULT, 'Limpeza completa', 700, DEFAULT, 6);
SELECT * FROM orders;