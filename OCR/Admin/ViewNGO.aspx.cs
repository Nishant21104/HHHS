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
    public partial class ViewNGO : System.Web.UI.Page
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
                LoadNGOList();
            }
        }
        private void LoadNGOList()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [ID],[Name],[UserName],[PhoneNumber],[Email],[State],[City],[PinCode],[Address],[Proofofidentication],[ApprovalByAdmin] FROM [dbo].[tbl_NGORegistration]", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();

                    grdNGO.DataSource = dt;
                    grdNGO.DataBind();
                }
            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdNGO.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from tbl_NGORegistration where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                con.Close();
                LoadNGOList();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('NGO successfully deleted !')", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        protected void cmdValid_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdNGO.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("update tbl_NGORegistration SET IsValid=@Valid,ApprovalByAdmin=@ApprovalByAdmin where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@Valid", "Valid");
                cmd.Parameters.AddWithValue("@ApprovalByAdmin", "Approved");
                cmd.ExecuteNonQuery();
                con.Close();
                LoadNGOList();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('NGO successfully updated !')", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        protected void cmdInValid_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdNGO.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("update tbl_NGORegistration SET IsValid=@Valid,ApprovalByAdmin=@ApprovalByAdmin where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@Valid", "Valid");
                cmd.Parameters.AddWithValue("@ApprovalByAdmin", "Rejected");
                cmd.ExecuteNonQuery();
                con.Close();
                LoadNGOList();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('NGO successfully updated !')", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        //protected void cmdDownLoad_Click(object sender, EventArgs e)
        //{
        //    Button myBut = sender as Button;
        //    GridViewRow gRow = myBut.NamingContainer as GridViewRow;

        //    string strFileOnly = gRow.Cells[14].Text;
        //    string strFile = "";
        //    strFile = Server.MapPath(@"~/NGOFiles/POI/" + strFileOnly);

        //    string sMineType = MimeMapping.GetMimeMapping(strFileOnly);
        //    Response.ContentType = sMineType;
        //    Response.AppendHeader("Content-Disposition", "attachment; filename=" + strFileOnly);
        //   Response.TransmitFile(strFile);
        //    Response.End();
        //}
    }
}