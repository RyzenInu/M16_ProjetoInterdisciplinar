<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root{
            box-sizing: border-box;
        }
        #form1{
            height: 50%;
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

        #form1 input[type=text], #form1 input[type=password]{
            border: none;
            background-color: transparent;
            border-bottom: 1px solid rgba(0, 0, 0, 0.45);
            height: 30px;
        }

        #form1 input[type=text]:focus, #form1 input[type=password]:focus{
            outline: none;
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

        header{
            max-height: 70px;
        }

        main{
            padding-top: 70px !important;
        }

        main, main div{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        /*TEST*/
        label{
            font-family: 'Material Icons'
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
            border-bottom: 1px solid rgba(0, 0, 0, 0.45);
            padding-right: 2px;
            color: #777777;
        }
        #formTitle{
            margin-bottom: 20px;
            font-size: 18pt;
            font-weight: bold;
            text-align: left;
            width: 90%;
            justify-content: initial;
            display: flex;
            flex-direction: row;
            
        }
        #formTitle a{
            font-size: 10pt;
            font-weight: normal;
            color: black;
            text-decoration: none;
            display: flex;
            flex-direction: row;
            place-items: center;
            margin-left: 15px;
        }
        .fieldValidatorLabel{
            color: red;
            font-size: 10pt;
            position: relative;
            height: 0;
            overflow: visible;
        }
    </style>
    <script>
        window.document.title = "Login";
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
        <div id="formTitle">
            Login
            <a href="">Não tem conta? Registe-se aqui</a>
        </div>
        <div class="inputBox">
            <label>person</label>
            <asp:TextBox ID="txt_username" runat="server" width="100%" placeholder="Nome de utilizador"></asp:TextBox>
        </div>
        <asp:Label ID="lbl_username" runat="server" CssClass="fieldValidatorLabel"></asp:Label>
        &nbsp

        <div class="inputBox">
            <label>key</label>
            <asp:TextBox ID="txt_password" runat="server" width="100%" TextMode="Password" placeholder="Palavra-passe"></asp:TextBox>
        </div>
        <asp:Label ID="lbl_password" runat="server" CssClass="fieldValidatorLabel"></asp:Label>
        &nbsp

        <asp:Button ID="btn_login" runat="server" Text="Entrar" width="90%" OnClick="Button1_Click"/>
    </form>
</asp:Content>
