
create table m16proj_tbl_login(
	codLogin int primary key identity(1, 1),
	username nvarchar(20),
	password nvarchar(256),
	tipo int
);

create table m16proj_tbl_cliente(
	codCliente int primary key identity(1, 1),
	codLogin int foreign key references m16proj_tbl_login(codLogin),
	nome nvarchar(50),
	email nvarchar(50),
	morada nvarchar(70),
	nif int,
	dataNascimento date,
	sexo varchar(1)
);

create table m16proj_tbl_categoriasProduto(
	codCategProduto int primary key identity(1, 1),
	nomeCategoria nvarchar(80)
);
create table m16proj_tbl_produtos(
	codProduto int primary key identity(1, 1),
	codCategProduto int foreign key references m16proj_tbl_categoriasProduto(codCategProduto),
	nomeProduto nvarchar(80),
	preco numeric,
	stock int
);

create table m16proj_tbl_encomendas(
	numEncomenda int primary key identity(1, 1),
	dataEncomenda date,
	situacao nvarchar(10),
	codCliente int foreign key references m16proj_tbl_cliente(codCliente),
	dataEntrega date
);

create table m16proj_tbl_detalhes_encomenda(
	numEncomenda int foreign key references m16proj_tbl_encomendas(numEncomenda),
	codProduto int foreign key references m16proj_tbl_produtos(codProduto),
	qtdProduto int
);

create table m16proj_tbl_carrinho(
	idCarrinho int primary key identity(1, 1),
	codCliente int foreign key references m16proj_tbl_cliente(codCliente),
	codProduto int foreign key references m16proj_tbl_produtos(codProduto),
	qtdProduto int
);