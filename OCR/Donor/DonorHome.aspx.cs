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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["DonorUserName"] !=null)
            //{ 
            //    lblUserName.Text = Session["DonorUserName"].ToString();
            //}
        }
        protected void FetchNGOFundData(int NgoID)
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT top 2 [ID],[NGOName],[PhoneNumber],[Email],[DonationAmount],[Details],[FundEndDate],[Cause],[FundDonated],[Address],[Status],[AddDate],[AddBy],[ModDate],[ModBy],[PhotoPath] FROM [dbo].[tbl_NGOFundraisingRequest]", con);
            cmd.CommandType = CommandType.Text;
           
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
               
                h3.InnerText = dt.Rows[0]["Cause"].ToString();
                p3.InnerText = dt.Rows[0]["Details"].ToString();
                Imagefirst.ImageUrl = @"~\NgoFiles\" + dt.Rows[0]["PhotoPath"].ToString();
                if (dt.Rows.Count >= 1)
                {
                    h3.InnerText = dt.Rows[1]["Cause"].ToString();
                    p3.InnerText = dt.Rows[1]["Details"].ToString();
                    Imagesecond.ImageUrl = @"~\NgoFiles\" + dt.Rows[1]["PhotoPath"].ToString();
                }
            }

        }

        protected void btnaAddNewRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("NgoList.aspx");
        }
    }
}