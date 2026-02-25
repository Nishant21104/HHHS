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
    public partial class AddStaff : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("select distinct username from tbl_staffdetails where UserName =@username", con);
                cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    lblErrorMessage.Text = "User Name is unavailable, please enter some other user name";
                    return;
                }
                else
                {
                    con = new SqlConnection(conStr);
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("insert into tbl_staffdetails(Name,UserName,City,State,PinCode,PhoneNumber,Email,Address,Password,AddDate,TypeOfStaff,ProfilePhoto) VALUES (@Name,@UserName,@City,@State,@PinCode,@PhoneNumber,@Email,@Address,@Password,@AddDate,@TypeOfStaff,@ProfilePhoto)", con);
                    cmd1.CommandType = CommandType.Text;
                    cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd1.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd1.Parameters.AddWithValue("@TypeofStaff", ddlTypeofStaff.SelectedItem.Text);
                    cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Address", txtPassword.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd1.Parameters.AddWithValue("@AddDate", txtPassword.Text.Trim());
                    cmd1.Parameters.AddWithValue("@TypeOfStaff", txtPassword.Text.Trim());
                    
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Login to continue..');window.location='StaffLogin.aspx';", true);

                }

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registration UnSuccesfully.Please try again after sometime..');window.location='DonorHome.aspx';", true);

            }
        }
    }
}