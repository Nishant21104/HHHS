using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;

namespace OCR.NGO
{
    public partial class NGORegistration : System.Web.UI.Page
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
                BindState();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //try
            // {
            //     StringBuilder sbSubject = new StringBuilder();
            //     StringBuilder sbBody = new StringBuilder();
            //     string filename = fpuCopyofobjectives.PostedFile.FileName;

            //     if (fpuCopyofobjectives.HasFile)
            //     {
            //         fpuCopyofobjectives.PostedFile.SaveAs(Server.MapPath(@"~\NgoFiles\CopyOfObjective\" + filename));
            //         //fpuCopyofobjectives.SaveAs(Server.MapPath(@"~\NgoFiles\CopyOfObjective\" + filename));
            //     }

            //     fpuCopyofobjectives.PostedFile.SaveAs(Server.MapPath(@"~\NgoFiles\CopyOfObjective\" + filename));

            //     string POIfilename = Path.GetFileName(fpuProofOfIdentification.PostedFile.FileName);

            //     if (fpuCopyofobjectives.HasFile)
            //     {
            //         fpuCopyofobjectives.SaveAs(Server.MapPath(@"~\NgoFiles\POI\" + POIfilename));
            //     }

            //     fpuCopyofobjectives.PostedFile.SaveAs(Server.MapPath(@"~\NgoFiles\POI\" + POIfilename));

            //     con = new SqlConnection(conStr);
            //     con.Open();
            //     SqlCommand cmd = new SqlCommand("select distinct username from tbl_NGORegistration where UserName =@username", con);
            //     cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            //     SqlDataAdapter da = new SqlDataAdapter(cmd);
            //     DataTable dt = new DataTable();
            //     da.Fill(dt);
            //     if (dt.Rows.Count > 0)
            //     {
            //         ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User Name is unavailable, please enter some other user name.')", true);

            //         //lblErrorMessage.Text = "User Name is unavailable, please enter some other user name";
            //         return;
            //     }
            //     else
            //     {
            //         con = new SqlConnection(conStr);
            //         con.Open();
            //         SqlCommand cmd1 = new SqlCommand("sp_NGORegistration", con);
            //         cmd1.CommandType = CommandType.StoredProcedure;
            //         //cmd1.CommandText = "Execute sp_NGORegistration @Name,@UserName,@City,@State,@PinCode,@PhoneNumber,@Email,@Address,@Password,@Action";
            //         cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@City", drpCity.SelectedItem.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@State", drpState.SelectedItem.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@PinCode", txtPincode.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            //         cmd1.Parameters.AddWithValue("@NameOfHeadOrganization", txtHeadOrganization.Text.Trim());
            //         cmd1.Parameters.AddWithValue("@Proofofidentication", POIfilename);
            //         cmd1.Parameters.AddWithValue("@Copyofobjectives",filename);
            //         cmd1.Parameters.AddWithValue("@UniqueRegId", txtUniqueRegId.Text.Trim());

            //         cmd1.Parameters.AddWithValue("@Action", "Insert");
            //         cmd1.ExecuteNonQuery();
            //         con.Close();
            //         sbBody.Append("<table cellpadding='0' cellspacing='0' border='0' id='backgroundTable' style='height:auto !important; margin:0; padding:0; width:100% !important; background-color:#FFFFFF;color:#222222;'><tr><td>");
            //         sbBody.Append("<div id='tablewrap' style='width:100% !important; max-width:600px !important; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important;'>");
            //         sbBody.Append("<table id='contenttable' width='600' align='center' cellpadding='0' cellspacing='0' border='0' style='background-color:#FFFFFF; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important; border:none; width: 100% !important; max-width:600px !important;'>");
            //         sbBody.Append("<tr><td width='100%'><table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='0' width='100%'><tr>");
            //         sbBody.Append("<td width='100%' bgcolor='#ffffff' style='text-align:center;'></td></tr></table>");
            //         sbBody.Append("<table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='25' width='100%'><tr><td width='100%' bgcolor='#ffffff' style='text-align:left;'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'> Dear ");
            //         sbBody.Append(txtName.Text.Trim());
            //         sbBody.Append("</p><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'>You have been successfully added as a <b>NGO</b> in Our <b>Helping Hands, Helping Smiles</b> system!</p>");
            //         sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'>");
            //         sbBody.Append("<p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0;padding:0; font-weight:normal;'> We work to achieve our mission by helping people of , including NGO's as and Indivisual FundRaisers. We are so excited to have you on our team!</p></tr>");
            //         sbBody.Append("<table border='0' cellspacing='0' cellpadding='0' width='100%' class='emailwrapto100pc'><tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Thanks & Regards,</b>");
            //         sbBody.Append("</p></td></tr>");
            //         sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Team Helping Hands, Helping Smiles.</b>");
            //         sbBody.Append("</p></td></tr>");
            //         sbBody.Append("</table></td></tr></table>");
            //         SendMail("NGO Registration Success", sbBody.ToString());
            //         //ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Go back and Login to continue.')", true);
            //         ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Go back and Login to continue.');window.location='NGOLogin.aspx'", true);
            //     }

