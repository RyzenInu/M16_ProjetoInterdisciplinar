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

            lbl_password.Text = "";
            lbl_username.Text = "";

            if(txt_username.Text != "" && txt_password.Text != "")
            {
                Response.Write($"<script>console.log('{txt_password.Text + txt_username.Text}')<script/>");
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
                                Response.Redirect("Home.aspx");
                                break;
                        }
                    }
                    else
                    {
                        lbl_password.Text = "Palavra-passe incorreta.";
                        txt_password.Text = "";
                    }
                }
                else
                {
                    lbl_username.Text = "Esse nome utilizador não existe.";
                    txt_username.Text = "";
                }
            }
            else
            {
                if (txt_password.Text == "") { lbl_password.Text = "*Campo obrigatório."; }
                if (txt_username.Text == "") { lbl_username.Text = "*Campo obrigatório."; }
            }
        }
    }
}