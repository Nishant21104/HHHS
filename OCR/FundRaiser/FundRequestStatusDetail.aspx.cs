using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.FundRaiser
{
    public partial class FundRequestStatusDetail : System.Web.UI.Page
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
                    BindListView();
                    pnlRequestDetails.Visible = false;
                }
            }
        }        
        private void BindListView()
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [tbl_FundraiserRegistration] Where UserName=@UserName", con))
                {
                    con.Open();
                    if (Session["UserName"] != null)
                    {
                        cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                    grdRequestDetails.DataSource = dt;
                    grdRequestDetails.DataBind();                  
                }
            }
            
        }
        private void BindValuesPanel(int ID)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [ID],[Name],[UserName],[City],[State],[PinCode],[PhoneNumber],[Email],[Address],[Password],[AddDate],[BloodType],[TypeOfDonation],[TypeOfDisease],[FundraiserDetails],[ProfilePhoto],[RequiredAmount],[Status],[StartDate],[EndDate],[Description],[MainReport],[FundCollected],[AadharCard],[AadharCardDocument],[PANNumber],[PANNumberPhoto],[AnnualSalary]FROM [tbl_FundraiserRegistration] WHERE ID= @ID", con))
                {
                     cmd.Parameters.AddWithValue("@ID", ID);
                    
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    con.Close();                  
                    foreach (DataRow row in dt.Rows)
                    {

                        hdnId.Value = row["Id"].ToString();
                        lblName.Text = row["Name"].ToString();
                        lblPhoneNumber.Text = row.IsNull("PhoneNumber") ? null : row["PhoneNumber"].ToString();
                        lblEmail.Text = row.IsNull("Email") ? null : row["Email"].ToString();
                        lblAddress.Text = row.IsNull("Address") ? null : row["Address"].ToString();
                        ddlBloodType.SelectedItem.Text = row.IsNull("BloodType") ? null : row["BloodType"].ToString();
                        ddlTypeOfDonation.SelectedItem.Text = row.IsNull("TypeOfDonation") ? null : row["TypeOfDonation"].ToString();
                        txtTypeOfDisease.Text = row.IsNull("TypeOfDisease") ? null : row["TypeOfDisease"].ToString();
                        lblProfilePhoto.Text = row.IsNull("ProfilePhoto") ? null : row["ProfilePhoto"].ToString();
                        txtRequiredAmount.Text = row.IsNull("RequiredAmount") ? null : row["RequiredAmount"].ToString(); ;
                        txtStatus.Text = row.IsNull("Status") ? null : row["Status"].ToString();
                        txtStartDate.Text = row.IsNull("StartDate") ? null : row["StartDate"].ToString(); ;
                        txtEndDate.Text = row.IsNull("EndDate") ? null : row["EndDate"].ToString(); ;
                        txtDescription.Text = row.IsNull("Description") ? null : row["Description"].ToString();
                        lblMainReport.Text = row.IsNull("MainReport") ? null : row["MainReport"].ToString();
                        txtFundCollected.Text = row.IsNull("FundCollected") ? null : row["FundCollected"].ToString(); ;
                        txtAadharCard.Text = row.IsNull("AadharCard") ? null : row["AadharCard"].ToString();
                        lblAadharCardDocument.Text = row.IsNull("AadharCardDocument") ? null : row["AadharCardDocument"].ToString();
                        txtPANNumber.Text = row.IsNull("PANNumber") ? null : row["PANNumber"].ToString();
                        lblPANNumberPhoto.Text = row.IsNull("PANNumberPhoto") ? null : row["PANNumberPhoto"].ToString();
                        txtAnnualSalary.Text = row.IsNull("AnnualSalary") ? null : row["AnnualSalary"].ToString(); ;
                    }
                }
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdRequestDetails.EditIndex = e.NewEditIndex;
            string ID = grdRequestDetails.DataKeys[e.NewEditIndex].Values[0].ToString();

            BindValuesPanel(Convert.ToInt32(ID));

            // Show the update panel
            pnlRequestDetails.Visible = true;
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdRequestDetails.EditIndex = -1;
            BindListView();

            // Hide the update panel
            pnlRequestDetails.Visible = false;
        }

      
        
        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE tbl_FundraiserRegistration SET BloodType = @BloodType, TypeOfDonation = @TypeOfDonation, TypeOfDisease = @TypeOfDisease, ProfilePhoto = @ProfilePhoto, RequiredAmount = @RequiredAmount, Status = @Status, StartDate = @StartDate, EndDate = @EndDate, Description = @Description, MainReport = @MainReport, FundCollected = @FundCollected, AadharCard = @AadharCard, AadharCardDocument = @AadharCardDocument, PANNumber = @PANNumber, PANNumberPhoto = @PANNumberPhoto, AnnualSalary = @AnnualSalary WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@BloodType", ddlBloodType.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@TypeOfDonation", ddlTypeOfDonation.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@TypeOfDisease", txtTypeOfDisease.Text);
                // cmd.Parameters.AddWithValue("@FundraiserDetails", txtFundraiserDetails.Text);
                cmd.Parameters.AddWithValue("@ProfilePhoto", lblProfilePhoto.Text);
                cmd.Parameters.AddWithValue("@RequiredAmount", txtRequiredAmount.Text);
                cmd.Parameters.AddWithValue("@Status", txtStatus.Text);
                cmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
                cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@MainReport", lblMainReport.Text);
                cmd.Parameters.AddWithValue("@FundCollected", txtFundCollected.Text);
                cmd.Parameters.AddWithValue("@AadharCard", txtAadharCard.Text);
                cmd.Parameters.AddWithValue("@AadharCardDocument", lblAadharCardDocument.Text);
                cmd.Parameters.AddWithValue("@PANNumber", txtPANNumber.Text);
                cmd.Parameters.AddWithValue("@PANNumberPhoto", lblPANNumberPhoto.Text);
                cmd.Parameters.AddWithValue("@AnnualSalary", txtAnnualSalary.Text);
                cmd.Parameters.AddWithValue("@Id", hdnId.Value);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Details updated successfully.')", true);
            }
            BindListView();

            // Hide the update panel
            pnlRequestDetails.Visible = false;
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            pnlRequestDetails.Visible = false;
        }
    }
}