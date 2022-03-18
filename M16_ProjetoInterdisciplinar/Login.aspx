<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root{
            box-sizing: border-box;
        }
        #form1{
            height: 50%;
            width: 40%;
            min-height: 200px;
            min-width: 150px;

            display: flex;
            flex-direction: column;
            place-items: center;
            place-content: center;
            text-align: left;

            background-color: rgba(0, 0, 0, 0.30);
            border-radius: 15px;

            overflow-y: auto;
        }
        header{
            max-height: 70px;
        }
        main{
            padding-top: 70px !important;
        }
        main, main div{
            display: flex;
            flex-direction: column;
            place-items: center;
            place-content: center;
        }
    </style>
    <script>
        onload = function () {
            //document.getElementById("header").style.height = "70px";
            document.getElementById("header").style.backgroundPosition = "0 -520px";
            for (var i = 0; i < navbarItems.length; i++) {
                navbarItems[i].style.height = "70px";
            }
            document.getElementsByClassName("header-section-right")[0].style.maxWidth = "0%";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">

        <h2>Login</h2>

        <asp:TextBox ID="txt_username" runat="server" width="90%" placeholder="nome"></asp:TextBox>
        <asp:Label ID="lbl_username" runat="server"></asp:Label>
        &nbsp

        <asp:TextBox ID="txt_password" runat="server" width="90%" TextMode="Password" placeholder="palavra-passe"></asp:TextBox>
        <asp:Label ID="lbl_password" runat="server"></asp:Label>
        &nbsp

        <asp:Button ID="btn_login" runat="server" Text="Entrar" width="55%" OnClick="Button1_Click"/>
    </form>
</asp:Content>
