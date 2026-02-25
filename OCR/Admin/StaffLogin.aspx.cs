using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Admin
{
    public partial class StaffLogin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_StaffDetails where UserName =@username and Password=@password and TypeOfStaff='Admin'", con);
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session.Add("AdminUserName", txtUserName.Text.Trim());
                    Response.Redirect("Dashboard.aspx");
                    //ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Login to continue..');window.location='NGOLogin.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('.Please try again after sometime..');window.location='~/Dashboard.aspx';", true);

            }
        }
    }
}