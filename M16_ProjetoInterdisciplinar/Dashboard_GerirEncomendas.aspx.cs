using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Dashboard_GerirEncomendas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int row = GridView1.SelectedIndex;
            int numEncomenda = Convert.ToInt32(GridView1.Rows[row].Cells[1].Text.ToString());
            string estado = GridView1.Rows[row].Cells[5].Text;

            Response.Redirect($"Dashboard_AlterarDetalhesEncomenda.aspx?numEncomenda={numEncomenda}&estado={estado}");
        }
    }
}