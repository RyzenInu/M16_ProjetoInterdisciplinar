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
            if (Session["codCliente"] == null || String.IsNullOrEmpty(Session["codCliente"].ToString()))
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btn_confirmCart_Click(object sender, EventArgs e)
        {
            string codCliente = Session["codCliente"].ToString();
            string date = DateTime.Now.ToString("yyyy-MM-dd");

            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = $"insert into m16proj_tbl_encomendas(dataEncomenda, situacao, codCliente) values(@dataEncomenda, @situacao, @codCliente)";
            
            sqlCommand.Parameters.AddWithValue("@dataEncomenda", date);
            sqlCommand.Parameters.AddWithValue("@situacao", "Em processamento.");
            sqlCommand.Parameters.AddWithValue("@codCliente", codCliente);

            sqlConnection.Open();
            try
            {
                sqlCommand.ExecuteNonQuery();
                sqlCommand.CommandText = $"select numEncomenda from m16proj_tbl_encomendas where codCliente = {codCliente}";
                sqlDR = sqlCommand.ExecuteReader();
                if (sqlDR.Read())
                {
                    int num = Convert.ToInt32(sqlDR["numEncomenda"].ToString());
                    sqlCommand.CommandText = $"insert into m16proj_tbl_detalhes_encomenda(numEncomenda, codProduto, qtdProduto) select '{num}', codProduto, qtdProduto from m16proj_tbl_carrinho where m16proj_tbl_carrinho.codCliente='{codCliente}'";
                    sqlConnection.Close();
                    sqlConnection.Open();

                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                    sqlConnection.Open();

                    sqlCommand.CommandText = $"delete from m16proj_tbl_carrinho where codCliente = '{codCliente}'";
                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();
                    sqlConnection.Open();

                    sqlCommand.CommandText = $"update m16proj_tbl_encomendas set valorTotal = (select Sum(preco * qtdProduto) from m16proj_tbl_detalhes_encomenda, m16proj_tbl_produtos where m16proj_tbl_detalhes_encomenda.codProduto = m16proj_tbl_produtos.codProduto and m16proj_tbl_detalhes_encomenda.numEncomenda = '{num}') where m16proj_tbl_encomendas.numEncomenda = '{num}'";
                    sqlCommand.ExecuteNonQuery();

                    Response.Write("<script>alert('Compra Finalizada com sucesso.')</script>");
                    Response.Redirect("Loja_Encomendas.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Response.Redirect("");
        }
    }
}