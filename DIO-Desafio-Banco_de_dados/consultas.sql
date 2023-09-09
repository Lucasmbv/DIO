USE ecommerce;

-- Exibir Quantidade de pedidos por cliente. Ordenador por ordem alfabética de clientes.
SELECT CONCAT(c.Fname, ' ', c.Lname) AS Cliente, COUNT(*)
	FROM orders AS o
		INNER JOIN clients AS c
			ON o.IdOrderClient = IdClient
	GROUP BY o.IdOrderClient
    ORDER BY Cliente;
	
-- Exibir os fornecedores que também são vendedores: Não há fornecesores que também são vendedores.
SELECT *
	FROM supplier AS su, seller AS se
	WHERE su.CNPJ = se.CNPJ;

-- Exibir produto, fornecedor e estoque
SELECT p.Fname AS Produto, su.SocialName AS Fornecedor, ps.ProdQuantity AS Estoque
	FROM product AS p
    INNER JOIN productsupplier AS ps
		ON p.IdProduct = ps.IdPProduct
    INNER JOIN supplier AS su
		ON ps.IdPSupplier = su.IdSupplier;
        
-- Exibir fornecedores e nome dos produtos
SELECT su.SocialName AS Fornecedor, p.Fname AS Produto
	FROM product AS p
    INNER JOIN productsupplier AS ps
		ON p.IdProduct = ps.IdPProduct
    INNER JOIN supplier AS su
		ON ps.IdPSupplier = su.IdSupplier;


-- Exibir todos os clientes de Ecommerce
SELECT * FROM clients;

-- Exibir todos os clientes com sobrenome 'M'
SELECT * FROM clients
	WHERE Minit = 'M';

-- Exibir a quantidade de Clientes:
SELECT COUNT(*) AS Quantidade_de_Clientes FROM clients;

-- Exibir a quantidade de produtos por categoria
SELECT Category, COUNT(*) AS Quantidade FROM product
	GROUP BY Category;

-- Exibir os produtos na ordem alfabética:
SELECT * FROM product
	ORDER BY Fname;
    
-- Exibir os produtos na ordem decrescente de avaliação:
SELECT * FROM product
	ORDER BY Avaliação DESC;    

-- Exibir agrupamento de Storagea com mais de uma localidade por ordem decrescente de localidades:
SELECT StorageLocation, COUNT(*) AS Quantidade FROM productStorage
	GROUP BY StorageLocation
    HAVING Quantidade > 1
    ORDER BY Quantidade DESC;

-- Exibir número do pedido e nome do cliente ordenado por nome do cliente na ordem alfabética:
SELECT o.IdOrder AS Número_Pedido, CONCAT(c.Fname, ' ',c.Lname) AS Cliente 
	FROM orders AS o, clients AS c
	WHERE o.IdOrderClient = IdClient
    ORDER BY Cliente;

-- Exibir número do pedido, nome do cliente e produto do pedido. Ordenado pela sequência do pedido:
SELECT o.IdOrder AS Número_Pedido, CONCAT(c.Fname, ' ',c.Lname) AS Cliente, p.Fname AS Produto
	FROM orders AS o
    INNER JOIN clients AS c 
		ON o.IdOrderClient = c.IdClient
    INNER JOIN productOrder AS po 
		ON o.IdOrder = po.IdPOorder
    INNER JOIN product AS p
		ON po.IdPOproduct = p.IdProduct
    ORDER BY IdOrder;

-- Exibir Storage, local, produto e quantidade
SELECT s.IdLStorage AS Storage_ID, s.Location AS Localização , p.Fname AS Produto
	FROM storageLocation AS s
    INNER JOIN product AS p
		ON s.IdLProduct = p.IdProduct;