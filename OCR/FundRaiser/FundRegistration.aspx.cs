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

namespace OCR.FundRaiser
{
    public partial class FundRegistration : System.Web.UI.Page
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
           try
            {
                StringBuilder sbSubject = new StringBuilder();
                StringBuilder sbBody = new StringBuilder();
                bool folderExists = Directory.Exists(Server.MapPath(@"~\FundImages\"));
                string filename = Path.GetFileName(fpuFundRaiser.PostedFile.FileName);
                if (!folderExists)
                {

                    Directory.CreateDirectory(Server.MapPath(@"~\FundImages\"));
                }
                if (fpuFundRaiser.HasFile)
                {
                    fpuFundRaiser.SaveAs(Server.MapPath(@"~\FundImages\" + filename));
                }


                fpuFundRaiser.PostedFile.SaveAs(Server.MapPath(@"~\FundImages\" + filename));

                con = new SqlConnection(conStr);
                con.Open();
                SqlCommand cmd = new SqlCommand("select distinct username from tbl_FundraiserRegistration where UserName =@UserName", con);
                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User Name is unavailable, please enter some other user name.')", true);
                    return;
                }
                else
                {
                    
                    con = new SqlConnection(conStr);
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into tbl_FundraiserRegistration ([Name],[UserName],[City],[State],[PinCode],[PhoneNumber],[Email],[Address],[Password],[AddDate],[ProfilePhoto])VALUES(@Name,@UserName,@City,@state,@PinCode,@PhoneNumber,@Email,@Address,@Password,@AddDate,@ProfilePhoto)", con);
                    
                    cmd2.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd2.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
                    cmd2.Parameters.AddWithValue("@City", drpCity.SelectedItem.Text.Trim());
                    cmd2.Parameters.AddWithValue("@State", drpState.SelectedItem.Text.Trim());
                    cmd2.Parameters.AddWithValue("@PinCode", txtPincode.Text.Trim());
                    cmd2.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
                    cmd2.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd2.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd2.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd2.Parameters.AddWithValue("@AddDate", DateTime.Now);
                    cmd2.Parameters.AddWithValue("ProfilePhoto",filename);
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    sbBody.Append("<table cellpadding='0' cellspacing='0' border='0' id='backgroundTable' style='height:auto !important; margin:0; padding:0; width:100% !important; background-color:#FFFFFF;color:#222222;'><tr><td>");
                    sbBody.Append("<div id='tablewrap' style='width:100% !important; max-width:600px !important; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important;'>");
                    sbBody.Append("<table id='contenttable' width='600' align='center' cellpadding='0' cellspacing='0' border='0' style='background-color:#FFFFFF; text-align:center !important; margin-top:0 !important; margin-right: auto !important; margin-bottom:0 !important; margin-left: auto !important; border:none; width: 100% !important; max-width:600px !important;'>");
                    sbBody.Append("<tr><td width='100%'><table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='0' width='100%'><tr>");
                    sbBody.Append("<td width='100%' bgcolor='#ffffff' style='text-align:center;'></td></tr></table>");
                    sbBody.Append("<table bgcolor='#FFFFFF' border='0' cellspacing='0' cellpadding='25' width='100%'><tr><td width='100%' bgcolor='#ffffff' style='text-align:left;'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'> Dear ");
                    sbBody.Append(txtName.Text.Trim());
                    sbBody.Append("</p><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'>You have been successfully added as a <b>NGO</b> in Our <b>Helping Hands, Helping Smiles</b> system!</p>");
                    sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'>");
                    sbBody.Append("<p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0;padding:0; font-weight:normal;'> We work to achieve our mission by helping people of , including NGO's as and Indivisual FundRaisers. We are so excited to have you on our team!</p></tr>");
                    sbBody.Append("<table border='0' cellspacing='0' cellpadding='0' width='100%' class='emailwrapto100pc'><tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Thanks & Regards,</b>");
                    sbBody.Append("</p></td></tr>");
                    sbBody.Append("<tr><td class='emailcolsplit' align='left' valign='top' width='75%'><p style='color:#222222; font-family:Arial, Helvetica, sans-serif; font-size:15px; line-height:19px; margin-top:0; margin-bottom:20px; padding:0; font-weight:normal;'><b>Team Helping Hands, Helping Smiles.</b>");
                    sbBody.Append("</p></td></tr>");
                    sbBody.Append("</table></td></tr></table>");
                    SendMail("Fund Raiser Registration Success", sbBody.ToString());
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You have been Registered Succesfully.Login to continue..');window.location='FundRaiserLogin.aspx'", true);

                }

            }
            catch(Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Registration UnSuccesfully.Please try again after sometime..');window.location='../Home/Home.aspx'", true);

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
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "<script>alert('Registration has been Successfully,Please login to continue');if(alert){ window.location='DonorLogin.aspx';}</script>", true);
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
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "<script>alert('Sending Failed...');if(alert){ window.location='SendMail.aspx';}</script>", true);
            }
        }
        protected void BindState()
        {
            con = new SqlConnection(conStr);
            con.Open();
            cmd = new SqlCommand("sp_GetState", con);
            cmd.CommandType = CommandType.StoredProcedure;
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