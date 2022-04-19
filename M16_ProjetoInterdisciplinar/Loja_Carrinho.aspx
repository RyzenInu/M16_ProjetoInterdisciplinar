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
            height: 100%!important;
        }
        #contentPlaceHolder-wrapper{
            margin-top: 70px;   
        }
        #contentPanel{
            margin-top: 110px;
            min-width: 75%;
            min-height: 200px;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .itemImage{
            height: 100%;
            width: 200px;
        }
        .itemInfo{
            min-height: 100%;
            width: 100%;
            display: flex;
            flex-direction: column;
            padding: 10px;
        }
        .itemInfo span{
            margin-bottom: 5px;
        }
        .itemInfo span:first-child{
            font-size: 14pt;
        }
        .itemInfo span:last-child{
            font-size: 14pt;
        }
        .cartItemPanel{
            width: 90%;
            max-height: 25vh;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 15px 15px 15px 15px;
            margin: 10px;
            overflow: hidden;
            display: flex;
            flex-direction: row;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentPanel" runat="server" ClientIDMode="Static">

    </div>
</asp:Content>
