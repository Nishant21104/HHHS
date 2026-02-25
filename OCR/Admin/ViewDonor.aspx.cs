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
    public partial class ViewDonor : System.Web.UI.Page
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
                LoadLDonorist();
            }
        }
        private void LoadLDonorist()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tbl_DonorRegistration]", con))
                {
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    grdDonors.DataSource = dt;
                    grdDonors.DataBind();
                }
            }
        }
        protected void cmdDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdDonors.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from tbl_DonorRegistration where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.ExecuteNonQuery();
                con.Close();
                LoadLDonorist();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Donors successfully deleted !')", true);
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
                string ID = grdDonors.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("update tbl_DonorRegistration SET ApprovalByAdmin=@ApprovalByAdmin where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@ApprovalByAdmin", "Approved");
                cmd.ExecuteNonQuery();
                con.Close();
                LoadLDonorist();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Donors successfully updated !')", true);
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
                string ID = grdDonors.DataKeys[row.RowIndex].Values[0].ToString();
                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("update tbl_DonorRegistration SET ApprovalByAdmin=@ApprovalByAdmin where ID=@ID", con);
                cmd.Parameters.AddWithValue("@ID", ID);
                cmd.Parameters.AddWithValue("@ApprovalByAdmin", "Rejected");
                cmd.ExecuteNonQuery();
                con.Close();
                LoadLDonorist();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Donors successfully updated !')", true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }
    }
}