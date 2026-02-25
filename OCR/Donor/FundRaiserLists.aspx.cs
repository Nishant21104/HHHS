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
    public partial class FundRaiserDetails : System.Web.UI.Page
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
                LoadFundraiserList();
            }
        }
        private void LoadFundraiserList()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [ID],[Name],[PhoneNumber],[Email],[RequiredAmount],[EndDate],[TypeOfDonation],[FundCollected],[AnnualSalary],[ApprovalByAdmin] FROM [dbo].[tbl_FundraiserRegistration]", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    gvFundraiser.DataSource = dt;
                    gvFundraiser.DataBind();
                }
            }
        }
    }
}