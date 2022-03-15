<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    </style>
    <script>
        onload = function () {
            document.getElementById("header").style.height = "70px";
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
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" />
    </form>
</asp:Content>
