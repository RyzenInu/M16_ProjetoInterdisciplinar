using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Dashboard_CriarProdutos : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=SQL-AULAS;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            string name = txt_nomeProd.Text;
            int preco = Convert.ToInt32(txt_preco.Text);
            int stock = Convert.ToInt32(txt_stock.Text);
            int subCateg = Convert.ToInt32(ddl_subCateg.SelectedValue);

            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = "insert into m16proj_tbl_produtos";
        }

        protected void ddl_subCateg_SelectedIndexChanged(object sender, EventArgs e)
        {
            int codSubCateg = Convert.ToInt32(ddl_subCateg.SelectedValue);
            int codCateg;

            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = $"select codCategProduto from m16proj_tbl_subCategoriasProduto where codSubCategProduto = '{codSubCateg}'";

            try
            {
                sqlDR = sqlCommand.ExecuteReader();
                if (sqlDR.Read())
                {
                    codCateg = Convert.ToInt32(sqlDR["codCategProduto"].ToString());
                    ddl_categ.SelectedValue = codCateg.ToString();
                }
            } 
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Erro: {ex.Message}')</script>");
            }
        }
    }
}