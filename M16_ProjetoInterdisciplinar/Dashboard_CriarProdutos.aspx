<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Dashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard_CriarProdutos.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Dashboard_CriarProdutos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.document.title = "Dashboard - Criar Produtos";
    </script>
    <style>
        #form1{
            padding: 0!important;
        }
        #formChild{
            height: fit-content;
            min-width: 40%;

            display: flex;
            flex-direction: column;
            place-items: center;
            place-content: center;
            text-align: left;

            /*background-color: rgba(0, 0, 0, 0.30);*/
            border-radius: 15px;

            overflow-y: visible;
        }
        @media only screen and (max-width: 900px) {
            #form1{}
        }

        .inputField, #ContentPlaceHolder1_FileUpload1{
            border: none;
            background-color: transparent;
            border-bottom: 1px solid rgba(255, 255, 255, 0.50);
            height: 30px;
            width: 100%;
            color: white;
        }

        .inputField:focus{
            outline: none;
        }
        .inputField::placeholder{
            color: rgba(255,255,255, 0.50);
            opacity: 1;
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

        #form1 .inputBox{
            width: 90%;
            display: flex;
            flex-direction: row;
        }

        #form1 .inputBox label {
            font-size: 16pt;
            min-height: 100%;
            display: grid;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.50);
            padding-right: 2px;
            color: rgba(255,255,255, 0.50);
            font-family: 'Material Icons';
            flex-shrink: 0;
        }
        
        .dropDownInputField{
            background-color: rgb(22, 22, 22);
            width: 100%;
        }
        .dropDownInputField option{
        } 

        .dropDownInputField:hover{
            cursor: pointer;
        }
        
        #categContainer{
            width: 90%;
            display: flex;
            flex-direction: column;
            place-items: center;
            border: 1px solid rgba(255,255,255, 0.50);
            border-radius: 7px;
            padding: 15px;
        }

        #categContainer .inputBox{
            width: 100%;
        }

        #categContainer span{
            font-size: 10pt;
            position: relative;
            display: block;
            float: left;
            top: 0px;
            padding: 0px 3px;
            place-self: flex-start;
            background-color: rgb(22,22,22);
            color: rgba(255,255,255, 0.50);
        }
        #ContentPlaceHolder1_UpdatePanel1{
            width: fit-content;
            height: fit-content;
            width: 100%;
            display: flex;
            place-content: center;
            place-items: center;
        }
        .aspVal{ /* Required Field Validators' styling */
            height: 0;
            width: 0;
            overflow: visible;
            font-size: 10pt;
            color: red;
        } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="formChild">
        <h2>Inserir novo Produto</h2>
        <div class="inputBox">
            <label>person</label>
            <asp:TextBox ID="txt_nomeProd" runat="server" placeholder="Nome do produto" CssClass="inputField"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="aspVal" ID="ReqFieldVal_nome" runat="server" ErrorMessage="*Campo Obrigatório" ControlToValidate="txt_nomeProd">
            </asp:RequiredFieldValidator>
        </div>
        &nbsp

        <div class="inputBox">
            <label>straighten</label>
            <asp:TextBox ID="txt_tamanho" runat="server" placeholder="Tamanho" CssClass="inputField"></asp:TextBox>
        </div>
        &nbsp

        <div class="inputBox">
            <label>photo</label>
            <asp:FileUpload ID="FileUpload1" runat="server"/>
            <asp:RequiredFieldValidator CssClass="aspVal" ID="ReqFieldVal_img" runat="server" ErrorMessage="*Campo Obrigatório" ControlToValidate="FileUpload1">
            </asp:RequiredFieldValidator>
        </div>
        &nbsp
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="categContainer">
                    <span>Categoria</span>
                    <div class="inputBox">
                        <label>menu</label>
                        <asp:DropDownList CssClass="dropDownInputField inputField" ID="ddl_categ" runat="server" DataSourceID="SqlDataSource1" DataTextField="nomeCategoria" DataValueField="codCategProduto" AutoPostBack="True" Enabled="True" OnSelectedIndexChanged="ddl_categ_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [codCategProduto], [nomeCategoria] FROM [m16proj_tbl_categoriasProduto]"></asp:SqlDataSource>
                    </div>
                    &nbsp
                    <span>Sub-categoria</span>
                    <div class="inputBox">
                        <label>segment</label>
                        <asp:DropDownList CssClass="dropDownInputField inputField" ID="ddl_subCateg" runat="server" DataSourceID="SQL_DataSource01" DataTextField="nomeSubCategoria" DataValueField="codSubCategProduto" AutoPostBack="True" OnSelectedIndexChanged="ddl_subCateg_SelectedIndexChanged"></asp:DropDownList>
                        <asp:SqlDataSource ID="SQL_DataSource01" runat="server" ConnectionString="<%$ ConnectionStrings:L2031ConnectionString %>" SelectCommand="SELECT [codSubCategProduto], [nomeSubCategoria] FROM [m16proj_tbl_subCategoriasProduto] WHERE ([codCategProduto] = @codCategProduto)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_categ" Name="codCategProduto" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        &nbsp

        <div class="inputBox">
            <label>euro</label>
            <asp:TextBox ID="txt_preco" runat="server" placeholder="Preço" CssClass="inputField"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="aspVal" ID="ReqFieldVal_preco" runat="server" ErrorMessage="*Campo Obrigatório" ControlToValidate="txt_preco">
            </asp:RequiredFieldValidator>
        </div>
        &nbsp

        <div class="inputBox">
            <label>archive</label>
            <asp:TextBox ID="txt_stock" runat="server" placeholder="Qtd. em Stock" TextMode="Number" Min="0" CssClass="inputField"></asp:TextBox>
            <asp:RequiredFieldValidator CssClass="aspVal" ID="ReqFieldVal_stock" runat="server" ErrorMessage="*Campo Obrigatório" ControlToValidate="txt_stock">
            </asp:RequiredFieldValidator>
        </div>
        &nbsp

        <asp:Button ID="btn_register" runat="server" Text="Inserir Produto" width="90%" OnClick="btn_register_Click"/>
    </div>
</asp:Content>