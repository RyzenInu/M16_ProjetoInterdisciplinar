<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_Carrinho.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_Carrinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .aspNetHidden{
            display: none;
        }
        #form1{
            justify-content: center;
        }
        form div:nth-child(4){
            min-width: 90%;
        }
        header{
            max-width: 100%;
        }
        #GridView1{
            width: 100%;
            border: none;
        }
        #GridView1 img{
            max-height: 25vh;
            width: auto;
            border-radius: 20px;
            padding: 10px;
        }
        th{
            border: none;
        }
        #GridView1 tr{
            text-align: left;
            border-bottom: 1px solid rgba(0,0,0,0.25)!important;
        }
        #GridView1 tr:last-child{
            border: none!important;
        }
        #GridView1 tr, #GridView1 td{
            max-height: 20vh;
            border: none;
        }
        #GridView1 tr td:first-child{
            width: 25vh;
        }
        #btn_confirmCart{
            place-self: center;
            min-width: 200px;
            width: fit-content;
            height: 50px;
            background: linear-gradient(45deg, #ffb980, #d96529);
            font-weight: bolder;
            font-size: 12pt;
            color: white;
            border-radius: 30px 30px 30px 30px;
            cursor: pointer;
            outline: none;
            border: none;
        }
    </style>
    <script>
        window.document.title = "Carrinho";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ClientIDMode="Static" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="codProduto">
        <Columns>
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/Imagens/{0}">
            </asp:ImageField>
            <asp:BoundField DataField="imagem" HeaderText="imagem" SortExpression="imagem" Visible="False" />
            <asp:BoundField DataField="nomeProduto" HeaderText="Nome" SortExpression="nomeProduto" />
            <asp:BoundField DataField="preco" HeaderText="Preço" SortExpression="preco" DataFormatString="{0}€" />
            <asp:BoundField DataField="qtdProduto" HeaderText="Quantidade" SortExpression="qtdProduto" />
            <asp:BoundField DataField="codProduto" HeaderText="codProduto" SortExpression="codProduto" Visible="False" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('Tem a certeza que pretende apagar?');">Eliminar</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT m16proj_tbl_produtos.imagem, m16proj_tbl_produtos.nomeProduto, m16proj_tbl_produtos.preco, m16proj_tbl_carrinho.qtdProduto, m16proj_tbl_carrinho.codProduto FROM m16proj_tbl_carrinho INNER JOIN m16proj_tbl_produtos ON m16proj_tbl_carrinho.codProduto = m16proj_tbl_produtos.codProduto WHERE (m16proj_tbl_carrinho.codCliente = @codCliente)" DeleteCommand="delete from m16proj_tbl_carrinho where codCliente=@codCliente and codProduto=@codProduto">
        <SelectParameters>
            <asp:SessionParameter Name="codCliente" SessionField="codCliente" />
        </SelectParameters>
        <DeleteParameters>
            <asp:SessionParameter Name="codCliente" SessionField="codCliente" Type="String"/>
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btn_confirmCart" runat="server" Text="Finalizar Encomenda" OnClick="btn_confirmCart_Click" ClientIDMode="Static"/>
</asp:Content>
