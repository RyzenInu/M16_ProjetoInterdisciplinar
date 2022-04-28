using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Dashboard_AlterarDetalhesEncomenda : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection($@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            fillPage();
        }
        private void fillPage()
        {
            if (!String.IsNullOrWhiteSpace(Request.QueryString["numEncomenda"]))
            {
                int numEncomenda = Convert.ToInt32(Request.QueryString["numEncomenda"]);
                string estado = Request.QueryString["estado"].ToString();
                headerInfo.InnerText = $"Encomenda Nº{numEncomenda} - {estado}";
            }
        }

        protected void btn_alterarEncomenda_Click(object sender, EventArgs e)
        {
            string estado = ddl_estado.SelectedValue.ToString();
            string dataEntrega = txt_date.Text;
            int numEncomenda = Convert.ToInt32(Request.QueryString["numEncomenda"].ToString());

            sqlCommand.Connection = sqlConnection;
            if(String.IsNullOrWhiteSpace(dataEntrega) & estado != null)
            {
                sqlCommand.CommandText = $"update m16proj_tbl_encomendas set situacao = '{estado}' where numEncomenda = {numEncomenda}";
            }
            else
            {
                sqlCommand.CommandText = $"update m16proj_tbl_encomendas set situacao = '{estado}', dataEntrega = '{dataEntrega}' where numEncomenda = {numEncomenda}";
            }
            
            sqlConnection.Open();
            try
            {
                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            Response.Redirect("Dashboard_GerirEncomendas.aspx");
        }
    }
}