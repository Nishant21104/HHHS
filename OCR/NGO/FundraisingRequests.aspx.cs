using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.NGO
{
    public partial class FundraisingRequests : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../Home/Home.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    FetchData();
                }
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_NGORegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "FETCHDATA");
            cmd.Parameters.AddWithValue("@Name", Session["UserName"].ToString());
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            txtname.Value = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : string.Empty;
            // txt.Value = dt.Rows[0]["AboutYou"].ToString();
            txtaddress.Value = dt.Rows[0]["Address"] != null ? dt.Rows[0]["Address"].ToString() : string.Empty;
            txtphone.Value = dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
            txtemail.Value = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;
            //txtCause.Value = dt.Rows[0]["MainPurpose"].ToString();
            //idPhoto.Value = @"~\NgoFiles\" + dt.Rows[0]["ProfilePhoto"].ToString();
            //idPhoto.Style.Add("border-radius", "50%");
            //idPhoto.Style.Add("width", "300px");
            //idPhoto.Style.Add("height", "300px");
            //idPhoto.Style.Add("object-fit", "cover");
            //idPhoto.Style.Add("object-position", "50% 100%");

            txtaddress.Attributes.Add("disabled", "disabled");
            txtphone.Attributes.Add("disabled", "disabled");
            txtemail.Attributes.Add("disabled", "disabled");
            // txtCause.Attributes.Add("disabled", "disabled");
            txtname.Attributes.Add("disabled", "disabled");
            //idPhoto.Attributes.Add("disabled", "disabled");

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                
                    con = new SqlConnection(conStr);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into tbl_NGOFundraisingRequest (NGOName,PhoneNumber,Email,DonationAmount,Details,FundEndDate,Cause,FundDonated,Address,AddDate,Status,AddBy,ModDate,ModBy,PhotoPath) Values(@NGOName,@PhoneNumber,@Email,@DonationAmount,@Details,@FundEndDate,@Cause,@FundDonated,@Address,@AddDate,@Status,@AddBy,@ModDate,@ModBy,@PhotoPath)", con);
                    cmd.Parameters.AddWithValue("@Name", txtname.Value);
                    if (Session["UserName"] != null)
                    {
                        cmd.Parameters.AddWithValue("@NGOName", Session["UserName"].ToString());
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session expired, Please logout and login again.')", true);
                    }
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtphone.Value);
                    cmd.Parameters.AddWithValue("@Email", txtemail.Value);
                    cmd.Parameters.AddWithValue("@DonationAmount", txtDonationAmount.Value);
                    cmd.Parameters.AddWithValue("@Details", txtDetails.Value);
                    cmd.Parameters.AddWithValue("@FundEndDate", txtEndDate.Value);
                    cmd.Parameters.AddWithValue("@Cause", ddlCause.SelectedValue);
                    cmd.Parameters.AddWithValue("@FundDonated", txtFundCollected.Value);
                    cmd.Parameters.AddWithValue("@Address", txtaddress.Value);
                    cmd.Parameters.AddWithValue("@AddDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@AddBy", Session["UserName"].ToString());
                    cmd.Parameters.AddWithValue("@ModDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ModBy", Session["UserName"].ToString());
                    cmd.Parameters.AddWithValue("@Status", "Pending");
                    cmd.Parameters.AddWithValue("@PhotoPath", idPhoto.Value);
                    //Session.Add("Updated", "Y");
                    cmd.ExecuteNonQuery();
                    con.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Fund Request Generated Succesfully. Taking you back to lists.');window.location='FundRequestHistory.aspx'", true);
                
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Fund Request has not been created. Please try again after sometime..');window.location='FundRequestHistory.aspx'", true);

            }
        }
    }
}