/*

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

*/

create table m16proj_tbl_categoriasProduto(
	codCategProduto int primary key identity(1, 1),
	nomeCategoria nvarchar(80)
);
create table m16proj_tbl_produto

