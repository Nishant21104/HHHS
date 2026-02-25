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
    public partial class NgoDetails : System.Web.UI.Page
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
                if (Request.QueryString["NgoID"] != null)
                {
                    int NgoID = Convert.ToInt32(Request.QueryString["NgoID"]);
                    FetchNGOFundData(NgoID);
                }
            }
        }
        protected void FetchNGOFundData(int NgoID)
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT DISTINCT TOP 1 * FROM tbl_NGORegistration A JOIN tbl_NGOFundraisingRequest B ON A.Name=B.NGOName WHERE A.ID=@ID", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@ID", NgoID);
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                ngoName.InnerText= dt.Rows[0]["NGOName"] != null ? dt.Rows[0]["NGOName"].ToString() : string.Empty;
                h1Cause.InnerText = dt.Rows[0]["Cause"] != null ? dt.Rows[0]["Cause"].ToString() : string.Empty;
                p1Para.InnerText = dt.Rows[0]["Details"] != null ? dt.Rows[0]["Details"].ToString() : string.Empty;
                Image1.ImageUrl = @"~\NgoFiles\" + dt.Rows[0]["ProfilePhoto"] != null ? @"~\NgoFiles\"+dt.Rows[0]["ProfilePhoto"].ToString() : string.Empty;
                lblPhoneNumber.InnerText =dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty; 
                lblEmail.InnerText = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;
                lblAddress.InnerText =dt.Rows[0]["Address"] != null ? dt.Rows[0]["Address"].ToString() : string.Empty;
                fundAmount.InnerText= dt.Rows[0]["DonationAmount"] != null ? dt.Rows[0]["DonationAmount"].ToString() : string.Empty;
                validTill.InnerText= dt.Rows[0]["FundEndDate"] != null ? dt.Rows[0]["FundEndDate"].ToString() : string.Empty;
                hApprovalStatus.InnerText = dt.Rows[0]["ApprovalByAdmin"] != null ? dt.Rows[0]["ApprovalByAdmin"].ToString() : string.Empty;
                lblGovID.InnerText = dt.Rows[0]["UniqueRegId"] != null ? dt.Rows[0]["UniqueRegId"].ToString() : string.Empty;
                hdnFundraiserID.Value= dt.Rows[0]["ID1"] != null ? dt.Rows[0]["ID1"].ToString() : string.Empty; 
            }

        }
        protected void btnDonateNow_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["NgoID"] != null)
            {
                int NgoID = Convert.ToInt32(Request.QueryString["NgoID"]);
                Session["NgoID"] = NgoID;
            }           
            if (hApprovalStatus.InnerText=="Approved")
            {
                Session.Add("NGOFundraisingRequestID", hdnFundraiserID.Value);
                Response.Redirect("DonateNow.aspx?NGOId= "+ Session["NgoID"]);
            }
            else
            {

                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('This NGO is not approved to raise fund. Please choose another NGO')", true);
            }
           
        }
    }
}