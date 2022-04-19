<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_DetalhesProduto.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_DetalhesProduto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        header{
            position: fixed;
        }
        #form1{
            place-content: center;
        }
        #contentPanel{
            margin-top: 70px;
            width: 75%;
            height: 80%;
            background-color: rgba(0, 0, 0, 0.15);
            padding: 7px;
            border-radius: 10px;
            display: flex;
            flex-direction: row;
        }
        #productImage{
            max-height: 100%;
            border-radius: 10px;
        }
        #productContent{
            display: flex;
            flex-direction: column;
            place-content: flex-start;
            width: fit-content;
            padding: 10px;
        }
        #lbl_productName{
            font-size: 16pt;
        }
        #lbl_preco{
            font-weight: bold;
            font-size: 20pt;
        }
        .productTextContent{
            margin-bottom: 15px;
        }
        #btn_buy{
            height: 50px;
            min-width: 250px;
            width: auto;
            border-radius: 30px 30px 30px 30px;
            background: linear-gradient(45deg, #ffb980, #d96529);
            outline: none;
            border: none;
            cursor: pointer;
            place-self: flex-end;
            font-weight: bolder;
            font-size: 12pt;
        }

        #submitBox{
            display: flex;
            flex-direction: row;
            width: fit-content;
        }
        #qtdProduto{
            outline: none;
            border: none;
            max-width: 60px;
            border-radius: 15px;
        }
        #qtdProduto:focus{
            outline: none;
            border: none;   
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentPanel">
        <asp:Image ID="productImage" runat="server" ClientIDMode="Static"></asp:Image>
        <div id="productContent">
            <asp:Label CssClass="productTextContent" ID="lbl_productName" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Label CssClass="productTextContent" ID="lbl_preco" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Label CssClass="productTextContent" ID="lbl_tamanho" runat="server"></asp:Label>
            <div id="submitBox">
                <input type="number" id="qtdProduto" runat="server" ClientIDMode="Static" min="1" value="1"/>
                <asp:Button ClientIDMode="Static" ID="btn_buy" runat="server" Text="Adicionar ao Carrinho" OnClick="btn_buy_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
