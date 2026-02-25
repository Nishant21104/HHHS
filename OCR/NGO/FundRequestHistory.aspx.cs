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
    public partial class FundRequestHistory1 : System.Web.UI.Page
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
                    FetchApprovalstatus();
                }
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT ID,NGOName,PhoneNumber,Email,DonationAmount,Details,FundEndDate,Cause,FundDonated,Address,Status,FundCompleted,FundCompletedDate FROM tbl_NGOFundraisingRequest WHERE NGOName= @NGOName", con);
            cmd.CommandType = CommandType.Text;

            if (Session["UserName"] != null)
            {
                cmd.Parameters.AddWithValue("@NGOName", Session["UserName"].ToString());
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session expired, Please logout and login again.')", true);
            }
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);            
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            grdFundHistory.DataSource = dt;
            grdFundHistory.DataBind();
        }
        protected void FetchApprovalstatus()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_NGORegistration WHERE Name= @NGOName", con);
            cmd.CommandType = CommandType.Text;

            if (Session["UserName"] != null)
            {
                cmd.Parameters.AddWithValue("@NGOName", Session["UserName"].ToString());
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session expired, Please logout and login again.')", true);
            }
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                hdnApprovalStatus.Value = dt.Rows[0]["ApprovalByAdmin"] != null ? dt.Rows[0]["ApprovalByAdmin"].ToString() : string.Empty;
            }
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
        }
        protected void cmdComplete_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conStr);
                string NgoName = string.Empty;
                if (Session["UserName"] != null)
                {
                    NgoName = Session["UserName"].ToString();
                }

                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdFundHistory.DataKeys[row.RowIndex].Values[0].ToString();
                con.Open();
                SqlCommand cmdParam = new SqlCommand("SELECT 1 FROM tbl_NGOFundraisingRequest where FundDonated=DonationAmount AND NGOName= @NGOName AND ID =@ID", con);
                cmdParam.CommandType = CommandType.Text;
                cmdParam.Parameters.AddWithValue("@ID", ID);
                cmdParam.Parameters.AddWithValue("@NGOName", NgoName);
                adr = new SqlDataAdapter(cmdParam);
                dt = new DataTable();
                adr.Fill(dt);
                cmdParam.Dispose();
                con.Close();

                if (dt.Rows.Count > 0)
                {   con.Open();
                    SqlCommand cmd = new SqlCommand("update tbl_NGOFundraisingRequest Set Status=@Status,FundCompletedDate=@FundCompletedDate Where ID=" + ID, con);
                    cmd.Parameters.AddWithValue("@FundCompletedDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Status", "Completed");
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Details have been saved successfully !')", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Needed Fund amount and collected amount does not match!')", true);
                }
                FetchData();

            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        protected void btnaAddNewRequest_Click(object sender, EventArgs e)
        {
            if (hdnApprovalStatus.Value != "" && hdnApprovalStatus.Value == "Approved")
            {
                Response.Redirect("FundraisingRequests.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You are not eligible to request funds as approval is not made.')", true);
            }
        }
    }
}