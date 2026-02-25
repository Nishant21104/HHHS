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

namespace OCR.Admin
{
    public partial class AddFundraiser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindState();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    con = new SqlConnection(conStr);
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select distinct username from tbl_FundraiserRegistration where UserName =@username", con);
            //    cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    da.Fill(dt);
            //    if (dt.Rows.Count > 0)
            //    {
            //        lblErrorMessage.Text = "User Name is unavailable, please enter some other user name";
            //        return;
            //    }
            //    else
            //    {
            //        con = new SqlConnection(conStr);
            //        con.Open();
            //        SqlCommand cmd1 = new SqlCommand("insert into tbl_FundraiserRegistration(Name,UserName,City,State,Title,PhoneNumber,Email,Banner,Description,AddDate,Amount,StartDate,EndDate,Status) VALUES (@Name,@UserName,@City,@State,@Title,@PhoneNumber,@Email,@Banner,@Description,@AddDate,@Amount,@StartDate,@EndDate,@Status)", con);
            //        cmd1.CommandType = CommandType.Text;
            //        //cmd1.CommandText = "Execute sp_NGORegistration @Name,@UserName,@City,@State,@PinCode,@PhoneNumber,@Email,@Address,@Password,@Action";
            //        cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@City", drpCity.SelectedItem.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@State", drpState.SelectedItem.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@Title", txtTitle.Text);
            //        cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@Banner", Bannerfileupload.PostedFiles);
            //        cmd1.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
            //        cmd1.Parameters.AddWithValue("@Amount", txtAmount.Text);
            //        cmd1.Parameters.AddWithValue("@StartDate", txtStartDate.Text);
            //        cmd1.Parameters.AddWithValue("@EndDate", txtEndDate.Text);
            //        cmd1.Parameters.AddWithValue("@Status", txtStatus.Text);
            //        cmd1.Parameters.AddWithValue("@AddDate", DateTime.Now);
            //        cmd1.ExecuteNonQuery();
            //        con.Close();
            //        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Fundraiser has been added Succesfully.');", true);

            //    }

            //}
            //catch (Exception ex)
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registration UnSuccesfully.Please try again after sometime..');window.location='DashBoard.aspx';", true);

            //}

            try
            {
                if (!Bannerfileupload.HasFile)
                {
                    lblErrorMessage.Text = "Please upload a banner image.";
                    return;
                }

                string extension = Path.GetExtension(Bannerfileupload.FileName).ToLower();
                if (extension != ".jpg" && extension != ".jpeg")
                {
                    lblErrorMessage.Text = "Only JPG images are allowed.";
                    return;
                }

                if (Bannerfileupload.PostedFile.ContentType != "image/jpeg")
                {
                    lblErrorMessage.Text = "Invalid image format.";
                    return;
                }

                // Verify actual image
                try
                {
                    using (System.Drawing.Image img =
                        System.Drawing.Image.FromStream(Bannerfileupload.PostedFile.InputStream))
                    {
                        Bannerfileupload.PostedFile.InputStream.Position = 0;
                    }
                }
                catch
                {
                    lblErrorMessage.Text = "Uploaded file is not a valid JPG image.";
                    return;
                }

                // Folder handling
                string folderPath = Server.MapPath("~/FundraiserBanners/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // Save image ONCE
                string bannerFileName = Guid.NewGuid().ToString() + ".jpg";
                string savePath = Path.Combine(folderPath, bannerFileName);
                Bannerfileupload.SaveAs(savePath);

                // Insert data
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand(
                    @"INSERT INTO tbl_FundraiserRegistration
          (Name,UserName,City,State,PhoneNumber,Email,ProfilePhoto,Description,
           AddDate,RequiredAmount,StartDate,EndDate,Status,Password)
          VALUES
          (@Name,@UserName,@City,@State,@PhoneNumber,@Email,@ProfilePhoto,
           @Description,@AddDate,@RequiredAmount,@StartDate,@EndDate,@Status,@Password)", con);

                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@City", drpCity.SelectedItem.Text.Trim());
                    cmd.Parameters.AddWithValue("@State", drpState.SelectedItem.Text.Trim());
                    //cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@ProfilePhoto", bannerFileName);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@RequiredAmount", txtAmount.Text.Trim());
                    cmd.Parameters.AddWithValue("@StartDate", txtStartDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@EndDate", txtEndDate.Text.Trim());
                    cmd.Parameters.AddWithValue("@Status", txtStatus.Text.Trim());
                    cmd.Parameters.AddWithValue("@AddDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@Password", "123456");

                    cmd.ExecuteNonQuery();
                }

                ClientScript.RegisterStartupScript(
                    Page.GetType(),
                    "alert",
                    "alert('Fundraiser added successfully.');window.location='DashBoard.aspx';",
                    true);
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registration UnSuccesfully.Please try again after sometime..');window.location='DashBoard.aspx';", true);

            }
        }

        protected void BindState()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_GetState", con);
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@fname", drpState.SelectedValue);
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            drpState.DataTextField = "State";
            drpState.DataValueField = "ID";
            drpState.DataSource = dt;
            drpState.DataBind();

            drpState.Items.Insert(0, "Select State");
            cmd.Dispose();
            con.Close();
        }
        protected void BindCity()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_GetCity", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@FkState", Convert.ToInt32(drpState.SelectedValue));
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            drpCity.DataTextField = "City";
            drpCity.DataValueField = "ID";
            drpCity.DataSource = dt;
            drpCity.DataBind();
            drpCity.Items.Insert(0, "Select City");
            cmd.Dispose();
            con.Close();
        }

        protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindCity();
        }
    }
}