            // }
            // catch(Exception ex)
            // {
            //     ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registration UnSuccesfully.Please try again after sometime..');window.location='../Home/Home.aspx'", true);

            // }
            try
            {
                Random rnd = new Random();
                string emailOTP = rnd.Next(100000, 999999).ToString();
                DateTime otpExpiry = DateTime.Now.AddMinutes(10);
                StringBuilder sbSubject = new StringBuilder();
                StringBuilder sbBody = new StringBuilder();
                // 🔒 Validate uploads
                if (!IsValidJpg(fpuCopyofobjectives))
                {
                    ClientScript.RegisterStartupScript(
                        Page.GetType(), "alert",
                        "alert('Copy of Objectives must be a JPG image');", true);
                    return;
                }

                if (!IsValidJpg(fpuProofOfIdentification))
                {
                    ClientScript.RegisterStartupScript(
                        Page.GetType(), "alert",
                        "alert('Proof of Identification must be a JPG image');", true);
                    return;
                }

                // 🔹 Filenames
                string filename = Guid.NewGuid() + ".jpg";
                string POIfilename = Guid.NewGuid() + ".jpg";

                // 🔹 Folders
                string objFolder = Server.MapPath("~/NgoFiles/CopyOfObjective/");
                string poiFolder = Server.MapPath("~/NgoFiles/POI/");

                if (!Directory.Exists(objFolder)) Directory.CreateDirectory(objFolder);
                if (!Directory.Exists(poiFolder)) Directory.CreateDirectory(poiFolder);

                fpuCopyofobjectives.SaveAs(Path.Combine(objFolder, filename));
                fpuProofOfIdentification.SaveAs(Path.Combine(poiFolder, POIfilename));

                // 🔹 Username check
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(
                        "SELECT COUNT(*) FROM tbl_NGORegistration WHERE UserName=@username", con);
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());

