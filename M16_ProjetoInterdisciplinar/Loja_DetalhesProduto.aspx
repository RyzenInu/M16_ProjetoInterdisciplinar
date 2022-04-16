<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_DetalhesProduto.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_DetalhesProduto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentPanel">
        <asp:Image ID="productImage" runat="server" ClientIDMode="Static"></asp:Image>
        <div id="productContent">
            <asp:Label ID="lbl_productName" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Label ID="lbl_preco" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Label ID="lbl_tamanho" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
