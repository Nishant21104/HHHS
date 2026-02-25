<%@ Page Title="" Language="C#" MasterPageFile="~/FundRaiser/FundRaiser.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OCR.FundRaiser.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />

    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            
        }

        .card {
            width: 380px;
            height: 410px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #222222;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            text-align: left;
            margin-bottom: 5px;
        }

        input {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .button {
            height: 100%;
            width: 100%;
            border-radius: 5px;
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #f85a40;
            height: 45px;
            margin: 35px 0
        }


        .switch {
            margin-top: 15px;
            font-size: 14px;
        }

            .switch a {
                color: #007BFF;
                text-decoration: none;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container" style="margin-bottom: 50px; margin-top: 50px;">
        <div class="card">
            <label for="username">Username</label>
            <asp:TextBox ID="TextBox_user_name" runat="server" ></asp:TextBox>
          <label for="password">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ></asp:TextBox><br />
            <asp:Button ID="btn_login" runat="server" Text="Change Password" CssClass="button" OnClick="btn_login_Click" /><br />
            <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </div>
    </div>
</asp:Content>