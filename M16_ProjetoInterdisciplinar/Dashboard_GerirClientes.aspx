<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_GerirClientes.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_GerirClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Gerir Clientes";
    </script>
    <style>
        #dashboardContent{
            display: flex;
            align-content: center;
        }
        #dashboardContent div{
            width: 100%;
            display: flex;
            place-content: center;
            place-items: center;
        }
        #GridView1{
            width: 90%;
            max-height: 80%;
            overflow-y: auto;
            text-align: center;
            border: none;
        }
        #GridView1 tr td{
            height: 10vh;
            border: none;
        }
        #GridView1 tr{
            border-bottom: 1px solid rgba(255,255,255,0.5);
        }
        #GridView1 tr:last-child{
            border: none!important;
        }
        #GridView1 th{
            max-height: 20px;
            border: none;
            border-bottom: 1px solid white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gerir Clientes</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" DataKeyNames="codCliente" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="codCliente" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="codCliente" />
            <asp:BoundField DataField="nome" HeaderText="Cliente" SortExpression="nome" />
            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
            <asp:BoundField DataField="morada" HeaderText="Morada" SortExpression="morada" />
            <asp:BoundField DataField="nif" HeaderText="NIF" SortExpression="nif" />
            <asp:BoundField DataField="dataNascimento" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data de Nascimento" SortExpression="dataNascimento" />
            <asp:BoundField DataField="sexo" HeaderText="Sexo" SortExpression="sexo" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [nome], [email], [codCliente], [morada], [nif], [dataNascimento], [sexo] FROM [m16proj_tbl_cliente]"></asp:SqlDataSource>
</asp:Content>
