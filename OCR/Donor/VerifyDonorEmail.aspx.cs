using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Donor
{
    public partial class VerifyDonorEmail : System.Web.UI.Page
    {
            string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

            protected void btnVerify_Click(object sender, EventArgs e)
            {
                if (string.IsNullOrWhiteSpace(txtOTP.Text))
                {
                    lblMessage.Text = "❌ Please enter OTP.";
                    return;
                }

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    SqlCommand cmd = new SqlCommand(@"UPDATE tbl_DonorRegistration SET EmailVerified = 1,EmailVerifyToken = NULL,EmailVerifyExpiry = NULL WHERE Email = @Email AND EmailVerifyToken = @OTP AND EmailVerifyExpiry > GETDATE() AND EmailVerified = 0", con);

                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@OTP", txtOTP.Text.Trim());

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rows > 0)
                    {
                    ClientScript.RegisterStartupScript(Page.GetType(),"success","alert('Email verified successfully. You can now login.'); window.location='DonorLogin.aspx';",true);
                    }
                    else
                    {
                        lblMessage.Text = "❌ Invalid or expired OTP.";
                    }
                }
            }

        private void SendOtpMail(string email, string otp)
        {
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "ankit21104@gmail.com";
            string smtpPassword = "wwaw auka plgc fvwg";

            SmtpClient smtp = new SmtpClient(smtpServer)
            {
                Port = smtpPort,
                Credentials = new NetworkCredential(smtpUsername, smtpPassword),
                EnableSsl = true
            };

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(email);
            mail.Subject = "Email Verification OTP";
            mail.Body = "<p>Your new OTP is:</p><h2>" + otp + "</h2><p>Valid for 10 minutes.</p>";
            mail.IsBodyHtml = true;

            smtp.Send(mail);
        }

        protected void btnResendOtp_Click(object sender, EventArgs e)
        {

           
                if (string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                    lblMessage.Text = "❌ Please enter your registered email.";
                    return;
                }

                string newOtp = new Random().Next(100000, 999999).ToString();
                DateTime newExpiry = DateTime.Now.AddMinutes(10);

                using (SqlConnection con = new SqlConnection(conStr))
                {
                    SqlCommand cmd = new SqlCommand(@"UPDATE tbl_DonorRegistration SET EmailVerifyToken = @OTP,EmailVerifyExpiry = @Expiry WHERE Email = @Email AND EmailVerified = 0", con);

                    cmd.Parameters.AddWithValue("@OTP", newOtp);
                    cmd.Parameters.AddWithValue("@Expiry", newExpiry);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());

                    con.Open();
                    int rows = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rows > 0)
                    {
                        SendOtpMail(txtEmail.Text.Trim(), newOtp);
                        lblMessage.Text = "✅ New OTP sent to your email.";
                    }
                    else
                    {
                        lblMessage.Text = "❌ Email not found or already verified.";
                    }
                }
            
        }
    }
}