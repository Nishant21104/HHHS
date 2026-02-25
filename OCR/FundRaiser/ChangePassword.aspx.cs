using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace OCR.FundRaiser
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        string str = null;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            object obj = null;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();

            Session["UserName"] = TextBox_user_name.Text;
            str = "select count(*) from tbl_FundraiserRegistration where UserName=@UserName and Password =@Password";
            com = new SqlCommand(str, con);
            com.CommandType = CommandType.Text;
            com.Parameters.AddWithValue("@UserName", Session["UserName"]);
            com.Parameters.AddWithValue("@Password", txtPassword.Text);
            obj = com.ExecuteScalar();
            if ((int)(obj) != 0)
            {
                Response.Redirect("FundraiserHome.aspx");
            }
            else
            {
                lb1.Text = "Invalid Username and Password";
            }
            con.Close();
        }
    }
}