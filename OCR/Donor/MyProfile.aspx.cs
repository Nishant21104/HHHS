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

namespace OCR.Donor
{
    public partial class My_Profile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DonorUserName"] == null)
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
            cmd = new SqlCommand("sp_DonorRegistration", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "FETCHDATA");
            cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            txtName.Text = dt.Rows[0]["Name"] != null ? dt.Rows[0]["Name"].ToString() : string.Empty;
            txtAboutyou.Value = dt.Rows[0]["DonorDetails"] != null ? dt.Rows[0]["DonorDetails"].ToString() : string.Empty;
            txtAddress.Value = dt.Rows[0]["Address"] != null ? dt.Rows[0]["Address"].ToString() : string.Empty;
            txtPhoneNumber.Value = dt.Rows[0]["PhoneNumber"] != null ? dt.Rows[0]["PhoneNumber"].ToString() : string.Empty;
            txtEmail.Value = dt.Rows[0]["Email"] != null ? dt.Rows[0]["Email"].ToString() : string.Empty;
            ddlBloodType.SelectedValue = dt.Rows[0]["BloodType"] != null ? dt.Rows[0]["BloodType"].ToString() : string.Empty;
            ddlTypeOfDonation.SelectedValue = dt.Rows[0]["TypeOfDonation"] != null ? dt.Rows[0]["TypeOfDonation"].ToString() : string.Empty;
            string photoPath = Convert.ToString(dt.Rows[0]["ProfilePhoto"]);

            if (!string.IsNullOrWhiteSpace(photoPath))
            {
                imgPic.ImageUrl = ResolveUrl("~/" + photoPath.Trim());
            }
            else
            {
                imgPic.ImageUrl = ResolveUrl("~/DonorFiles/default.jpg");
            }
            imgPic.Visible = true;

            //commented on 22-12-25 to disolay photo
            //imgPic.ImageUrl = dt.Rows[0]["ProfilePhoto"] != null ? dt.Rows[0]["ProfilePhoto"].ToString() : string.Empty;
            imgPic.Style.Add("border-radius", "50%");
            imgPic.Style.Add("width", "300px");
            imgPic.Style.Add("height", "300px");
            imgPic.Style.Add("object-fit", "cover");
            imgPic.Style.Add("object-position", "50% 100%");

            txtName.Enabled = false;
            txtAboutyou.Attributes.Add("disabled", "disabled");
            txtAddress.Attributes.Add("disabled", "disabled");
            txtPhoneNumber.Attributes.Add("disabled", "disabled");
            txtEmail.Attributes.Add("disabled", "disabled");
            ddlBloodType.Enabled = false;
            ddlTypeOfDonation.Enabled = false;
            //rdbGender.Enabled = false;
            //commented on 22-12-25 to disolay photo
            //imgPic.Attributes.Add("disabled", "disabled");
            Donorfileupload.Attributes.Add("disabled", "disabled");

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
            if (!IsValidJpg(Donorfileupload))
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
                string folderPath = Server.MapPath(@"~\DonorFiles\");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string filename = null;

                if (Donorfileupload.HasFile)
                {
                    filename = Path.GetFileName(Donorfileupload.FileName);
                    Donorfileupload.SaveAs(folderPath + filename);
                }


                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("sp_DonorRegistration", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                //cmd1.CommandText = "Execute sp_NGORegistration @Name,@UserName,@City,@State,@PinCode,@PhoneNumber,@Email,@Address,@Password,@Action";
                cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Value);
                cmd1.Parameters.AddWithValue("@Address", txtAddress.Value);
                cmd1.Parameters.AddWithValue("@DonorDetails", txtAboutyou.Value);
                cmd1.Parameters.AddWithValue("@BloodType", ddlBloodType.SelectedItem.Text);
                cmd1.Parameters.AddWithValue("@TypeOfDonation", ddlTypeOfDonation.SelectedItem.Text);
                cmd1.Parameters.AddWithValue("@Email", txtEmail.Value);
                //cmd1.Parameters.AddWithValue("@WebSiteUrl", txtwebsite.Value);
                
                
                cmd1.Parameters.AddWithValue("@Action", "UPDATE");
                if (filename != null)
                {
                    cmd1.Parameters.AddWithValue("@ProfilePhoto", "DonorFiles/" + filename);
                }
                if (Session["DonorUserName"] != null)
                {
                    cmd1.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session expired, Please logout and login again.')", true);
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
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Detail updation has been UnSuccesfull.Please try again after sometime..');window.location='DonorHome.aspx';", true);

            }
            IsEditClicked = false;
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

        protected void btnEditDetail_Click(object sender, EventArgs e)
        {
            txtAboutyou.Attributes.Remove("disabled");
            txtAddress.Attributes.Remove("disabled");
            txtPhoneNumber.Attributes.Remove("disabled");
            txtEmail.Attributes.Remove("disabled");
            txtAboutyou.Attributes.Remove("disabled");
            ddlBloodType.Attributes.Remove("disabled");
            
            imgPic.Attributes.Remove("disabled");
            Donorfileupload.Attributes.Remove("disabled");
            

            txtName.Enabled = true;
            txtAboutyou.Attributes.Add("enabled", "enabled");
            txtAboutyou.Attributes.Add("enabled", "enabled");
            txtAddress.Attributes.Add("enabled", "enabled");
            txtPhoneNumber.Attributes.Add("enabled", "enabled");
            txtEmail.Attributes.Add("enabled", "enabled");
            ddlBloodType.Enabled = true;
            ddlTypeOfDonation.Enabled = true;
            //rdbGender.Enabled = true;
            imgPic.Attributes.Add("enabled", "enabled");
            Donorfileupload.Attributes.Add("enabled", "enabled");
            IsEditClicked = true;
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

        //protected void ddlBloodType_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}