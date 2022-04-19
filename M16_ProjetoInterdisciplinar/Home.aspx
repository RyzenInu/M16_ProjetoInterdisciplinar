<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contentContainerPanel{
            /* Sizing properties */
            width: 85%;
            min-height: 300px;
            height: 70vh;

            /* Some other properties */
            display: flex;
            flex-direction: row;
            border-radius: 20px;
            background-color: rgba(0, 0, 0, 0.15);
            place-self: center;
            overflow: hidden;
            text-align: justify;
            margin: 15vh 0px;

            /* Scroll snap properties */
            scroll-snap-align: center;
        }
        .contentContainerPanel div{
            height: 100%;
            min-width: 50%;
            flex: 1;
        }
        .contentContainerPanel .contentText{
            padding: 10px 25px;
        }
        .contentContainerPanel .contentImage{
            background-color: rgba(0, 0, 0, 0.20);
            display: grid;
            place-items: center;
            overflow: hidden;
        }
        .contentContainerPanel .contentImage img {
            min-height: 100%;
        }
    </style>
    <script>
        window.document.title = "Home";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contentContainerPanel">
        <div class="contentText">
            <h1>Quem somos?</h1>
            <p>A MS-Materiais Sustentáveis é uma empresa de produção de vestuário, calçado e acessórios com materiais reciclavéis, maioritariamente a <b>cortiça</b>.</p>
        </div>
        <div class="contentImage">
            <img src="https://agriculturaemar.com/wp-content/uploads/2015/10/rolhas-01.jpg"/>
        </div>
    </div>
    <div class="contentContainerPanel">
        <div class="contentImage">
            <img src="https://www.visitevora.net/wp-content/uploads/2014/01/artesanato-evora-alentejo-cortica.jpg"/>
        </div>
        <div class="contentText">
            <h1>O nosso objetivo</h1>
            <p>Com a utilização de materiais como a cortiça, podemos diminuir a pegada ambiental da produção de outros materiais que são usados no vestuário, algo que é produzido em massa para toda a população do nosso planeta.</p>
        </div>
    </div>
    <div class="contentContainerPanel" id="contactos">
        <div class="contentText">
            <h1>Como nos contactar?</h1>
            <p>E-mail: ms-materiassustentaveis.business@gmail.com</p>
            <p>Telefone: 21 654 3256</p>
        </div>
    </div>
</asp:Content>
