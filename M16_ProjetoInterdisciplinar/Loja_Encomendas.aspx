<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Loja.Master" AutoEventWireup="true" CodeBehind="Loja_Encomendas.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Loja_Encomendas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Encomendas";
    </script>
    <style>
        form div{
            min-width: 90%;
            padding: 10px;
        }
        #GridView1{
            width: 100%;
            border: none;
        }
        #GridView1 img{
            max-height: 25vh;
            width: auto;
            border-radius: 20px;
            padding: 10px;
        }
        th{
            border: none;
        }
        #GridView1 tr{
            text-align: left;
            border-bottom: 1px solid rgba(0,0,0,0.25)!important;
        }
        #GridView1 tr:last-child{
            border: none!important;
        }
        #GridView1 tr, #GridView1 td{
            height: 10vh;
            overflow: hidden;
            border: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" ClientIDMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="numEncomenda" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True">
            <ControlStyle ForeColor="Black" />
            </asp:CommandField>
            <asp:BoundField DataField="numEncomenda" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="numEncomenda" />
            <asp:BoundField DataField="dataEncomenda" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data de Encomenda" SortExpression="dataEncomenda" />
            <asp:BoundField DataField="valorTotal" DataFormatString="{0}€" HeaderText="Valor Total" SortExpression="valorTotal" />
            <asp:BoundField DataField="situacao" HeaderText="Estado" SortExpression="situacao" />
            <asp:BoundField DataField="dataEntrega" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data de Entrega" SortExpression="dataEntrega" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [numEncomenda], [dataEncomenda], [situacao], [dataEntrega], [valorTotal] FROM [m16proj_tbl_encomendas] WHERE ([codCliente] = @codCliente)">
        <SelectParameters>
            <asp:SessionParameter Name="codCliente" SessionField="codCliente" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
