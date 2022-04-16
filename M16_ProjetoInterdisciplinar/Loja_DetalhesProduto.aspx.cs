using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Loja_DetalhesProduto : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {
            Fillpage();
        }

        private void Fillpage()
        {
            if (!String.IsNullOrWhiteSpace(Request.QueryString["codProduto"]))
            {
                int id = Convert.ToInt32(Request.QueryString["codProduto"]);
                sqlCommand.Connection = sqlConnection;
                sqlConnection.Open();
                sqlCommand.CommandText = $"select * from m16proj_tbl_produtos where codProduto = {id}";
                sqlDR = sqlCommand.ExecuteReader();

                if (sqlDR.Read())
                {
                    productImage.ImageUrl = "~/Imagens/" + sqlDR["imagem"];
                    lbl_productName.Text = sqlDR["nomeProduto"].ToString();
                    lbl_preco.Text = sqlDR["preco"].ToString();
                    if (!String.IsNullOrEmpty(sqlDR["tamanho"].ToString())){
                        lbl_tamanho.Text = "Tamanho: " + sqlDR["tamanho"].ToString();
                    }
                }
            }
        }
    }
}