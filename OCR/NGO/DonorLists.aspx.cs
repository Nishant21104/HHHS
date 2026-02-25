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
    public partial class DonorLists : System.Web.UI.Page
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
                    LoadDonorist();
                }
            }
        }
        private void LoadDonorist()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tbl_DonorPaymentDetails] Where NgoID=@NgoID ", con))
                {
                    con.Open();
                    if (Session["NgoID"] != null)
                    {
                        cmd.Parameters.AddWithValue("@NgoID", Session["NgoID"]);
                    }                    
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    grdDonors.DataSource = dt;
                    grdDonors.DataBind();
                }
            }
        }
    }
}