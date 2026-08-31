USE ParrillaBI;
GO

CREATE VIEW dbo.vw_vendas_itens
AS
SELECT
    p.PedidoID,
    p.DataPedido,
    p.CanalVenda,
    i.ProdutoID,
    pr.NomeProduto,
    pr.Categoria,
    i.Quantidade,
    i.PrecoUnitario,
    i.Quantidade * i.PrecoUnitario AS ReceitaItem
FROM dbo.Fato_Pedidos AS p
INNER JOIN dbo.Fato_ItensPedido AS i
    ON p.PedidoID = i.PedidoID
INNER JOIN dbo.Dim_Produtos AS pr
    ON i.ProdutoID = pr.ProdutoID;
GO
