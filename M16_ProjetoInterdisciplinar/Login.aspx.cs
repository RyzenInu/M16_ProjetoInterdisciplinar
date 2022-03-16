using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=SQL-AULAS;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = $"select * from m16projeto_tbl_login where username = '{txt_username.Text}'";
            sqlConnection.Open();
            sqlDR = sqlCommand.ExecuteReader();
            if (sqlDR.Read())
            {
                if (txt_password.Text == sqlDR["password"].ToString())
                {
                    int userType = Convert.ToInt32(sqlDR["type"]);

                    switch (userType)
                    {
                        case 0:     //admin
                            Response.Redirect("");
                            break;
                        case 1:     //funcionário
                            Response.Redirect("");
                            break;
                        case 2:     //cliente
                            Response.Redirect("Loja.aspx");
                            break;
                    }
                }
            }
        }
    }
}