using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M16_ProjetoInterdisciplinar
{
    public partial class MasterPage_Dashboard : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null || String.IsNullOrEmpty(Session["name"].ToString()))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                userName.InnerText = Session["name"].ToString();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }
    }
}