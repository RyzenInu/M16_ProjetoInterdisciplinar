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
            width: 75%;
            max-height: fit-content;
            background-color: rgba(0, 0, 0, 0.15);
            padding: 7px;
            border-radius: 10px;
            display: flex;
            flex-direction: row;
        }
        #productImage{
            max-height: 50vh;
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
            margin-top: 15px;
        }
        #btn_buy{
            height: 50px;
            min-width: 250px;
            width: auto;
            border-radius: 30px 30px 30px 30px;
            background: linear-gradient(45deg, #ffb980, #8d411A);
            outline: none;
            border: none;
            cursor: pointer;
            place-self: flex-end;
            font-weight: bold;
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
            <asp:Button ClientIDMode="Static" ID="btn_buy" runat="server" Text="Adicionar ao Carrinho" OnClick=""/>
        </div>
    </div>
</asp:Content>
