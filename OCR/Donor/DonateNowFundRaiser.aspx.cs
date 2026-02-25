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
    public partial class DonateNowFundRaiser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        private DocumentVerifier documentVerifier = new DocumentVerifier();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["FundraiserID"] != null)
            {
                int FundraiserID = Convert.ToInt32(Request.QueryString["FundraiserID"]);

            }
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            string billNumber = GenerateRandomBillNumber();
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_AddPaymentFundraiser", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@DonationAmount", txtAmount.Value);
                        cmd.Parameters.AddWithValue("@PaymentType", "Online");
                        cmd.Parameters.AddWithValue("@CardHolder", txtCardHolder.Value);
                        cmd.Parameters.AddWithValue("@CVVNumber", txtCVV.Value);
                        cmd.Parameters.AddWithValue("@FundDonated", txtAmount.Value);
                        cmd.Parameters.AddWithValue("@BillNo", billNumber);
                        cmd.Parameters.AddWithValue("@BillingAddress", txtStreetAddress.Value);
                        cmd.Parameters.AddWithValue("@City", txtCity.Value);
                        cmd.Parameters.AddWithValue("@State", txtState.Value);
                        cmd.Parameters.AddWithValue("@ZipCode", txtZipCode.Value);
                        cmd.Parameters.AddWithValue("@TypeOfUser", "FundRaiser");

                        if (Request.QueryString["FundraiserID"] != null)
                        {
                            int FundraiserID = Convert.ToInt32(Request.QueryString["FundraiserID"]);
                            cmd.Parameters.AddWithValue("@FundraiserID", FundraiserID);
                        }

                        if (Session["DonorUserName"] != null)
                        {
                            cmd.Parameters.AddWithValue("@AddBy", Session["DonorUserName"].ToString());
                            cmd.Parameters.AddWithValue("@ModBy", Session["DonorUserName"].ToString());
                            cmd.Parameters.AddWithValue("@DonorName", Session["DonorUserName"].ToString());
                        }
                        if (Session["DonorID"] != null)
                        {
                            cmd.Parameters.AddWithValue("@DonorID", Session["DonorID"]);
                        }
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Payment successfull.');", true);
            }
            catch(Exception ex)
            {

                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert(Payment Failure, Please try again later.');", true);
            }
        }
        private bool AreDocumentsValid(string ngodocumentFileName, string fundraiserDocumentFileName)
        {
            bool isNGOValid = documentVerifier.VerifyNGODocument(ngodocumentFileName);
            bool isFundraiserValid = documentVerifier.VerifyFundraiserDocument(fundraiserDocumentFileName);

            return isNGOValid && isFundraiserValid;
        }
        public string GenerateRandomBillNumber()
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, 10)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}