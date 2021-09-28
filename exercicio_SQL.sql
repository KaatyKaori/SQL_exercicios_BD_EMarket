USE emarket;
#WHERE 1#

SELECT ProdutoNome 
	FROM produtos
    WHERE ProdutoNome LIKE '%spread%';
    
#WHERE 2#
SELECT Contato
	FROM clientes
    WHERE Contato LIKE 'Y%';
    
#ORDER BY 1#
SELECT ProdutoNome, PrecoUnitario
	FROM produtos
    ORDER BY PrecoUnitario DESC
    LIMIT 5;
    
#OPERADORES E JOINS 1#
SELECT Contato, CONCAT(Endereco, ' ' , Cidade) AS end_completo
	FROM clientes
    WHERE Cidade = 'lONDON';
    
#OPERADORES E JOINS 2#
SELECT CONCAT(Nome,' ', Sobrenome) AS nome_completo, SUM(Transporte), a.EmpregadoID, b.EmpregadoID
	FROM empregados a
    INNER JOIN faturas b ON a.EmpregadoID = b.EmpregadoID
    GROUP BY CONCAT(Nome,' ', Sobrenome)
    ORDER BY SUM(Transporte) desc;
    
#FUNÇÕES DE AGREGRAÇÃO 1#
SELECT MAX(DataFatura)
	FROM faturas
    ORDER BY DataFatura DESC;

#FUNÇÕES DE AGREGRAÇÃO 2#
SELECT MIN(PrecoUnitario)
	FROM produtos;

#JOIN E GROUP BY 1#
SELECT b.ProdutoNome, a.PrecoUnitario, a.Quantidade, (a.PrecoUnitario * a.Quantidade) AS total_vendido
	FROM detalhefatura a
    INNER JOIN produtos b ON a.ProdutoID = b.ProdutoID
    GROUP BY b.ProdutoNome
    HAVING a.Quantidade > 40;
    
#HAVING 1#
SELECT b.ProdutoNome, a.PrecoUnitario, a.Quantidade, (a.PrecoUnitario * a.Quantidade) AS total_vendido;

#INDEX#
SHOW INDEXES FROM produtos;

#2
DROP INDEX Produtos_ProdutoNome ON produtos;
