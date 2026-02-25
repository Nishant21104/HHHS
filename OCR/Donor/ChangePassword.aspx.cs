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
    public partial class ChangePassword : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        string str = null;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (ViewState["PasswordVerified"] == null)
            {
                lb1.Text = "Please verify current password first";
                return;
            }

            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lb1.Text = "New password and confirm password do not match";
                return;
            }

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "UPDATE tbl_DonorRegistration SET Password=@NewPassword WHERE UserName=@UserName",
                    con);

                cmd.Parameters.AddWithValue("@NewPassword", txtNewPassword.Text.Trim());
                cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());

                cmd.ExecuteNonQuery();
            }

            lb1.ForeColor = System.Drawing.Color.Green;
            lb1.Text = "Password updated successfully";

            ClientScript.RegisterStartupScript( this.GetType(),"pwdChanged","alert('Password updated successfully'); window.location='DonorHome.aspx';",true);
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM tbl_DonorRegistration WHERE UserName=@UserName AND Password=@Password",
                    con);

                cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
                cmd.Parameters.AddWithValue("@Password", txtCurrentPassword.Text.Trim());

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    ViewState["PasswordVerified"] = true;
                    pnlVerify.Visible = false;
                    pnlChange.Visible = true;
                    lb1.Text = "";
                }
                else
                {
                    lb1.Text = "Current password is incorrect";
                }
            }
        }
        //protected void btn_login_Click(object sender, EventArgs e)
        //{
        //    object obj = null;
        //    SqlConnection con = new SqlConnection(strConnString);
        //    con.Open();

        //    Session["UserName"] = TextBox_user_name.Text;
        //    str = "select count(*) from tbl_DonorRegistration where UserName=@UserName and Password =@Password";
        //    com = new SqlCommand(str, con);
        //    com.CommandType = CommandType.Text;
        //    com.Parameters.AddWithValue("@UserName", Session["UserName"]);
        //    com.Parameters.AddWithValue("@Password", txtPassword.Text);
        //    obj = com.ExecuteScalar();
        //    if ((int)(obj) != 0)
        //    {
        //        Response.Redirect("DonorHome.aspx");
        //    }
        //    else
        //    {
        //        lb1.Text = "Invalid Username and Password";
        //    }
        //    con.Close();
        //}
    }
}