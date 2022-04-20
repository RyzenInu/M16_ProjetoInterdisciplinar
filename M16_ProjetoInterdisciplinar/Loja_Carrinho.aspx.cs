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
            AddProducts();
        }
        private void AddProducts()
        {
            if (Session["codCliente"] == null || String.IsNullOrEmpty(Session["codCliente"].ToString()))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                int codCliente = Convert.ToInt32(Session["codCliente"].ToString());

                sqlCommand.Connection = sqlConnection;
                sqlConnection.Open();

                sqlCommand.CommandText = $"select m16proj_tbl_carrinho.codProduto, qtdProduto, imagem, nomeProduto from m16proj_tbl_carrinho inner join m16proj_tbl_produtos on m16proj_tbl_carrinho.codProduto = m16proj_tbl_produtos.codProduto where m16proj_tbl_carrinho.codCliente = {codCliente}";

                sqlDR = sqlCommand.ExecuteReader();
                while (sqlDR.Read())
                {
                    Panel cartItemPanel = new Panel();
                    Panel itemInfo = new Panel();
                    Panel qtdContainer = new Panel();
                    Panel actionsContainer = new Panel();

                    Label itemName = new Label();
                    Label qtd = new Label();
                    
                    Image itemImage = new Image();
                    TextBox itemQuantity = new TextBox();

                    itemImage.ImageUrl = $"~/Imagens/{sqlDR["imagem"]}";
                    itemImage.CssClass = "itemImage";
                    itemName.Text = sqlDR["nomeProduto"].ToString();

                    qtd.Text = "Qtd.:";

                    itemQuantity.Attributes.Add("type", "number");
                    itemQuantity.Text = sqlDR["qtdProduto"].ToString();

                    qtdContainer.Controls.Add(qtd);
                    qtdContainer.Controls.Add(itemQuantity);
                    qtdContainer.CssClass = "qtdContainer";

                    actionsContainer.CssClass = "actionsContainer";

                    itemInfo.CssClass = "itemInfo";
                    itemInfo.Controls.Add(itemName);
                    itemInfo.Controls.Add(qtdContainer);
                    itemInfo.Controls.Add(actionsContainer);

                    cartItemPanel.CssClass = "cartItemPanel";
                    cartItemPanel.Controls.Add(itemImage);
                    cartItemPanel.Controls.Add(itemInfo);

                    contentPanel.Controls.Add(cartItemPanel);
                }
            }
        }
    }
}