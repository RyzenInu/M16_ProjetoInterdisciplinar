<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_CriarProdutos.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_CriarProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Criar Produtos";
    </script>
    <style>
        #form1{
            height: 60%;
            width: 30vw;
            min-height: 200px;
            min-width: 300px;

            display: flex;
            flex-direction: column;
            place-items: center;
            place-content: center;
            text-align: left;

            /*background-color: rgba(0, 0, 0, 0.30);*/
            border-radius: 15px;

            overflow-y: auto;
        }
        @media only screen and (max-width: 900px) {
            #form1{}
        }

        .inputField{
            border: none;
            background-color: transparent;
            border-bottom: 1px solid rgba(255, 255, 255, 0.50);
            height: 30px;
            width: 100%;
            color: white;
        }
        .inputBox select option{
            color: initial;
        }

        .inputField:focus{
            outline: none;
        }
        .inputField::placeholder{
            color: rgba(255,255,255, 0.50);
            opacity: 1;
        }
        #form1 input[type=submit]{
            border: none;
            height: 30px;
            border-radius: 30px;
            background: linear-gradient(45deg, #ffb980, #8d411A);
        }

        #form1 input[type=submit]:hover{
            cursor: pointer;
        }

        #form1 .inputBox{
            width: 90%;
            display: flex;
            flex-direction: row;
        }

        #form1 .inputBox label {
            font-size: 16pt;
            height: 100%;
            display: grid;
            place-items: center;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.50);
            padding-right: 2px;
            color: rgba(255,255,255, 0.50);
            font-family: 'Material Icons';
        }
        
        .dropDownInputField{
            width: 100%;
            background-color: rgb(22,22,22);
            color: white;
        } 

        .dropDownInputField:hover{
            cursor: pointer;
        }
        
        #categContainer{
            width: 90%;
            display: flex;
            flex-direction: column;
            place-items: center;
            border: 1px solid rgba(255,255,255, 0.50);
            border-radius: 7px;
            padding: 15px;
        }

        #categContainer .inputBox{
            width: 100%;
        }

        #categContainer span{
            font-size: 10pt;
            position: relative;
            display: block;
            float: left;
            top: -20px;
            padding: 0px 3px;
            place-self: flex-start;
            background-color: rgb(22,22,22);
            color: rgba(255,255,255, 0.50);
            margin-bottom: -1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Inserir novo Produto</h2>
    <div class="inputBox">
        <label>person</label>
        <asp:TextBox ID="txt_nomeProd" runat="server" placeholder="Nome do produto" CssClass="inputField"></asp:TextBox>
    </div>
    &nbsp
    <div id="categContainer">
        <span>Categorias</span>
        <div class="inputBox">
            <label>menu</label>
            <asp:DropDownList CssClass="dropDownInputField inputField" ID="ddl_categ" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomeCategoria" DataValueField="codCategProduto" AutoPostBack="True" Enabled="False"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [codCategProduto], [nomeCategoria] FROM [m16proj_tbl_categoriasProduto]"></asp:SqlDataSource>
        </div>
        &nbsp
        <div class="inputBox">
            <label>segment</label>
            <asp:DropDownList CssClass="dropDownInputField inputField" ID="ddl_subCateg" runat="server" DataSourceID="SQL_DataSource01" DataTextField="nomeSubCategoria" DataValueField="codSubCategProduto" AutoPostBack="True" OnSelectedIndexChanged="ddl_subCateg_SelectedIndexChanged"></asp:DropDownList>
            <asp:SqlDataSource ID="SQL_DataSource01" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [codSubCategProduto], [nomeSubCategoria] FROM [m16proj_tbl_subCategoriasProduto]"></asp:SqlDataSource>
        </div>
    </div>
    &nbsp

    <div class="inputBox">
        <label>euro</label>
        <asp:TextBox ID="txt_preco" runat="server" placeholder="Preço" CssClass="inputField"></asp:TextBox>
    </div>
    &nbsp

    <div class="inputBox">
        <label>archive</label>
        <asp:TextBox ID="txt_stock" runat="server" placeholder="Qtd. em Stock" TextMode="Number" Min="0" CssClass="inputField"></asp:TextBox>
    </div>
    &nbsp

    <asp:Button ID="btn_register" runat="server" Text="Inserir Produto" width="90%" OnClick="btn_register_Click"/>
</asp:Content>