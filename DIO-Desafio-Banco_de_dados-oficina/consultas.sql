-- Exibir Clientes do sobrenome M
SELECT * FROM clients
	WHERE Minit = 'M';
    
-- Exibir cliente e tipo de objeto
SELECT CONCAT(c.Fname, ' ', c.Lname) AS Cliente, ob.TypeObjeto AS Objeto 
	FROM clients AS c
    INNER JOIN objetoServe AS ob
		ON c.IdClient = ob.idclient;

-- Exibir quantidade de objeto agrupado por categoria
SELECT ob.TypeObjeto, COUNT(*)
	FROM objetoServe AS ob
    GROUP BY ob.TypeObjeto;

-- Exibir Funcionário e sua quantidade de servico, Ordem alfabética de funcionário
SELECT f.Fname AS Funcionário, COUNT(*) AS Quantidade_servico
	FROM orders AS o
    INNER JOIN servico AS s
		ON o.IdOrderServ = s.Idservico
	INNER JOIN funcionario AS f
		ON o.IdOrderfunc = f.IdFunc
	GROUP BY o.IdOrderFunc
    ORDER BY Funcionário;
    
-- Exibir agrupamento por tipos de pagamentos cuja a somantória dos valores seja maior que 4000:
SELECT TypePayment, SUM(Valor) AS Soma_valores
	FROM payments
    GROUP BY TypePayment
    HAVING Soma_valores > 4000;