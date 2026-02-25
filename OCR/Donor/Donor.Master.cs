using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Donor
{
    public partial class Donor : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //// Allow verify page itself
            //if (Request.Path.EndsWith("/VerifyDonorEmail.aspx", StringComparison.OrdinalIgnoreCase))
            //    return;

            //// Enforce verification
            //if (!IsEmailVerified(Session["DonorUserName"].ToString()))
            //{
            //    Response.Redirect("~/Donor/VerifyDonorEmail.aspx", false);
            //    Context.ApplicationInstance.CompleteRequest();
            //}
        }

        //private bool IsEmailVerified(string username)
        //{
        //    bool verified = false;

        //    using (SqlConnection con = new SqlConnection(
        //        ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString))
        //    {
        //        SqlCommand cmd = new SqlCommand(
        //            "SELECT EmailVerified FROM tbl_DonorRegistration WHERE UserName = @UserName",
        //            con);

        //        cmd.Parameters.AddWithValue("@UserName", username);

        //        con.Open();
        //        object result = cmd.ExecuteScalar();
        //        con.Close();

        //        if (result != null && result != DBNull.Value)
        //        {
        //            verified = Convert.ToBoolean(result);
        //        }
        //    }

        //    return verified;
        //}


    }
}