<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="M16_ProjetoInterdisciplinar.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root{
            box-sizing: border-box;
        }
        body, html{
            scroll-snap-type: y mandatory;
        }
        .contentContainerPanel{
            /* Sizing properties */
            width: 90%;
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
            scroll-snap-stop: always;
        }
        .contentContainerPanel div{
            height: 100%;
            max-width: 50%;
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
            height: 100%;        
        }
    </style>
    <script>
        window.document.title = "Home";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contentContainerPanel">
        <div class="contentText">
            <h1>O nosso objetivo</h1>
            <p>Com a utilização de materiais como a cortiça, podemos diminuir a pegada ambiental da produção de outros materiais que são usados no vestuário, algo que é produzido em massa para toda a população do nosso planeta.</p>
        </div>
        <div class="contentImage">
            <img src="https://www.visitevora.net/wp-content/uploads/2014/01/artesanato-evora-alentejo-cortica.jpg"/>
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
</asp:Content>