                    if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
                    {
                        ClientScript.RegisterStartupScript(
                            Page.GetType(), "alert",
                            "alert('User Name is unavailable.');", true);
                        return;
                    }
                }

                // 🔹 Insert
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("sp_NGORegistration", con);
                    cmd1.CommandType = CommandType.StoredProcedure;

                    cmd1.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd1.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd1.Parameters.AddWithValue("@City", drpCity.SelectedItem.Text.Trim());
                    cmd1.Parameters.AddWithValue("@State", drpState.SelectedItem.Text.Trim());
                    cmd1.Parameters.AddWithValue("@PinCode", txtPincode.Text.Trim());
                    cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd1.Parameters.AddWithValue("@NameOfHeadOrganization", txtHeadOrganization.Text.Trim());
                    cmd1.Parameters.AddWithValue("@Proofofidentication", POIfilename);
                    cmd1.Parameters.AddWithValue("@Copyofobjectives", filename);
                    cmd1.Parameters.AddWithValue("@UniqueRegId", txtUniqueRegId.Text.Trim());
                    cmd1.Parameters.AddWithValue("@EmailOTP", emailOTP);
                    cmd1.Parameters.AddWithValue("@EmailOTPExpiry", otpExpiry);
                    cmd1.Parameters.AddWithValue("@Action", "Insert");
                  
                    cmd1.ExecuteNonQuery();

                    sbBody.Append("<table cellpadding='0' cellspacing='0' border='0' id='backgroundTable' style='height:auto !important; margin:0; padding:0; width:100% !important; background-color:#FFFFFF;color:#222222;'><tr><td>");
                    sbBody.Append("<div id='tablewrap' style='width:100% !important; max-width:600px !important; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important;'>");
                    sbBody.Append("<table id='contenttable' width='600' align='center' cellpadding='0' cellspacing='0' border='0' style='background-color:#FFFFFF; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important; border:none; width: 100% !important; max-width:600px !important;'>");
                    sbBody.Append("<tr><td width='100%'><table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='0' width='100%'><tr>");
                    sbBody.Append("<td width='100%' bgcolor='#ffffff' style='text-align:center;'></td></tr></table>");
                    sbBody.Append("<table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='25' width='100%'><tr><td width='100%' bgcolor='#ffffff' style='text-align:left;'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'> Dear ");
                    sbBody.Append(txtName.Text.Trim());
                    sbBody.Append("</p><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'>You have been successfully added as a <b>NGO</b> in Our <b>Helping Hands, Helping Smiles</b> system!</p>");
                    sbBody.Append("<p>Your NGO email verification OTP is:</p>");
                    sbBody.Append("<h2 style='letter-spacing:2px;'>" + emailOTP + "</h2>");
                    sbBody.Append("<p>This OTP is valid for 10 minutes.</p>");
                    sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'>");
                    sbBody.Append("<p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0;padding:0; font-weight:normal;'> We work to achieve our mission by helping people of , including NGO's as and Indivisual FundRaisers. We are so excited to have you on our team!</p></tr>");
                    sbBody.Append("<table border='0' cellspacing='0' cellpadding='0' width='100%' class='emailwrapto100pc'><tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Thanks & Regards,</b>");
                    sbBody.Append("</p></td></tr>");
                    sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Team Helping Hands, Helping Smiles.</b>");
                    sbBody.Append("</p></td></tr>");
                    sbBody.Append("</table></td></tr></table>");
                    //SendMail("NGO Registration Success", sbBody.ToString());

                    //ClientScript.RegisterStartupScript(
                    //    Page.GetType(), "alert",
                    //    "alert('Registered successfully');window.location='NGOLogin.aspx';", true);

                    SendMail("Email Verification OTP", sbBody.ToString());

                    ClientScript.RegisterStartupScript(
                        Page.GetType(),
                        "redirect",
                        "alert('An OTP has been sent to your email. Please verify to continue.'); window.location='VerifyNgoEmail.aspx';",
                        true
                    );
                    con.Close();
                }
            }
            catch (Exception)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Something went wrong please try again later.');window.location='Home.aspx';", true);

            }

        }
        public void SendMail(string Subject, string Body)
        {
            string smtpServer = "smtp.gmail.com"; // Replace with your SMTP server
            int smtpPort = 587; // Replace with your SMTP port
            string smtpUsername = "ankit21104@gmail.com"; // Replace with your email
            string smtpPassword = "wwaw auka plgc fvwg";  // Replace with your password
            SmtpClient smtpClient = new SmtpClient(smtpServer)
            {
                Port = smtpPort,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                EnableSsl = true,
            };
            var mailMessage = new MailMessage
            {
                From = new MailAddress(smtpUsername),
                Subject = Subject,
                Body = Body,
                IsBodyHtml = true,
            };
            mailMessage.To.Add(txtEmail.Text.Trim());
            // Send the email       
            try
            {
                if (smtpClient != null)
                    smtpClient.Send(mailMessage);
                
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
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
            cmd.Parameters.AddWithValue("@FkState",drpState.SelectedValue);
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("NGOLogin.aspx");
        }
        private bool IsValidJpg(FileUpload fu)
        {
            if (!fu.HasFile) return false;

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
    }
}