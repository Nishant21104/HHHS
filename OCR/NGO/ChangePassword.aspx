<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OCR.NGO.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .card {
            width: 100%;
            max-width: 440px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 45px 40px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: slideUp 0.5s ease-out;
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .card-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.3);
        }
        
        .card-icon i {
            font-size: 32px;
            color: #fff;
        }
        
        h2 {
            color: #2d3748;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }
        
        form {
            display: flex;
            flex-direction: column;
        }
        
        label {
            text-align: left;
            margin-bottom: 8px;
            color: #4a5568;
            font-weight: 500;
            font-size: 14px;
        }
        
        .input-wrapper {
            position: relative;
            margin-bottom: 20px;
        }
        
        .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #a0aec0;
            font-size: 16px;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background: #fff;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .button {
            width: 100%;
            padding: 14px;
            border-radius: 10px;
            border: none;
            color: #fff;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }
        
        .button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.5);
        }
        
        .button:active {
            transform: translateY(0);
        }
        
        .message-label {
            margin-top: 15px;
            padding: 12px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            background: #fee;
            border: 1px solid #fcc;
            animation: fadeIn 0.3s ease;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        .divider {
            margin: 25px 0;
            height: 1px;
            background: #e2e8f0;
        }
        
        .security-note {
            margin-top: 20px;
            padding: 15px;
            background: #f7fafc;
            border-radius: 8px;
            border-left: 4px solid #667eea;
            text-align: left;
        }
        
        .security-note p {
            margin: 0;
            font-size: 13px;
            color: #4a5568;
            line-height: 1.6;
        }
        
        .security-note i {
            color: #667eea;
            margin-right: 8px;
        }
        
        @media (max-width: 480px) {
            .card {
                padding: 35px 25px;
            }
            
            h2 {
                font-size: 24px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-icon">
                <i class="fas fa-lock"></i>
            </div>
            <h2>Change Password</h2>
            
            <asp:Panel ID="pnlVerify" runat="server">
                <label>Current Password</label>
                <div class="input-wrapper">
                    <i class="fas fa-key"></i>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" placeholder="Enter your current password"></asp:TextBox>
                </div>
                <asp:Button ID="btnVerify" runat="server" Text="Verify Password" CssClass="button" OnClick="btnVerify_Click" />
                
                <div class="security-note">
                    <p><i class="fas fa-shield-alt"></i> Enter your current password to verify your identity</p>
                </div>
            </asp:Panel>
            
            <asp:Panel ID="pnlChange" runat="server" Visible="false">
                <label>New Password</label>
                <div class="input-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
                </div>
                
                <label>Confirm New Password</label>
                <div class="input-wrapper">
                    <i class="fas fa-lock"></i>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
                </div>
                
                <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" CssClass="button" OnClick="btnChangePassword_Click" />
                
                <div class="security-note">
                    <p><i class="fas fa-info-circle"></i> Choose a strong password with at least 8 characters, including uppercase, lowercase, numbers, and symbols</p>
                </div>
            </asp:Panel>
            
            <asp:Label ID="lb1" runat="server" CssClass="message-label" ForeColor="Red" Font-Bold="true"></asp:Label>
        </div>
    </div>
</asp:Content>
