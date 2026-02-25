using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Donor
{
    public partial class DonorLogin : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand(@"select * from tbl_DonorRegistration where UserName = @username and Password = @password and EmailVerified = 1", con);
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session.Add("DonorID", dt.Rows[0]["ID"].ToString());
                    Session.Add("DonorUserName", txtUserName.Text.Trim());
                    Response.Redirect("DonorHome.aspx");
                    //ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Login to continue..');window.location='NGOLogin.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(),"validation","alert('Invalid credentials or email not verified.')",true);
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Something went wrong, Please try again later.');window.location='Home.aspx';", true);

            }
        }
    }
}