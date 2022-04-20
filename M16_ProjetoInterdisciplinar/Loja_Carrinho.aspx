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
        #contentPanel{
            max-width: 75%;
            min-height: 100%;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            place-items: center;
            margin: 10px;
            padding: 0 10px 0 10px;
        }
        .itemImage{
            max-height: 100%;
            width: auto;
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
            width: 100%;
            margin: 10px 10px 10px 10px;
            max-height: 25vh;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 15px 15px 15px 15px;
            overflow: hidden;
            display: flex;
            flex-direction: row;
        }
        .qtdContainer{
            display: flex;
            flex-direction: row;
            max-width: fit-content;
        }
        .qtdContainer input[type=number]{
            max-width: 50px;
            border-radius: 7px 7px 7px 7px;
            outline: none;
            border: none;
        }
        .actionsContainer{
            display: flex;
            flex-direction: row;
            width: 300px;
            min-height: 10px;
            margin-top: auto;
            background-color: rgba(0, 0, 0, 0.15);
            border-radius: 10px 10px 10px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
</asp:Content>
