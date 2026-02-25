<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyNgoEmail.aspx.cs" Inherits="OCR.NGO.VerifyNgoEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
 <style>
     .otp-box {
         max-width: 420px;
         margin: 120px auto;
         padding: 30px;
         background: #ffffff;
         box-shadow: 0 4px 15px rgba(0,0,0,0.15);
         border-radius: 6px;
         text-align: center;
     }

         .otp-box h2 {
             margin-bottom: 20px;
         }

     .otp-input {
         width: 100%;
         padding: 10px;
         font-size: 18px;
         text-align: center;
         letter-spacing: 4px;
     }

     .otp-btn {
         margin-top: 20px;
         padding: 10px 20px;
         font-size: 16px;
     }

     .msg {
         margin-top: 15px;
         font-weight: bold;
     }
 </style>
<div class="otp-box">
     <h2>Email Verification</h2>

     <p>Please enter your email and  OTP sent to your email.</p>
     <asp:TextBox
         ID="txtEmail"
         runat="server"
         Placeholder="Enter registered email">
     </asp:TextBox>

     <asp:TextBox
         ID="txtOTP"
         runat="server"
         CssClass="otp-input"
         MaxLength="6"
         Placeholder="Enter OTP">
     </asp:TextBox>

     <asp:Button
         ID="btnVerify"
         runat="server"
         Text="Verify Email"
         CssClass="otp-btn"
         OnClick="btnVerify_Click" />
     <br />
     <br />
     <asp:Button ID="btnResendOtp" runat="server" Text="Resend OTP" OnClick="btnResendOtp_Click" />

     <asp:Label
         ID="lblMessage"
         runat="server"
         CssClass="msg">
     </asp:Label>
 </div>
    </form>
</body>
</html>
