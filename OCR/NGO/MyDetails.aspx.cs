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

namespace OCR.NGO
{

    public partial class MyDetails : System.Web.UI.Page
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
                    FetchData();
                }
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_NGORegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "FETCHDATA");
            cmd.Parameters.AddWithValue("@Name", Session["UserName"].ToString());
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            txtName.Text = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : string.Empty;
            txtAboutyou.Value = dt.Rows[0]["AboutYou"] != null ? dt.Rows[0]["AboutYou"].ToString() : string.Empty;
            txtAddress.Value = dt.Rows[0]["Address"] != null ? dt.Rows[0]["Address"].ToString() : string.Empty;
            txtPhoneNumber.Value = dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
            txtEmail.Value = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;
            ddlTypeOfNGO.SelectedItem.Text = dt.Rows[0]["TypeOfNGO"] != null ? dt.Rows[0]["TypeOfNGO"].ToString() : string.Empty;
            txtPurpose.Value = dt.Rows[0]["MainPurpose"] != null ? dt.Rows[0]["MainPurpose"].ToString() : string.Empty;
            txtwebsite.Value = dt.Rows[0]["WebsiteUrl"] != null ? dt.Rows[0]["WebsiteUrl"].ToString() : string.Empty;
            Image1.ImageUrl = @"~\NgoFiles\" + dt.Rows[0]["ProfilePhoto"] != null ? @"~\NgoFiles\" + dt.Rows[0]["ProfilePhoto"].ToString() : string.Empty;

            txtBankName.Value = dt.Rows[0]["BankName"] != null ? dt.Rows[0]["BankName"].ToString() : string.Empty;
            txtBankAccountHolderName.Value = dt.Rows[0]["BankAccountHolderName"] != null ? dt.Rows[0]["BankAccountHolderName"].ToString() : string.Empty;
            txtBranchName.Value = dt.Rows[0]["BranchName"] != null ? dt.Rows[0]["BranchName"].ToString() : string.Empty;
            txtIFSCCode.Value = dt.Rows[0]["IFSCCode"] != null ? dt.Rows[0]["IFSCCode"].ToString() : string.Empty;
            txtAccountNumber.Value = dt.Rows[0]["AccountNumber"] != null ? dt.Rows[0]["AccountNumber"].ToString() : string.Empty;

            Image1.Style.Add("border-radius", "50%");
            Image1.Style.Add("width", "150px");
            Image1.Style.Add("height", "150px");
            Image1.Style.Add("object-fit", "cover");
            Image1.Style.Add("object-position", "50% 100%");

            txtName.Enabled = false;
            txtAboutyou.Attributes.Add("disabled", "disabled");
            txtAddress.Attributes.Add("disabled", "disabled");
            txtPhoneNumber.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            ddlTypeOfNGO.Enabled = false;
            txtPurpose.Attributes.Add("disabled", "disabled");
            txtwebsite.Attributes.Add("disabled", "disabled");
            Image1.Attributes.Add("disabled", "disabled");
            NGOfileupload.Attributes.Add("disabled", "disabled");
            txtBankName.Attributes.Add("disabled", "disabled");
            txtBankAccountHolderName.Attributes.Add("disabled", "disabled");
            txtBranchName.Attributes.Add("disabled", "disabled");
            txtIFSCCode.Attributes.Add("disabled", "disabled");
            txtAccountNumber.Attributes.Add("disabled", "disabled");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!IsEditClicked)
            {
                ClientScript.RegisterStartupScript(
                    Page.GetType(),
                    "alert",
                    "alert('Please click Edit before saving changes.');",
                    true
                );
                return;
            }
            if (!IsValidJpg(NGOfileupload))
            {
                ClientScript.RegisterStartupScript(
                    Page.GetType(),
                    "alert",
                    "alert('Profile photo must be a JPG image only.');",
                    true
                );
                return;
            }

            try
            {
               
                string folderPath = Server.MapPath(@"~\NgoFiles\");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filename = null;
               
                if (NGOfileupload.HasFile)
                {
                    filename = Path.GetFileName(NGOfileupload.FileName);
                    NGOfileupload.SaveAs(folderPath + filename);
                }

                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("sp_NGORegistration", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                //cmd1.CommandText = "Execute sp_NGORegistration @Name,@UserName,@City,@State,@PinCode,@PhoneNumber,@Email,@Address,@Password,@Action";
                cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Value);
                cmd1.Parameters.AddWithValue("@Address", txtAddress.Value);
                cmd1.Parameters.AddWithValue("@AboutYou", txtAboutyou.Value);
                cmd1.Parameters.AddWithValue("@TypeOfNGO", ddlTypeOfNGO.SelectedItem.Text);
                cmd1.Parameters.AddWithValue("@MainPurpose", txtPurpose.Value);
                cmd1.Parameters.AddWithValue("@Email", txtEmail.Value);
                cmd1.Parameters.AddWithValue("@WebSiteUrl", txtwebsite.Value);
                cmd1.Parameters.AddWithValue("@BankName", txtBankName.Value);
                cmd1.Parameters.AddWithValue("@BankAccountHolderName", txtBankAccountHolderName.Value);
                cmd1.Parameters.AddWithValue("@BranchName", txtBranchName.Value);
                cmd1.Parameters.AddWithValue("@AccountNumber", txtAccountNumber.Value);
                cmd1.Parameters.AddWithValue("@IFSCCode", txtIFSCCode.Value);
                cmd1.Parameters.AddWithValue("@Action", "UPDATE");

                if (filename != null)
                {
                    cmd1.Parameters.AddWithValue("@ProfilePhoto", filename);
                }
                Session.Add("Updated", "Y");
                cmd1.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Details have been updated Succesfully.')", true);
                FetchData();
                IsEditClicked = false;
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Detail have not been Succesfull. Please try again after sometime..');window.location='NGOHome.aspx';", true);

            }
            IsEditClicked = false;
        }

        protected void btnEditDetails_Click(object sender, EventArgs e)
        {

            txtAboutyou.Attributes.Remove("disabled");
            txtAddress.Attributes.Remove("disabled");
            txtPhoneNumber.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            txtPurpose.Attributes.Remove("disabled");
            txtwebsite.Attributes.Remove("disabled");
            Image1.Attributes.Remove("disabled");
            NGOfileupload.Attributes.Remove("disabled");
            txtBankName.Attributes.Remove("disabled");
            txtBankAccountHolderName.Attributes.Remove("disabled");
            txtBranchName.Attributes.Remove("disabled");
            txtIFSCCode.Attributes.Remove("disabled");
            txtAccountNumber.Attributes.Remove("disabled");

            txtName.Enabled = true;
            ddlTypeOfNGO.Enabled = true;
            txtAboutyou.Attributes.Add("enabled", "enabled");
            txtAddress.Attributes.Add("enabled", "enabled");
            txtPhoneNumber.Attributes.Add("enabled", "enabled");
            txtEmail.Attributes.Add("enabled", "enabled");
            txtPurpose.Attributes.Add("enabled", "enabled");
            txtwebsite.Attributes.Add("enabled", "enabled");
            Image1.Attributes.Add("enabled", "enabled");
            NGOfileupload.Attributes.Add("enabled", "enabled");
            txtBankName.Attributes.Add("enabled", "enabled");
            txtBankAccountHolderName.Attributes.Add("enabled", "enabled");
            txtBranchName.Attributes.Add("enabled", "enabled");
            txtIFSCCode.Attributes.Add("enabled", "enabled");
            txtAccountNumber.Attributes.Add("enabled", "enabled");
            IsEditClicked = true;
        }
        private bool IsValidJpg(FileUpload fu)
        {
            if (!fu.HasFile) return true; // allow update without changing photo

            string ext = Path.GetExtension(fu.FileName).ToLower();
            if (ext != ".jpg" && ext != ".jpeg") return false;

            if (fu.PostedFile.ContentType != "image/jpeg") return false;

            try
            {
                using (System.Drawing.Image img =
                       System.Drawing.Image.FromStream(fu.PostedFile.InputStream))
                {
                    fu.PostedFile.InputStream.Position = 0;
                }
            }
            catch
            {
                return false;
            }

            return true;
        }
        private bool IsEditClicked
        {
            get
            {
                return ViewState["IsEditClicked"] != null && (bool)ViewState["IsEditClicked"];
            }
            set
            {
                ViewState["IsEditClicked"] = value;
            }
        }

    }
}