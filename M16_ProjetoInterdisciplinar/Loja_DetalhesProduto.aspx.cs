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
            AdicionarProduto();
        }

        int id;

        private void AdicionarProduto()
        {
            if (!String.IsNullOrWhiteSpace(Request.QueryString["codProduto"]))
            {
                id = Convert.ToInt32(Request.QueryString["codProduto"]);
                sqlCommand.Connection = sqlConnection;
                sqlConnection.Open();
                sqlCommand.CommandText = $"select * from m16proj_tbl_produtos where codProduto = {id}";
                sqlDR = sqlCommand.ExecuteReader();

                if (sqlDR.Read())
                {
                    productImage.ImageUrl = "~/Imagens/" + sqlDR["imagem"];
                    lbl_productName.Text = sqlDR["nomeProduto"].ToString();
                    lbl_preco.Text = sqlDR["preco"].ToString() + "€";
                    qtdProduto.Attributes.Add("max", sqlDR["stock"].ToString());
                    if (!String.IsNullOrEmpty(sqlDR["tamanho"].ToString())){
                        lbl_tamanho.Text = "Tamanho: " + sqlDR["tamanho"].ToString();
                    }
                }
            }
            sqlConnection.Close();
        }

        protected void btn_buy_Click(object sender, EventArgs e)
        {
            if (Session["codCliente"] == null || String.IsNullOrEmpty(Session["codCliente"].ToString()))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                sqlCommand.Connection = sqlConnection;
                sqlConnection.Open();

                sqlCommand.CommandText = $"insert into m16proj_tbl_carrinho(codCliente, codProduto, qtdProduto) values(@codCliente, @codProduto, @qtdProduto)";

                sqlCommand.Parameters.AddWithValue("@codCliente", Session["codCliente"].ToString());
                sqlCommand.Parameters.AddWithValue("@codProduto", id);
                sqlCommand.Parameters.AddWithValue("@qtdProduto", qtdProduto.Value);

                try
                {
                    sqlCommand.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
            sqlConnection.Close();
        }
    }
}