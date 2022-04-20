<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_Carrinho.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_Carrinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        header{
            position: fixed;
        }
        #form1, main{
            justify-content: center;
        }
        #form1, main, #contentPlaceHolder-wrapper{
            height: fit-content;
        }
        #contentPlaceHolder-wrapper{
            margin-top: 70px;   
        }
        form div{
            min-width: 90%;
            padding: 10px;
        }
        #GridView1{
            width: 100%;
            border-radius: 20px 20px 20px 20px;
        }
        #GridView1 img{
            max-height: 30vh;
            width: auto;
        }
        tr, td{
            max-height: 30px;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/Imagens/{0}" HeaderText=" ">
            </asp:ImageField>
            <asp:BoundField DataField="imagem" HeaderText="imagem" SortExpression="imagem" Visible="False" />
            <asp:BoundField DataField="nomeProduto" HeaderText="Nome" SortExpression="nomeProduto" />
            <asp:BoundField DataField="preco" HeaderText="Preço" SortExpression="preco" />
            <asp:BoundField DataField="qtdProduto" HeaderText="Quantidade" SortExpression="qtdProduto" />
            <asp:ButtonField Text="Eliminar">
            <ControlStyle Font-Italic="False" Font-Names="Roboto" Font-Size="12pt" ForeColor="Black" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT m16proj_tbl_produtos.imagem, m16proj_tbl_produtos.nomeProduto, m16proj_tbl_produtos.preco, m16proj_tbl_carrinho.qtdProduto FROM m16proj_tbl_carrinho INNER JOIN m16proj_tbl_produtos ON m16proj_tbl_carrinho.codProduto = m16proj_tbl_produtos.codProduto
WHERE codCliente = @codCliente">
        <SelectParameters>
            <asp:SessionParameter Name="codCliente" SessionField="codCliente" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
