using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace M16_ProjetoInterdisciplinar
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection sqlConnection = new SqlConnection(@"Server=RYZENLAPTOP;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommandLogin = new SqlCommand();
        SqlCommand sqlCommandCliente = new SqlCommand();
        SqlDataReader sqlDR;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            //Variables
            string name = txt_name.Text;
            string username = txt_username.Text;
            string email = txt_email.Text;
            string password = txt_password.Text;
            string codLogin;

            //SQL Connections + Open
            sqlCommandLogin.Connection = sqlConnection;
            sqlCommandCliente.Connection = sqlConnection;
            sqlConnection.Open();

            //Verificar se o nome de utilizador já existe na base de dados
            sqlCommandLogin.CommandText = $"select username from m16proj_tbl_login where username = '{username}'";

            try
            {
                sqlDR = sqlCommandLogin.ExecuteReader();
                if (!sqlDR.Read()) //Se não existir...
                {
                    //tbl_login
                    sqlDR.Close();
                    sqlCommandLogin.Dispose();
                    sqlCommandLogin.CommandText = "insert into m16proj_tbl_login(username, password, tipo) values(@username, @password, '2')";
                    
                    sqlCommandLogin.Parameters.AddWithValue("@username", username);
                    sqlCommandLogin.Parameters.AddWithValue("@password", password);

                    try
                    {
                        sqlCommandLogin.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('Não foi possível criar o login. \nMensagem de erro: {ex.Message}')</script>");
                    }

                    sqlCommandCliente.CommandText = $"select codLogin from m16proj_tbl_login where username = '{username}'";
                    sqlDR = sqlCommandCliente.ExecuteReader();
                    if (sqlDR.Read())
                    {
                        codLogin = sqlDR["codLogin"].ToString();

                        //tbl_cliente
                        sqlDR.Close();
                        sqlCommandLogin.Dispose();
                        sqlCommandCliente.CommandText = "insert into m16proj_tbl_cliente(codLogin, nome, email) values(@codLogin, @nome, @email)";

                        sqlCommandCliente.Parameters.AddWithValue("@codLogin", codLogin);
                        sqlCommandCliente.Parameters.AddWithValue("@nome", name);
                        sqlCommandCliente.Parameters.AddWithValue("@email", email);

                        try
                        {
                            sqlCommandCliente.ExecuteNonQuery();
                            Response.Redirect("Home.aspx");
                        }
                        catch (Exception ex)
                        {
                            Response.Write($"<script>alert('Não foi possível criar o login. \nMensagem de erro: {ex.Message}')</script>");
                        }
                    }
                    else
                    {
                        Response.Write($"<script>alert('Não foi possível registar o cliente para este login.')</script>");
                    }
                }
                else //Se o nome existir...
                {
                    lbl_username.Text = "Esse nome de utilizador já existe.";
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Não foi possível registar o utilizador. \nMensagem de erro: {ex.Message}')</script>");
            }
        }
    }
}