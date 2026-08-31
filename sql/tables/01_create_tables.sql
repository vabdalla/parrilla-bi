USE ParrillaBI;
GO

-- =============================================
-- DIMENSÕES
-- =============================================

CREATE TABLE dbo.Dim_Produtos (
    ProdutoID INT NOT NULL,
    NomeProduto NVARCHAR(120) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    Subcategoria NVARCHAR(50) NOT NULL,
    PrecoVenda DECIMAL(10,2) NOT NULL,
    CustoEstimado DECIMAL(10,2) NOT NULL,
    MargemPercentual DECIMAL(6,2) NOT NULL,

    CONSTRAINT PK_Dim_Produtos
        PRIMARY KEY (ProdutoID)
);
GO


CREATE TABLE dbo.Dim_Clientes (
    ClienteID INT NOT NULL,
    Sexo VARCHAR(15) NOT NULL,
    FaixaEtaria VARCHAR(10) NOT NULL,
    Cidade VARCHAR(60) NOT NULL,
    DataCadastro DATE NOT NULL,

    CONSTRAINT PK_Dim_Clientes
        PRIMARY KEY (ClienteID)
);
GO


CREATE TABLE dbo.Dim_Funcionarios (
    FuncionarioID INT IDENTITY(1,1) NOT NULL,
    NomeFuncionario VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Setor VARCHAR(50) NULL,
    DataNascimento DATE NULL,
    Sexo VARCHAR(15) NULL,
    DataAdmissao DATE NOT NULL,
    DataDesligamento DATE NULL,
    RegraComissaoID INT NULL,
    StatusFuncionario VARCHAR(15) NOT NULL,

    CONSTRAINT PK_Dim_Funcionarios
        PRIMARY KEY (FuncionarioID)
);
GO


CREATE TABLE dbo.Dim_RegrasComissao (
    RegraComissaoID INT NULL,
    NomeRegra VARCHAR(50) NULL,
    PercentualBase FLOAT NULL,
    DataInicio DATE NULL,
    DataFim DATE NULL,
    StatusRegra VARCHAR(50) NULL
);
GO


-- =============================================
-- TABELAS FATO
-- =============================================

CREATE TABLE dbo.Fato_Pedidos (
    PedidoID INT NOT NULL,
    ClienteID INT NOT NULL,
    DataPedido DATE NOT NULL,
    HoraPedido TIME(7) NOT NULL,
    CanalVenda VARCHAR(20) NOT NULL,
    FormaPagamento VARCHAR(25) NOT NULL,
    ValorBruto DECIMAL(10,2) NOT NULL,
    Desconto DECIMAL(10,2) NOT NULL,
    ValorLiquido DECIMAL(10,2) NOT NULL,
    StatusPedido VARCHAR(15) NOT NULL,
    CupomAplicado VARCHAR(20) NULL,
    FuncionarioID INT NULL,
    ComissaoID INT NULL,

    CONSTRAINT PK_Fato_Pedidos
        PRIMARY KEY (PedidoID),

    CONSTRAINT DF_Fato_Pedidos_Desconto
        DEFAULT 0 FOR Desconto
);
GO


CREATE TABLE dbo.Fato_ItensPedido (
    ItemID INT NOT NULL,
    PedidoID INT NOT NULL,
    ProdutoID INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10,2) NOT NULL,
    ValorItem DECIMAL(10,2) NOT NULL,

    CONSTRAINT PK_Fato_ItensPedido
        PRIMARY KEY (ItemID)
);
GO


CREATE TABLE dbo.Fato_Entregas (
    EntregaID INT NOT NULL,
    PedidoID INT NOT NULL,
    DistanciaKm DECIMAL(6,2) NOT NULL,
    TempoPreparo INT NOT NULL,
    TempoEntrega INT NOT NULL,
    AvaliacaoCliente DECIMAL(3,1) NULL,

    CONSTRAINT PK_Fato_Entregas
        PRIMARY KEY (EntregaID)
);
GO


-- =============================================
-- FOREIGN KEYS
-- =============================================

ALTER TABLE dbo.Fato_Pedidos
ADD CONSTRAINT FK_Fato_Pedidos_Cliente
    FOREIGN KEY (ClienteID)
    REFERENCES dbo.Dim_Clientes (ClienteID);
GO


ALTER TABLE dbo.Fato_ItensPedido
ADD CONSTRAINT FK_Fato_ItensPedido_Pedido
    FOREIGN KEY (PedidoID)
    REFERENCES dbo.Fato_Pedidos (PedidoID);
GO


ALTER TABLE dbo.Fato_ItensPedido
ADD CONSTRAINT FK_Fato_ItensPedido_Produto
    FOREIGN KEY (ProdutoID)
    REFERENCES dbo.Dim_Produtos (ProdutoID);
GO


ALTER TABLE dbo.Fato_Entregas
ADD CONSTRAINT FK_Fato_Entregas_Pedido
    FOREIGN KEY (PedidoID)
    REFERENCES dbo.Fato_Pedidos (PedidoID);
GO
