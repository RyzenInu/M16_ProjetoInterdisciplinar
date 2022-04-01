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
        SqlConnection sqlConnection = new SqlConnection(@"Server=SQL-AULAS;DataBase=L2031;Trusted_Connection=True;");
        SqlCommand sqlCommand = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandText = $"insert into m16proj_tbl_login(username, password, tipo) values(@username, @password, '2')";

            sqlCommand.Parameters.AddWithValue("@username", txt_username.Text);
            sqlCommand.Parameters.AddWithValue("@password", txt_password.Text);

            sqlConnection.Open();
            try
            {
                sqlCommand.ExecuteNonQuery();
            }
            catch
            {

            }
        }
    }
}