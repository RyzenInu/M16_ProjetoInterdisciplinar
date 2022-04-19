<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_Carrinho.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_Carrinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        header{
            position: fixed;
        }
        #form1, main{
            justify-content: center;
        }
        #form1{
            height: 100%!important;
        }
        #contentPanel{
            margin: 90px 20px 20px 20px;
            min-width: 75%;
            min-height: 200px;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            display: flex;
            flex-direction: row;
        }
        #cartItemPanel{
            width: 100%;
            border-bottom: 1px black solid;
            max-height: 10vh;
            background-color: rgba(0, 0, 0, 0.15);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentPanel" runat="server">

    </div>
</asp:Content>
