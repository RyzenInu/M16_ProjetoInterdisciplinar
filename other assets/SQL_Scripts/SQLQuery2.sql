create table m16proj_tbl_subCategoriasProduto(
	codSubCategProduto int primary key identity(1, 1),
	codCategProduto int foreign key references m16proj_tbl_categoriasProduto(codCategProduto),
	nomeSubCategoria nvarchar(80)
);

alter table m16proj_tbl_subCategoriasProduto
drop column codCategProduto
add codCategProduto int foreign key references m16proj_tbl_subCategoriasProduto(codSubCategProduto)

/*inserir stuff*/

insert into m16proj_tbl_categoriasProduto(nomeCategoria)
values
('Roupa'),
('Calçado'),
('Acessórios');

select * from m16proj_tbl_categoriasProduto

insert into m16proj_tbl_subCategoriasProduto(codCategProduto, nomeSubCategoria)
values
('1', 'Camisolas'),
('1', 'T-shirts'),
('1', 'Calças'),
('1', 'Casacos'),
('2', 'Ténis'),
('2', 'Botas'),
('2', 'Sandálias'),
('3', 'Bolsas'),
('3', 'Carteiras'),
('3', 'Canetas'),
('3', 'Cintos'),
('3', 'Bonés')

select m16proj_tbl_categoriasProduto.nomeCategoria, m16proj_tbl_subCategoriasProduto.nomeSubCategoria 
from m16proj_tbl_subCategoriasProduto 
inner join m16proj_tbl_categoriasProduto on m16proj_tbl_subCategoriasProduto.codCategProduto = m16proj_tbl_categoriasProduto.codCategProduto