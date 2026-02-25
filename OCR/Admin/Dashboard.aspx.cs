using System;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            FetchUserCounts();
        }
        protected void FetchUserCounts()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Count(*)[FundRaiserCount] FROM [dbo].[tbl_FundraiserRegistration] ", con);
            cmd.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0] != null)
                {
                    fundRaiserCount.InnerText = dt.Rows[0]["FundRaiserCount"] != null ? dt.Rows[0]["FundRaiserCount"].ToString() : "0";
                }                
            }
            con.Open();
            SqlCommand cmd1 = new SqlCommand("SELECT Count(*)[DonorCount] FROM [dbo].[tbl_DonorRegistration]", con);
            cmd1.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmd1);
            dt = new DataTable();
            adr.Fill(dt);
            cmd1.ExecuteReader();
            cmd1.Dispose();
            con.Close();
            con.Open();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0] != null)
                {
                    donorCount.InnerText = dt.Rows[0]["DonorCount"] != null ? dt.Rows[0]["DonorCount"].ToString() : "0";
                }
                
            }
            SqlCommand cmd2 = new SqlCommand("SELECT Count(*)[NGOCount] FROM [dbo].[tbl_NGORegistration] ", con);
            cmd2.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmd2);
            dt = new DataTable();
            adr.Fill(dt);
            cmd2.ExecuteReader();
            cmd2.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0] != null)
                {
                    ngoCount.InnerText = dt.Rows[0]["NGOCount"] != null ? dt.Rows[0]["NGOCount"].ToString() : "0";
                }

            }
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmdDetail = new SqlCommand("SELECT 'NGO'[TypeofUser],Name,MainPurpose,ProfilePhoto,CONVERT(VARCHAR(10),AddDate,121)[AddDate] FROM tbl_NGORegistration where ID=(SELECT MAX(ID) FROM tbl_NGORegistration) UNION SELECT 'Donor'[TypeofUser], Name, DonorDetails, ProfilePhoto, CONVERT(VARCHAR(10), AddDate, 121)[AddDate] FROM tbl_DonorRegistration where ID = (SELECT MAX(ID) FROM tbl_DonorRegistration) UNION SELECT 'Fund'[TypeofUser],Name,FundraiserDetails,ProfilePhoto,CONVERT(VARCHAR(10), AddDate, 121)[AddDate] FROM tbl_FundraiserRegistration where ID = (SELECT MAX(ID) FROM tbl_FundraiserRegistration) ", con);
            cmdDetail.CommandType = CommandType.Text;
            //cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmdDetail);
            dt = new DataTable();
            adr.Fill(dt);
            cmdDetail.ExecuteReader();
            cmdDetail.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {

                if (dt.Rows[0] != null)
                {
                    //imgNGO.ImageUrl = dt.Rows[0]["TypeofUser"] != null ? dt.Rows[0]["TypeofUser"].ToString() : "";
                    hNGO.InnerText = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : "";
                    pNGO.InnerText = dt.Rows[0]["MainPurpose"] != null ? dt.Rows[0]["MainPurpose"].ToString() : "";
                    imgNGO.ImageUrl = @"~\NgoFiles\"+dt.Rows[0]["ProfilePhoto"] != null ? @"~\NgoFiles\"+dt.Rows[0]["ProfilePhoto"].ToString() : "";

                }
                if (dt.Rows.Count > 1)
                {
                    if (dt.Rows[1] != null)
                    {
                        hDonor.InnerText = dt.Rows[1]["Name"] != null ? dt.Rows[1]["Name"].ToString() : "";
                        pDonor.InnerText = dt.Rows[1]["MainPurpose"] != null ? dt.Rows[1]["MainPurpose"].ToString() : "";
                        string imageUrl = dt.Rows[1]["ProfilePhoto"] != null ? dt.Rows[1]["ProfilePhoto"].ToString() : "";
                        imageUrl = imageUrl.Replace("DonorFiles", "");
                        imageUrl = @"~\DonorFiles\" + imageUrl;
                        imgDonor.ImageUrl = imageUrl;
                    }
                }
                if (dt.Rows.Count > 2)
                {
                    if (dt.Rows[2] != null)
                    {
                        hFund.InnerText = dt.Rows[2]["Name"] != null ? dt.Rows[2]["Name"].ToString() : "";
                        pFund.InnerText = dt.Rows[2]["MainPurpose"] != null ? dt.Rows[2]["MainPurpose"].ToString() : "";
                        imgFundRaiser.ImageUrl = @"~\FundImages\" + dt.Rows[2]["ProfilePhoto"] != null ? @"~\FundImages\" + dt.Rows[2]["ProfilePhoto"].ToString() : "";
                    }
                }
            }
        }
    }
}