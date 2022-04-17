<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_Carrinho.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_Carrinho" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentPanel">

    </div>
</asp:Content>
