using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Dashboard_AlterarDetalhesEncomenda : System.Web.UI.Page
    {
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
    }
}