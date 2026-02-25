using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Activities;

namespace OCR.Donor
{
    public partial class MakeAppointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DonorUserName"] != null)
            {
                FetchData();
            }
            else
            {
                Response.Redirect("DonorLogin.aspx");
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_DonorRegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "FETCHDATA");
            cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            txtName.Value = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : string.Empty;
            txtMobile.Value = dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
            txtEmail.Value = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;

            txtName.Attributes.Add("disabled", "disabled");
            txtMobile.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
         
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                

                
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tbl_Appointment (Name,UserName,PhoneNumber,Email,AppointmentDetail,AppointmentDate,AppointmentMinutes,AddDate,AddBy,ModDate,ModBy,AppointmentTime,Status,NGOName,NgoID,FundraiserName) Values(@Name,@UserName,@PhoneNumber,@Email,@AppointmentDetail,@AppointmentDate,@AppointmentMinutes,@AddDate,@AddBy,@ModDate,@ModBy,@AppointmentTime,@Status,@NGOName,@NgoID,@FundraiserName)", con);
                cmd.Parameters.AddWithValue("@Name", txtName.Value);
                if (Session["DonorUserName"] != null)
                {
                    cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session expired, Please logout and login again.')", true);
                }
                cmd.Parameters.AddWithValue("@PhoneNumber", txtMobile.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Value);
                cmd.Parameters.AddWithValue("@AppointmentDetail", txtAppointmentDesc.InnerText);
                cmd.Parameters.AddWithValue("@AppointmentDate", txtDate.Value);
                cmd.Parameters.AddWithValue("@AppointmentTime", txtTime.Value);
                
                cmd.Parameters.AddWithValue("@AddDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@AddBy", Session["DonorUserName"].ToString());
                cmd.Parameters.AddWithValue("@ModDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@ModBy", Session["DonorUserName"].ToString());
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.Parameters.AddWithValue("@NGOName", ddlNGO.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@NgoID", ddlNGO.SelectedValue);
                cmd.Parameters.AddWithValue("@FundraiserName",ddlFundRaiser.SelectedValue);

                int minutes = 0;

                if (rb30.Checked) minutes = 30;
                else if (rb60.Checked) minutes = 60;
                else if (rb90.Checked) minutes = 90;

                if (minutes == 0)
                {
                    // nothing selected
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please select appointment duration.')", true);
                    return;
                }
                cmd.Parameters.AddWithValue("@AppointmentMinutes", minutes);


                //Session.Add("Updated", "Y");
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Appointment have been created Succesfully.');window.location='ViewAppointment.aspx';", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Appointment has not been Succesfull. Please try again after sometime..');window.location='DonorHome.aspx';", true);

            }
        }
        protected void BindNGO()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_NGORegistration", con);
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@fname", drpState.SelectedValue);
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            ddlNGO.DataTextField = "Name";
            ddlNGO.DataValueField = "ID";
            ddlNGO.DataSource = dt;
            ddlNGO.DataBind();

            ddlNGO.Items.Insert(0, "Select NGO");
            ddlNGO.Visible = true;
            ddlFundRaiser.Visible = false;
            cmd.Dispose();
            con.Close();
        }
        protected void BindFundRaiser()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_FundraiserRegistration", con);
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@fname", drpState.SelectedValue);
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            ddlFundRaiser.DataTextField = "Name";
            ddlFundRaiser.DataValueField = "ID";
            ddlFundRaiser.DataSource = dt;
            ddlFundRaiser.DataBind();

            ddlFundRaiser.Items.Insert(0, "Select Fundraiser");
            ddlFundRaiser.Visible = true;
            ddlNGO.Visible = false;
            cmd.Dispose();
            con.Close();
        }
        protected void ddlTypeOfUser_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlTypeOfUser.SelectedValue == "NGO")
            {
                ddlNGO.Visible = true;
                BindNGO();
            }
            else if(ddlTypeOfUser.SelectedValue == "Fundraiser")
            {
                ddlFundRaiser.Visible = true;
                BindFundRaiser();
            }
            else
            {
                ddlNGO.Visible = false;
                ddlFundRaiser.Visible = false;
            }
        }
    }
}