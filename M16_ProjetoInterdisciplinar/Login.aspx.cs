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
        SqlConnection sqlConnection = new SqlConnection(@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text;

            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = $"select * from m16proj_tbl_login where username = '{username}'";
            sqlConnection.Open();
            sqlDR = sqlCommand.ExecuteReader();

            lbl_password.Text = "";
            lbl_username.Text = "";

            if(txt_username.Text != "" && txt_password.Text != "")
            {
                if (sqlDR.Read())
                {
                    if (txt_password.Text == sqlDR["password"].ToString())
                    {
                        int userType = Convert.ToInt32(sqlDR["tipo"]);
                        int codLogin = Convert.ToInt32(sqlDR["codLogin"]);

                        switch (userType)
                        {
                            case 0:     //admin
                                Response.Redirect("Dashboard_main.aspx");
                                break;
                            case 1:     //funcionário
                                Response.Redirect("Dashboard_Main.aspx");
                                break;
                            case 2:     //cliente
                                sqlDR.Close();
                                sqlCommand.CommandText = $"select codCliente from m16proj_tbl_cliente where codLogin = {codLogin}";
                                try
                                {
                                    sqlDR = sqlCommand.ExecuteReader();
                                    if (sqlDR.Read())
                                    {
                                        Session["codCliente"] = sqlDR["codCliente"].ToString();
                                    }
                                    //Response.Write(Session["codCliente"]);
                                }
                                catch (Exception ex)
                                {
                                    Response.Write(ex.Message);
                                }
                                Response.Redirect("Loja.aspx");
                                break;
                        }
                    }
                    else
                    {
                        lbl_password.Text = "Palavra-passe incorreta.";
                        txt_password.Text = "";
                        txt_password.Focus();
                    }
                }
                else
                {
                    lbl_username.Text = "Esse nome utilizador não existe.";
                    txt_username.Text = "";
                    txt_username.Focus();
                }
            }
            else
            {
                if (txt_password.Text == "") { lbl_password.Text = "*Campo obrigatório."; }
                if (txt_username.Text == "") { lbl_username.Text = "*Campo obrigatório."; }
                txt_username.Focus();
            }
        }
    }
}