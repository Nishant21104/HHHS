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
    public partial class FundDetails : System.Web.UI.Page
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
                if (Request.QueryString["FundraiserID"] != null)
                {
                    int FundRaiserID = Convert.ToInt32(Request.QueryString["FundraiserID"]);
                    FetchFundraiserData(FundRaiserID);
                    Session.Add("FundRaiserID", FundRaiserID);
                }              
            }
        }
        
        
        protected void FetchFundraiserData(int FundraiserID)
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tbl_FundraiserRegistration] Where ID= @FundraiserID", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@FundraiserID", FundraiserID);
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                fundRaiserName.InnerText = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : string.Empty;
                h1TypeofDonation.InnerText = dt.Rows[0]["TypeOfDonation"] != null ? dt.Rows[0]["TypeOfDonation"].ToString() : string.Empty;
                p1Para.InnerText = dt.Rows[0]["FundraiserDetails"] != null ? dt.Rows[0]["FundraiserDetails"].ToString() : string.Empty;
                Image1.ImageUrl = @"~\FundImages\" + dt.Rows[0]["ProfilePhoto"] != null ? @"~\FundImages\" + dt.Rows[0]["ProfilePhoto"].ToString() : string.Empty;
                lblPhoneNumber.InnerText = dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
                lblEmail.InnerText = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;
                lblAddress.InnerText = dt.Rows[0]["Address"] != null ? dt.Rows[0]["Address"].ToString() : string.Empty;
                fundAmount.InnerText = dt.Rows[0]["RequiredAmount"] != null ? dt.Rows[0]["RequiredAmount"].ToString() : string.Empty;
                validTill.InnerText = dt.Rows[0]["EndDate"] != null ? dt.Rows[0]["EndDate"].ToString() : string.Empty;
                lblApprovedByAdmin.InnerText = dt.Rows[0]["ApprovalByAdmin"] != null ? dt.Rows[0]["ApprovalByAdmin"].ToString() : string.Empty;
            }           

        }

        protected void btnDonateNow_Click(object sender, EventArgs e)
        {
            if (lblApprovedByAdmin.InnerText=="Approved")
            {
                Response.Redirect("DonateNowFundRaiser.aspx?FundraiserID= " + Session["FundraiserID"]);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('This Fundraiser is not approved to raise fund. Please choose another Fundraiser')", true);
            }
        }
    }
}