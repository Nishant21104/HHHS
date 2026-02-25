<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Login.Master" AutoEventWireup="true" CodeBehind="DonorLogin.aspx.cs" Inherits="OCR.Donor.DonorLogin" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <div class="container" style="margin-bottom:50px;margin-top:50px;">
        <div class="card">
            <h2>Sign In Here !</h2>
            <label for="username">Username</label>
            <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your username"></asp:TextBox>
            <%--<input type="text" id="username" placeholder="Enter your username" required>--%>
<%--   <asp:RequiredFieldValidator ID="rqdUsername" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="LoginValidate" runat="server" ErrorMessage="Please enter your username"></asp:RequiredFieldValidator>

            <label for="password">Password</label>--%>
<%--<input type="password" id="password" placeholder="Enter your password" required>--%>
<%-- <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="LoginValidate" runat="server" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" ValidationGroup="LoginValidate" CssClass="button" />
            <div class="switch">Don't have an account? <a href="DonorRegistration.aspx" onclick="switchCard()">Register here</a></div>
        </div>
    </div>

</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
        /* Modern CSS for NGO Login - no TailwindCSS conflicts */
        .ngo-login-page {
            background: linear-gradient(135deg, #667eea 0%, #1f76bd 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.05);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.8s ease-out;
        }

        .float-animation {
            animation: float 3s ease-in-out infinite;
        }

        .pulse-animation {
            animation: pulse 2s infinite;
        }

        .ngo-login-page::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }

        .login-container {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 450px;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 50px 40px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

            .login-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 35px 100px rgba(0, 0, 0, 0.25);
            }

        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .login-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

            .login-icon i {
                font-size: 32px;
                color: white;
            }

        .login-title {
            font-size: 2.2rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 10px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-subtitle {
            color: #64748b;
            font-size: 14px;
            margin: 0;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #475569;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        .form-input {
            width: 100%;
            padding: 18px 18px 18px 50px;
            border: 2px solid #e2e8f0;
            border-radius: 15px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
        }

            .form-input:focus {
                outline: none;
                border-color: #667eea;
                background: white;
                box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            }

                .form-input:focus + .input-icon {
                    color: #667eea;
                }

            .form-input:hover {
                border-color: #cbd5e0;
                background: white;
            }

        .validator-error {
            color: #ef4444;
            font-size: 12px;
            margin-top: 8px;
            display: block;
            font-weight: 500;
        }

        .login-button {
            width: 100%;
            padding: 18px;
            /*background: linear-gradient(135deg, #f85a40, #764ba2);*/
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 15px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }

            .login-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 15px 40px rgba(102, 126, 234, 0.4);
            }

            .login-button:active {
                transform: translateY(0);
            }

        .switch-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e2e8f0;
        }

        .switch-section2 {
            text-align: center;
            margin-top: 10px;
            padding-top: 0px;
            border-top: 1px solid #e2e8f0;
        }

        .switch-text {
            color: #64748b;
            font-size: 14px;
        }

        .switch-link {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
            transition: color 0.3s ease;
        }

            .switch-link:hover {
                color: #764ba2;
                text-decoration: underline;
            }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-card {
                padding: 40px 30px;
                margin: 20px;
            }

            .login-title {
                font-size: 1.8rem;
            }

            .form-input {
                padding: 16px 16px 16px 45px;
            }

            .login-button {
                padding: 16px;
            }
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
            }

            .login-title {
                font-size: 1.6rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ngo-login-page">
        <div class="login-container">
            <div class="login-card fade-in-up">
                <!-- Header -->
                <div class="login-header">
                    <div class="login-icon pulse-animation">
                        <i class="fas fa-user-shield"></i>
                    </div>
                    <h2 class="login-title">Donor Login</h2>
                    <p class="login-subtitle">Access your account to manage donations</p>
                </div>

                <!-- Username Field -->
                <div class="form-group">
                    <label for="txtUserName" class="form-label">Username</label>
                    <div class="input-wrapper">
                        <asp:TextBox ID="txtUserName" runat="server"
                            CssClass="form-input"
                            placeholder="Enter your username"></asp:TextBox>
                        <i class="fas fa-user input-icon"></i>
                    </div>
                    <asp:RequiredFieldValidator ID="rqdUsername"
                        runat="server"
                        ControlToValidate="txtUserName"
                        ValidationGroup="LoginValidate"
                        CssClass="validator-error"
                        ErrorMessage="Please enter your username" />
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label for="txtPassword" class="form-label">Password</label>
                    <div class="input-wrapper">
                        <asp:TextBox ID="txtPassword" runat="server"
                            TextMode="Password"
                            CssClass="form-input"
                            placeholder="Enter your password"></asp:TextBox>
                        <i class="fas fa-lock input-icon"></i>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ValidationGroup="LoginValidate"
                        CssClass="validator-error"
                        ErrorMessage="Please enter your password" />
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Login"
                    CssClass="login-button"
                    ValidationGroup="LoginValidate"
                    OnClick="btnLogin_Click" />

                <!-- Register Link -->
                <div class="switch-section">
                    <span class="switch-text">Don't have an account?</span>
                    <a href="DonorRegistration.aspx" class="switch-link">Register here</a>
                </div>

                <div class="switch-section2">
                    <span class="switch-text"></span>
                    <a href="VerifyDonorEmail.aspx" class="switch-link">VeriFy Email here</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

