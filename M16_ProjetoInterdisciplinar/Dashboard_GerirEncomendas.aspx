<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_GerirEncomendas.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_GerirEncomendas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Gerir Encomendas";
    </script>
    <style>
        #form1{
            display: flex;
            flex-direction: column;
        }
        #form1 div{
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
    <h2>Gerir Encomendas</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="numEncomenda" DataSourceID="SqlDataSource1" ClientIDMode="Static" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Selecionar" ShowSelectButton="True">
            <ControlStyle ForeColor="White" />
            </asp:CommandField>
            <asp:BoundField DataField="numEncomenda" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="numEncomenda" />
            <asp:BoundField DataField="nome" HeaderText="Cliente" SortExpression="nome" />
            <asp:BoundField DataField="valorTotal" HeaderText="Valor Total" SortExpression="valorTotal" DataFormatString="{0}€" />
            <asp:BoundField DataField="dataEncomenda" HeaderText="Data da Encomenda" SortExpression="dataEncomenda" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="situacao" HeaderText="Estado" SortExpression="situacao" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT m16proj_tbl_encomendas.numEncomenda, m16proj_tbl_cliente.nome, m16proj_tbl_encomendas.valorTotal, m16proj_tbl_encomendas.dataEncomenda, m16proj_tbl_encomendas.situacao FROM m16proj_tbl_cliente INNER JOIN m16proj_tbl_encomendas ON m16proj_tbl_cliente.codCliente = m16proj_tbl_encomendas.codCliente ORDER BY m16proj_tbl_encomendas.dataEncomenda, m16proj_tbl_encomendas.situacao"></asp:SqlDataSource>
</asp:Content>
