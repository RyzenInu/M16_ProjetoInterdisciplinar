using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Loja_Carrinho : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {
            AddProducts();
        }
        private void AddProducts()
        {
            int codCliente = Convert.ToInt32(Session["codCliente"].ToString());

            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = $"select m16proj_tbl_carrinho.codProduto, qtdProduto, imagem, nomeProduto from m16proj_tbl_carrinho inner join m16proj_tbl_produtos on m16proj_tbl_carrinho.codProduto = m16proj_tbl_produtos.codProduto where m16proj_tbl_carrinho.codCliente = {codCliente}";

            sqlDR = sqlCommand.ExecuteReader();
            while (sqlDR.Read())
            {
                Panel cartItemPanel = new Panel();
                Image itemImage = new Image();
                Label itemName = new Label();
                Label itemQuantity = new Label();

                itemImage.ImageUrl = $"~/Imagens/{sqlDR["imagem"]}";
                itemName.Text = sqlDR["nomeProduto"].ToString();
                itemQuantity.Text = sqlDR["qtdProduto"].ToString();

                cartItemPanel.CssClass = "cartItemPanel";
                cartItemPanel.Controls.Add(itemImage);
                cartItemPanel.Controls.Add(itemName);
                cartItemPanel.Controls.Add(itemQuantity);

                contentPanel.Controls.Add(cartItemPanel);
            }
        }
    }
}