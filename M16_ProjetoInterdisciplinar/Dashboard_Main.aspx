<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_Main.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Main";
    </script>
    <style>
        #divider50percent{
            display: flex;
            flex-direction: row;
            height: 100%;
            width: 100%;
            padding: 20px;
        }
        #divider50percent div{
            flex: 1;
            height: fit-content;
            width: auto;
            margin: 8vw;
            max-width: 50%;
            border: 2px solid white;
            border-radius: 15px;
        }
        .gridViewStyle{
            width: 100%;
            max-height: 80%;
            overflow-y: auto;
            text-align: center;
            border: none;
            text-align: center;
        }
        .gridViewStyle tr td{
            height: 10vh;
            border: none;
        }
        .gridViewStyle tr{
            border-bottom: 1px solid rgba(255,255,255,0.5);
        }
        .gridViewStyle tr:last-child{
            border: none!important;
        }
        .gridViewStyle th{
            max-height: 20px;
            border: none;
            border-bottom: 1px solid white;
        }
        .gridViewStyle{

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Dashboard</h1>
    <div id="divider50percent" ClientIDMode="Static">
        <!-- Statistics 1 -->
        <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" CssClass="gridViewStyle" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Qtd de Encomendas de Hoje" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT count(dataEncomenda)
FROM m16proj_tbl_encomendas
WHERE dataEncomenda = @dataEncomenda">
            <SelectParameters>
                <asp:SessionParameter Name="dataEncomenda" SessionField="dataHoje" />
            </SelectParameters>
        </asp:SqlDataSource>

        <!-- Statistics 2 -->
        <asp:GridView ID="GridView2" ClientIDMode="Static" runat="server" CssClass="gridViewStyle" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="Column1" HeaderText="Encomendas Totais" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="Select count(numEncomenda)
from m16proj_tbl_encomendas"></asp:SqlDataSource>
    </div>
</asp:Content>
