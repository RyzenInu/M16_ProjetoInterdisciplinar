<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_GerirProdutos.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_GerirProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Alterar Produtos";
    </script>
    <style>
        #form1{
            display: flex;
            flex-direction: column;
        }
        #form1 div{
            width: 100%;
            display: flex;
            place-content: center;
            place-items: center;
        }
        #GridView1{
            width: 90%;
            max-height: 80%;
            overflow-y: auto;
            text-align: center;
            border: none;
        }
        #GridView1 img{
            max-height: 65px;
            border-radius: 10px;
            padding: 3px;
        }
        #GridView1 tr td:first-child, #GridView1 tr th:first-child{
            width: 65px;
            max-width: 65px;
        }
        #GridView1 tr td{
            height: 10vh;
            max-height: 10vh;
            border: none;
            overflow: hidden;
        }
        #GridView1 tr{
            border-bottom: 1px solid rgba(255,255,255,0.5);
        }
        #GridView1 tr:last-child{
            border: none!important;
        }
        #GridView1 tr td:nth-child(2), #GridView1 tr th:nth-child(2){
            text-align: left;
            padding-left: 1rem;
        }
        #GridView1 th{
            max-height: 20px;
            border: none;
            border-bottom: 1px solid white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Alterar Produtos</h2>
    <asp:GridView ID="GridView1" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/Imagens/{0}" HeaderText=" ">
            </asp:ImageField>
            <asp:BoundField DataField="imagem" HeaderText=" imagem" SortExpression="imagem" Visible="False" />
            <asp:BoundField DataField="nomeProduto" HeaderText="Artigo" SortExpression="nomeProduto" />
            <asp:BoundField DataField="stock" HeaderText="Stock" SortExpression="stock" />
            <asp:BoundField DataField="preco" HeaderText="Preço" SortExpression="preco" DataFormatString="{0}€"/>
            <asp:BoundField DataField="nomeCategoria" HeaderText="Categoria" SortExpression="nomeCategoria" />
            <asp:BoundField DataField="nomeSubCategoria" HeaderText="Sub-categoria" SortExpression="nomeSubCategoria" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT m16proj_tbl_produtos.nomeProduto, m16proj_tbl_produtos.stock, m16proj_tbl_produtos.preco, m16proj_tbl_categoriasProduto.nomeCategoria, m16proj_tbl_subCategoriasProduto.nomeSubCategoria, m16proj_tbl_produtos.imagem FROM m16proj_tbl_categoriasProduto INNER JOIN m16proj_tbl_subCategoriasProduto ON m16proj_tbl_categoriasProduto.codCategProduto = m16proj_tbl_subCategoriasProduto.codCategProduto INNER JOIN m16proj_tbl_produtos ON m16proj_tbl_subCategoriasProduto.codSubCategProduto = m16proj_tbl_produtos.codSubCategProduto ORDER BY m16proj_tbl_categoriasProduto.nomeCategoria, m16proj_tbl_subCategoriasProduto.nomeSubCategoria"></asp:SqlDataSource>
</asp:Content>