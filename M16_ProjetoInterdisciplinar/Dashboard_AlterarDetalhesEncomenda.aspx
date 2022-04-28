<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_AlterarDetalhesEncomenda.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_AlterarDetalhesEncomenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Gerir Encomendas";
    </script>
    <style>
        h2{
            margin: 0;
        }
        #form1{
            place-content: flex-start!important;
            display: flex;
            flex-direction: row;
        }
        body, #form1{
            max-width: 100%!important;
            overflow-x: hidden;
        }
        #headerBar{
            border-bottom: 1px solid white;
            width: 100%;
            height: 70px;
            display: flex;
            flex-direction: row;
            place-items: flex-end;
        }
        #headerInfo{
            margin: 0px;
            margin-left: 0.5rem;
        }
        #actions{
            width: 100%;
            height: 100px;
            display: flex;
            flex-direction: row;
            place-items: center;
            place-content: center;
            justify-content: space-evenly;
        }
        #btn_alterarEncomenda{
            min-width: 200px;
            width: fit-content;
            height: fit-content;
            background: linear-gradient(45deg, #ffb980, #d96529);
            font-weight: bold;
            font-size: 12pt;
            color: white;
            border-radius: 30px 30px 30px 30px;
            cursor: pointer;
            outline: none;
            border: none;
        }
        #dashboardContent div:nth-child(4){
            width: 100%;
            height: 100%;
        }
        #dashboardContent{
            padding: 0px 6vw;
        }

        /*Gridview stuff*/

        #GridView1{
            width: 90%;
            max-height: 80%;
            overflow-y: auto;
            text-align: center;
            border: none;
        }
        #GridView1 tr td{
            height: 10vh;
            border: none;
        }
        #GridView1 tr{
            border-bottom: 1px solid rgba(255,255,255,0.5);
        }
        #GridView1 tr:last-child{
            border: none!important;
        }
        #GridView1 th{
            max-height: 20px;
            border: none;
            border-bottom: 1px solid white;
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
        #GridView1 tr td:nth-child(2), #GridView1 tr th:nth-child(2){
            text-align: left;
            padding-left: 1rem;
        }
        #form1 div:nth-child(5){
            width: 100%;
            display: flex;
            place-items: center;
            place-content: center;
        }
        #GridView1{
            width: 100%;
        }
        #produtosEncomendados{
            width: 100%;
            text-align: left;
            margin-left: 0.5rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="headerBar">
        <h2 id="headerInfo" runat="server" ClientIDMode="Static"></h2>
    </div>
    <div id="actions">
        <div>
            Estado:
            <asp:DropDownList ID="ddl_estado" runat="server">
                <asp:ListItem>Cancelada</asp:ListItem>
                <asp:ListItem>Em processamento</asp:ListItem>
                <asp:ListItem>Aguardando artigos</asp:ListItem>
                <asp:ListItem>Enviada</asp:ListItem>
                <asp:ListItem>Entregue</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            Data de Entrega:
            <asp:TextBox ID="txt_date" runat="server" ClientIDMode="Static" TextMode="Date"></asp:TextBox>
        </div>
        <asp:Button ClientIDMode="Static" ID="btn_alterarEncomenda" runat="server" Text="Confirmar Alterações" OnClick="btn_alterarEncomenda_Click" />
    </div>
    <div id="produtosEncomendados">
        <h2>Produtos Encomendados</h2>
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ClientIDMode="Static">
        <Columns>
            <asp:BoundField DataField="imagem" HeaderText="imagem" SortExpression="imagem" Visible="False" />
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/Imagens/{0}" HeaderText=" ">
            </asp:ImageField>
            <asp:BoundField DataField="nomeProduto" HeaderText="Artigo" SortExpression="nomeProduto" />
            <asp:BoundField DataField="preco" DataFormatString="{0}€" HeaderText="Preço" SortExpression="preco" />
            <asp:BoundField DataField="qtdProduto" HeaderText="Quantidade" SortExpression="qtdProduto" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT m16proj_tbl_produtos.imagem, m16proj_tbl_produtos.nomeProduto, m16proj_tbl_produtos.preco, m16proj_tbl_detalhes_encomenda.qtdProduto FROM m16proj_tbl_detalhes_encomenda INNER JOIN m16proj_tbl_produtos ON m16proj_tbl_detalhes_encomenda.codProduto = m16proj_tbl_produtos.codProduto WHERE ([numEncomenda] = @numEncomenda)">
        <SelectParameters>
            <asp:QueryStringParameter Name="numEncomenda" QueryStringField="numEncomenda" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
