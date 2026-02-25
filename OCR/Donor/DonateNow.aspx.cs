using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Donor
{

    public partial class DonateNow : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        public string RazorpayKey = ConfigurationManager.AppSettings["RazorpayKey"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["NgoID"] == null)
                {
                    Response.Redirect("DonorHome.aspx");
                }
                hfRazorpayKey.Value = ConfigurationManager.AppSettings["RazorpayKey"];
                hfNgoId.Value = Request.QueryString["NgoID"];
                hfDonorId.Value = Session["DonorID"]?.ToString();
                hfDonorName.Value = Session["DonorUserName"]?.ToString();
                hfFundReqId.Value = Session["NGOFundraisingRequestID"]?.ToString();
            }

        }


        //        [WebMethod(EnableSession = true)]
        //        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //        public static string SavePayment(
        //            string amount,
        //            string billingAddress,
        //            string city,
        //            string state,
        //            string zipCode,
        //            int ngoId,
        //            int donorId,
        //            string donorName,
        //            int ngoFundraisingRequestId
        //        )
        //        {
        //            try
        //            {
        //                string conStr = ConfigurationManager
        //                    .ConnectionStrings["DbConnectionString"]
        //                    .ConnectionString;

        //                string billNo = GenerateRandomBillNumber();

        //                using (SqlConnection con = new SqlConnection(conStr))
        //                using (SqlCommand cmd = new SqlCommand("sp_AddPaymentNGO", con))
        //                {
        //                    cmd.CommandType = CommandType.StoredProcedure;

        //                    cmd.Parameters.AddWithValue("@DonationAmount", amount);
        //                    cmd.Parameters.AddWithValue("@PaymentType", "Online");
        //                    cmd.Parameters.AddWithValue("@FundDonated", amount);
        //                    cmd.Parameters.AddWithValue("@BillNo", billNo);
        //                    cmd.Parameters.AddWithValue("@BillingAddress", billingAddress);
        //                    cmd.Parameters.AddWithValue("@City", city);
        //                    cmd.Parameters.AddWithValue("@State", state);
        //                    cmd.Parameters.AddWithValue("@ZipCode", zipCode);
        //                    cmd.Parameters.AddWithValue("@TypeOfUser", "NGO");
        //                    cmd.Parameters.AddWithValue("@NGOID", ngoId);
        //                    cmd.Parameters.AddWithValue("@NGOFundraisingRequestID", ngoFundraisingRequestId);
        //                    cmd.Parameters.AddWithValue("@DonorID", donorId);
        //                    cmd.Parameters.AddWithValue("@DonorName", donorName);
        //                    cmd.Parameters.AddWithValue("@AddBy", donorName);
        //                    cmd.Parameters.AddWithValue("@ModBy", donorName);

        //                    con.Open();
        //                    cmd.ExecuteNonQuery();
        //                }

        //                return "SUCCESS|" + billNo;
        //            }
        //            catch (Exception ex)
        //            {
        //                return "ERROR|" + ex.Message;
        //            }
        //        }



        //    private static string GenerateRandomBillNumber()
        //        {
        //            Random random = new Random();
        //            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        //            return new string(Enumerable.Repeat(chars, 10)
        //                .Select(s => s[random.Next(s.Length)]).ToArray());
        //        }
        //    }
        //}

        protected void btnHiddenSave_Click(object sender, EventArgs e)
        {
            try
            {
                string amount = hfAmount.Value;
                string paymentId = hfPaymentId.Value;

                int ngoId = Convert.ToInt32(Request.QueryString["NgoID"]);
                int donorId = Convert.ToInt32(Session["DonorID"]);
                string donorName = Session["DonorUserName"].ToString();
                int fundReqId = Convert.ToInt32(Session["NGOFundraisingRequestID"]);

                string billNo = GenerateBillNumber();

                using (SqlConnection con = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_AddPaymentNGO", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@DonationAmount", amount);
                    cmd.Parameters.AddWithValue("@PaymentType", "Online");
                    cmd.Parameters.AddWithValue("@FundDonated", amount);
                    cmd.Parameters.AddWithValue("@BillNo", billNo);
                    cmd.Parameters.AddWithValue("@TypeOfUser", "NGO");
                    cmd.Parameters.AddWithValue("@NGOID", ngoId);
                    cmd.Parameters.AddWithValue("@NGOFundraisingRequestID", fundReqId);
                    cmd.Parameters.AddWithValue("@DonorID", donorId);
                    cmd.Parameters.AddWithValue("@DonorName", donorName);
                    cmd.Parameters.AddWithValue("@AddBy", donorName);
                    cmd.Parameters.AddWithValue("@ModBy", donorName);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "success",
                    "alert('Payment successful. Bill No: " + billNo + "'); window.location='DonorHome.aspx';",
                    true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "err",
                    "alert('Error saving payment: " + ex.Message.Replace("'", "") + "');",
                    true);
            }
        }
        private string GenerateBillNumber()
        {
            return "BILL-" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }
    }
}