using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Dashboard_CriarProdutos : System.Web.UI.Page
    {
        
        SqlConnection sqlConnection = new SqlConnection($@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            string name = txt_nomeProd.Text;
            string img = Path.GetFileName(FileUpload1.FileName); //Guardar o nome do ficheiro selecionado.
            FileUpload1.SaveAs(Server.MapPath("/Imagens/") + img); //Guardar imagem na pasta localizada em "/Imagens/", no servidor.
            string tamanho = txt_tamanho.Text;
            double preco = Convert.ToDouble(txt_preco.Text);
            int stock = Convert.ToInt32(txt_stock.Text);
            int subCateg = Convert.ToInt32(ddl_subCateg.SelectedValue);

            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = "insert into m16proj_tbl_produtos(nomeProduto, preco, stock, codSubCategProduto, tamanho, imagem) values(@nomeProduto, @preco, @stock, @codSubCategProduto, @tamanho, @imagem)";

            sqlCommand.Parameters.AddWithValue("@nomeProduto", name);
            sqlCommand.Parameters.AddWithValue("@preco", preco);
            sqlCommand.Parameters.AddWithValue("@stock", stock);
            sqlCommand.Parameters.AddWithValue("@codSubCategProduto", subCateg);
            sqlCommand.Parameters.AddWithValue("@tamanho", tamanho);
            sqlCommand.Parameters.AddWithValue("@imagem", img);
            
            try
            {
                sqlCommand.ExecuteNonQuery();
                Response.Write("<script>alert('Produto registado com sucesso.')</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Erro no registo do produto.\nErro: {ex.Message}')</script>");
            }
        }

        protected void ddl_subCateg_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
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
            */
        }

        protected void ddl_categ_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
            int codSubCateg;
            int codCateg = Convert.ToInt32(ddl_categ.SelectedValue);

            sqlCommand.Connection = sqlConnection;
            sqlConnection.Open();

            sqlCommand.CommandText = $"select codSubCategProduto from m16proj_tbl_SubCategoriasProduto where codCategProduto = '{codCateg}'";

            try
            {
                sqlDR = sqlCommand.ExecuteReader();
                if (sqlDR.Read())
                {
                    codSubCateg = Convert.ToInt32(sqlDR["codSubCategProduto"].ToString());
                    ddl_subCateg.SelectedValue = codSubCateg.ToString();
                }
            } 
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Erro: {ex.Message}')</script>");
            }
            */
        }
    }
}