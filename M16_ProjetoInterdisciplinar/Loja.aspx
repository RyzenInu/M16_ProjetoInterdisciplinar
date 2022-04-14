﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Loja";
    </script>
    <style>
        body, html{
            scroll-snap-type: none!important;
        }

        #contentPlaceHolder-wrapper{
            place-content: flex-start!important;
        }

        #ContentPlaceHolder1_Panel1{
            display: flex;
            flex-flow: wrap;
            width: 100%;
            justify-content: space-evenly;
        }

        .productImage{
            max-height: 300px;
            border-radius: 10px;
        }

        .productName{
            font-size: 12pt;
        }

        .productPrice{
            font-size: 14pt;
            font-weight: bolder;
        }

        .productName, .productPrice{
            margin-top: 8px;
        }

        .productPanel{
            display: flex;
            flex-direction: column;
            background-color: rgba(0, 0, 0, 0.15);
            padding: 7px;
            margin: 10px;
            border-radius: 10px;
            height: fit-content;
            max-width: fit-content;
            transition: all 0.15s ease-in-out;
            user-select: none;
        }

        .productPanel:hover{
            transform: scale(1.025);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">

    </asp:Panel>
</asp:Content>
