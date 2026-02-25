<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OCR.Donor.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Forgot Password</h2>

        <label>Registered Email</label><br />
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
        <br />

        <asp:Button ID="btnSendOtp" runat="server"
            Text="Send OTP"
            OnClick="btnSendOtp_Click" />

        <br />
        <br />
        <asp:Label ID="lb1" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
