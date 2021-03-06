using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Loja : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {
            AdicionarFiltros();
            AdicionarProdutos();
        }
        private void AdicionarProdutos()
        {
            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = "select * from m16proj_tbl_produtos order by codSubCategProduto";
            sqlDR = sqlCommand.ExecuteReader();
            while (sqlDR.Read())
            {
                Panel productPanel = new Panel();
                ImageButton imageButton = new ImageButton();
                Label lblName = new Label();
                Label lblPrice = new Label();

                imageButton.ImageUrl = "~/Imagens/" + sqlDR["imagem"];
                imageButton.CssClass = "productImage";
                imageButton.PostBackUrl = $"~/Loja_DetalhesProduto.aspx?codProduto={sqlDR["codProduto"]}";
                
                lblName.Text = sqlDR["nomeProduto"].ToString();
                lblName.CssClass = "productName";

                lblPrice.Text = sqlDR["preco"].ToString() + "€";
                lblPrice.CssClass = "productPrice";

                productPanel.CssClass = "productPanel";
                productPanel.Controls.Add(imageButton);
                productPanel.Controls.Add(lblName);
                productPanel.Controls.Add(lblPrice);


                Panel1.Controls.Add(productPanel);
            }
            sqlConnection.Close();
        }
        private void AdicionarFiltros()
        {
            /*
            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = "select * from m16proj_tbl_categoriasProduto";
            sqlDR = sqlCommand.ExecuteReader();
            while (sqlDR.Read())
            {
                LinkButton linkButton = new LinkButton();

                linkButton.Text = sqlDR["nomeCategoria"].ToString();
                linkButton.OnClientClick = ;

                filters.Controls.Add(linkButton);
            }
            sqlConnection.Close();
            */
        }
    }
}