<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Login.Master" AutoEventWireup="true" CodeBehind="DonorRegistration.aspx.cs" Inherits="OCR.Donor.DonorRegistration" %>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');


        .container1 {
            justify-content: center;
            align-items: center;
            max-width: 700px;
            width: 100%;
            background-color: #fff;
            padding: 25px 30px;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.15);
        }

            .container1 .title {
                font-size: 25px;
                font-weight: 500;
                position: relative;
                text-align: center;
            }

                .container1 .title::before {
                    content: "";
                    position: absolute;
                    left: 0;
                    bottom: 0;
                    height: 3px;
                    width: 30px;
                    border-radius: 5px;
                }

        .content .user-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0 12px 0;
        }

        .user-details .input-box {
            margin-bottom: 15px;
            width: calc(100% / 2 - 20px);
        }

        .input-box span.details {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .user-details .input-box input {
            height: 45px;
            width: 100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding-left: 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
        }

            .user-details .input-box input:focus,
            .user-details .input-box input:valid {
                /*border-color: #9b59b6;*/
            }

        .gender-details .gender-title {
            font-size: 20px;
            font-weight: 500;
        }

        .category {
            display: flex;
            width: 80%;
            margin: 14px 0;
            justify-content: space-between;
        }

            .category label {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

                .category label .dot {
                    height: 18px;
                    width: 18px;
                    border-radius: 50%;
                    margin-right: 10px;
                    background: #d9d9d9;
                    border: 5px solid transparent;
                    transition: all 0.3s ease;
                }

        #dot-1:checked ~ .category label .one,
        #dot-2:checked ~ .category label .two,
        #dot-3:checked ~ .category label .three {
            background: #9b59b6;
            border-color: #d9d9d9;
        }

        input[type="radio"] {
        }

        .button {
            height: 45px;
            margin: 35px 0
        }

            .button input {
                height: 100%;
                width: 40%;
                border-radius: 5px;
                border: none;
                color: #fff;
                font-size: 18px;
                font-weight: 500;
                letter-spacing: 1px;
                cursor: pointer;
                transition: all 0.3s ease;
                background: #f85a40;
            }


        @media(max-width: 584px) {
            .container1 {
                max-width: 100%;
            }

            .user-details .input-box {
                margin-bottom: 15px;
                width: 100%;
            }

            .category {
                width: 100%;
            }

            .content .user-details {
                max-height: 300px;
                overflow-y: scroll;
            }

            .user-details::-webkit-scrollbar {
                width: 5px;
            }
        }

        @media(max-width: 459px) {
            .container1 .content .category {
                flex-direction: column;
            }
        }
    </style>
    <script src="assets/bootstrap.min.js"></script>
    <script>
        function Validation() {
            debugger;
            var name = document.getElementById('<%= txtName.ClientID %>').value;
            var userName = document.getElementById('<%= txtUserName.ClientID %>').value;
            var Email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var PhoneNumber = document.getElementById('<%= txtPhoneNumber.ClientID %>').value;
            var Password = document.getElementById('<%= txtPassword.ClientID %>').value;
            var ConfirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

            if (name == null || name == "") {
                $('#lblErrName').text('Please enter your name');
                //alert("Name can't be blank");
                return false;
            }
            else if (userName == null || userName == "")//else if (password.length < 6)
            {
                $('#lblErrUsername').text('Please enter your username');
                //alert("Password must be at least 6 characters long.");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1" style="margin: auto; width: 50%; padding: 10px; margin-top: 3%; margin-bottom: 3%; height: auto; border-style: groove;">
        <div class="title">Be a part of us, Register Here !..</div>
        <div class="content">
            <div class="user-details" style="height: 500px;">
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Full Name</span>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrName" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Username</span>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqUserName" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your username"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrUsername" runat="server"></asp:Label>
                  
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Email</span>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqEmail" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrEmail" runat="server"></asp:Label>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Phone Number</span>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhoneNumer" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your phone number"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPhone" runat="server"></asp:Label>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>  
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Password</span>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPass" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPassword" runat="server"></asp:Label>

                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Confirm Password</span>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqConfirmPass" ForeColor="Red" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter confirm your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblConfirmPassword" runat="server"></asp:Label>
                    <asp:CompareValidator ID="cmpValidator" ForeColor="Red" runat="server" ValidationGroup="RegisterValidate" ErrorMessage="Password and Confirm Password should be same" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                    
                </div>

            </div>

            <div class="button" style="text-align-last: center;" >
                <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                   <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
               <asp:Button ID="btnBack" runat="server" Text="Back to Login" OnClick="btnBack_Click" />  

            </div>
        </div>
    </div>

</asp:Content>--%>


<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Modern Registration Page Design */
        .registration-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
            padding: 40px 20px;
            position: relative;
            overflow: hidden;
        }
        
        /* Animated background elements */
        .registration-page::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: float 20s infinite ease-in-out;
        }
        
        .registration-page::after {
            content: '';
            position: absolute;
            bottom: -50%;
            left: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.08) 0%, transparent 70%);
            animation: float 15s infinite ease-in-out reverse;
        }
        
        @keyframes float {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
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
        
        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
        
        @keyframes scaleIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }
        
        .registration-container {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease-out;
        }
        
        .registration-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        /* Header with gradient and glass effect */
        .registration-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.95) 0%, rgba(118, 75, 162, 0.95) 100%);
            padding: 40px 40px 50px 40px;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        
        .registration-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse"><path d="M 20 0 L 0 0 0 20" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.5;
        }
        
        .registration-header h4 {
            margin: 0;
            font-size: 32px;
            font-weight: 700;
            color: white;
            position: relative;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .registration-header .subtitle {
            margin: 10px 0 0 0;
            font-size: 16px;
            color: rgba(255, 255, 255, 0.9);
            position: relative;
            font-weight: 400;
        }
        
        .registration-header .icon {
            font-size: 48px;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        
        .registration-body {
            padding: 40px;
            position: relative;
        }
        
        /* Welcome Info Card */
        .welcome-info {
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 4px solid #0ea5e9;
            animation: slideInRight 0.5s ease-out both;
        }
        
        .welcome-info .info-title {
            font-weight: 700;
            color: #0c4a6e;
            font-size: 14px;
            margin: 0 0 8px 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .welcome-info .info-text {
            color: #0c4a6e;
            font-size: 13px;
            line-height: 1.6;
            margin: 0;
        }
        
        /* Form Fields with modern cards */
        .form-fieldset {
            background: white;
            border-radius: 16px;
            padding: 24px;
            margin-bottom: 20px;
            border: 2px solid #f0f4f8;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            animation: slideInRight 0.5s ease-out both;
            position: relative;
        }
        
        .form-fieldset:nth-child(2) { animation-delay: 0.05s; }
        .form-fieldset:nth-child(3) { animation-delay: 0.1s; }
        .form-fieldset:nth-child(4) { animation-delay: 0.15s; }
        .form-fieldset:nth-child(5) { animation-delay: 0.2s; }
        .form-fieldset:nth-child(6) { animation-delay: 0.25s; }
        .form-fieldset:nth-child(7) { animation-delay: 0.3s; }
        
        .form-fieldset:hover {
            border-color: #667eea;
            box-shadow: 0 8px 24px rgba(102, 126, 234, 0.12);
            transform: translateY(-2px);
        }
        
        .user-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .input-box {
            position: relative;
        }
        
        .form-label {
            font-weight: 700;
            color: #2d3748;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 8px;
            display: block;
        }
        
        .form-label::before {
            content: '';
            display: inline-block;
            width: 4px;
            height: 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 2px;
            margin-right: 8px;
            vertical-align: middle;
        }
        
        .password-input-wrapper {
            position: relative;
        }
        
        .form-control {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
            box-sizing: border-box;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            transform: translateY(-1px);
        }
        
        .form-control:hover {
            border-color: #cbd5e0;
            background: white;
        }
        
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #64748b;
            cursor: pointer;
            font-size: 18px;
            padding: 5px;
            transition: all 0.3s ease;
        }
        
        .toggle-password:hover {
            color: #667eea;
        }
        
        /* Password Strength Indicator */
        .password-strength {
            margin-top: 8px;
            height: 6px;
            background: #e2e8f0;
            border-radius: 3px;
            overflow: hidden;
            display: none;
        }
        
        .password-strength.show {
            display: block;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0%;
            transition: all 0.3s ease;
            border-radius: 3px;
        }
        
        .password-strength-bar.weak {
            width: 33%;
            background: #ef4444;
        }
        
        .password-strength-bar.medium {
            width: 66%;
            background: #f59e0b;
        }
        
        .password-strength-bar.strong {
            width: 100%;
            background: #10b981;
        }
        
        .password-strength-text {
            font-size: 11px;
            margin-top: 4px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .password-strength-text.weak { color: #ef4444; }
        .password-strength-text.medium { color: #f59e0b; }
        .password-strength-text.strong { color: #10b981; }
        
        /* Password Requirements */
        .password-requirements {
            margin-top: 12px;
            padding: 12px;
            background: #f8fafc;
            border-radius: 8px;
            font-size: 12px;
            display: none;
        }
        
        .password-requirements.show {
            display: block;
        }
        
        .requirement {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 4px;
            color: #64748b;
            transition: color 0.3s ease;
        }
        
        .requirement.met {
            color: #10b981;
        }
        
        .requirement i {
            font-size: 10px;
            width: 12px;
        }
        
        /* Validation Styling */
        .validation-error {
            color: #dc2626;
            font-size: 12px;
            margin-top: 4px;
            display: block;
            font-weight: 500;
        }
        
        .validation-success {
            color: #16a34a;
            font-size: 12px;
            margin-top: 4px;
            display: block;
            font-weight: 500;
        }
        
        /* Button Group */
        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 30px;
            animation: fadeInUp 0.6s ease-out 0.4s both;
        }
        
        .btn {
            padding: 16px 32px;
            border: none;
            border-radius: 14px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }
        
        .btn:hover::before {
            width: 300px;
            height: 300px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
        }
        
        .btn-secondary {
            background: #f1f5f9;
            color: #475569;
            border: 2px solid #e2e8f0;
        }
        
        .btn-secondary:hover {
            background: #e2e8f0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        /* Error Message Styling */
        .error-message {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #dc2626;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 8px;
            animation: slideInRight 0.3s ease-out;
        }
        
        .error-message i {
            color: #ef4444;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .registration-page {
                padding: 20px 10px;
            }
            
            .registration-container {
                max-width: 100%;
                padding: 0;
            }
            
            .registration-header {
                padding: 30px 20px 40px 20px;
            }
            
            .registration-header h4 {
                font-size: 24px;
            }
            
            .registration-body {
                padding: 30px 20px;
            }
            
            .user-details {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .button-group {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .btn {
                padding: 14px 24px;
                font-size: 14px;
            }
        }
        
        @media (max-width: 480px) {
            .registration-card {
                border-radius: 20px;
            }
            
            .registration-header {
                border-radius: 20px 20px 0 0;
            }
            
            .form-fieldset {
                padding: 16px;
            }
        }
    </style>
    
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            // Password toggle functionality
            setupPasswordToggle();

            // Password strength checker
            setupPasswordStrength();
        });

        function setupPasswordToggle() {
            const toggleButtons = document.querySelectorAll('.toggle-password');

            toggleButtons.forEach(button => {
                button.addEventListener('click', function () {
                    const input = this.previousElementSibling;
                    const icon = this.querySelector('i');

                    if (input.type === 'password') {
                        input.type = 'text';
                        icon.classList.remove('fa-eye');
                        icon.classList.add('fa-eye-slash');
                    } else {
                        input.type = 'password';
                        icon.classList.remove('fa-eye-slash');
                        icon.classList.add('fa-eye');
                    }
                });
            });
        }

        function setupPasswordStrength() {
            const passwordInputs = document.querySelectorAll('input[id*="Password"]');

            passwordInputs.forEach(input => {
                input.addEventListener('input', function () {
                    const password = this.value;
                    const strengthContainer = this.closest('.input-box').querySelector('.password-strength');
                    const requirementsContainer = this.closest('.input-box').querySelector('.password-requirements');

                    if (password.length > 0 && strengthContainer) {
                        strengthContainer.classList.add('show');
                        if (requirementsContainer) {
                            requirementsContainer.classList.add('show');
                        }

                        const strength = checkPasswordStrength(password);
                        updateStrengthIndicator(strength, this.closest('.input-box'));
                        updateRequirements(password, this.closest('.input-box'));
                    } else if (strengthContainer) {
                        strengthContainer.classList.remove('show');
                        if (requirementsContainer) {
                            requirementsContainer.classList.remove('show');
                        }
                    }
                });
            });
        }

        function checkPasswordStrength(password) {
            let strength = 0;

            // Length check
            if (password.length >= 8) strength++;
            if (password.length >= 12) strength++;

            // Character variety checks
            if (/[a-z]/.test(password)) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^a-zA-Z0-9]/.test(password)) strength++;

            if (strength <= 2) return 'weak';
            if (strength <= 4) return 'medium';
            return 'strong';
        }

        function updateStrengthIndicator(strength, container) {
            const strengthBar = container.querySelector('.password-strength-bar');
            const strengthText = container.querySelector('.password-strength-text');

            if (strengthBar) {
                strengthBar.className = 'password-strength-bar ' + strength;
            }
            if (strengthText) {
                strengthText.className = 'password-strength-text ' + strength;
                strengthText.textContent = strength + ' password';
            }
        }

        function updateRequirements(password, container) {
            const requirements = [
                { regex: /.{8,}/, elementId: 'req-length' },
                { regex: /[a-z]/, elementId: 'req-lowercase' },
                { regex: /[A-Z]/, elementId: 'req-uppercase' },
                { regex: /[0-9]/, elementId: 'req-number' },
                { regex: /[^a-zA-Z0-9]/, elementId: 'req-special' }
            ];

            requirements.forEach(req => {
                const element = container.querySelector('#' + req.elementId);
                if (element) {
                    if (req.regex.test(password)) {
                        element.classList.add('met');
                        element.querySelector('i').className = 'fas fa-check';
                    } else {
                        element.classList.remove('met');
                        element.querySelector('i').className = 'fas fa-circle';
                    }
                }
            });
        }

        function Validation() {
            debugger;
            var name = document.getElementById('<%= txtName.ClientID %>').value;
            var userName = document.getElementById('<%= txtUserName.ClientID %>').value;
            var Email = document.getElementById('<%= txtEmail.ClientID %>').value;
            var PhoneNumber = document.getElementById('<%= txtPhoneNumber.ClientID %>').value;
            var Password = document.getElementById('<%= txtPassword.ClientID %>').value;
            var ConfirmPassword = document.getElementById('<%= txtConfirmPassword.ClientID %>').value;

            if (name == null || name == "") {
                $('#lblErrName').text('Please enter your name');
                //alert("Name can't be blank");
                return false;
            }
            else if (userName == null || userName == "")//else if (password.length < 6)
            {
                $('#lblErrUsername').text('Please enter your username');
                //alert("Password must be at least 6 characters long.");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="registration-page">
        <div class="registration-container">
            <div class="registration-card">
                <!-- Header -->
                <div class="registration-header">
                    <div class="icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <h4>Be a part of us, Register Here!..</h4>
                    <p class="subtitle">Join our community and make a difference</p>
                </div>

                <!-- Body -->
                <div class="registration-body">
                    <!-- Welcome Info -->
                    <div class="welcome-info">
                        <div class="info-title">
                            <i class="fas fa-heart"></i>
                            Welcome to Our Community
                        </div>
                        <p class="info-text">
                            Thank you for your interest in joining our donor community. Please fill in the form below 
                            to create your account and start making a difference in people's lives.
                        </p>
                    </div>

                    <!-- Error Message -->
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>

                    <!-- Form Fields -->
                    <div class="form-fieldset">
                        <div class="user-details">
                            <!-- Full Name -->
                            <div class="input-box">
                                <label class="form-label">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblErrName" runat="server" CssClass="validation-error"></asp:Label>
                            </div>

                            <!-- Username -->
                            <div class="input-box">
                                <label class="form-label">Username</label>
                                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqUserName" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your username" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblErrUsername" runat="server" CssClass="validation-error"></asp:Label>
                            </div>

                            <!-- Email -->
                            <div class="input-box">
                                <label class="form-label">Email Address</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqEmail" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your email" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="validation-error"></asp:RegularExpressionValidator>  
                                <asp:Label ID="lblErrEmail" runat="server" CssClass="validation-error"></asp:Label>
                            </div>

                            <!-- Phone Number -->
                            <div class="input-box">
                                <label class="form-label">Phone Number</label>
                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter your number" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqPhoneNumer" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your phone number" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}" CssClass="validation-error"></asp:RegularExpressionValidator>  
                                <asp:Label ID="lblErrPhone" runat="server" CssClass="validation-error"></asp:Label>
                            </div>

                            <!-- Password -->
                            <div class="input-box">
                                <label class="form-label">Password</label>
                                <div class="password-input-wrapper">
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="toggle-password">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                <asp:RequiredFieldValidator ID="reqPass" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your password" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblErrPassword" runat="server" CssClass="validation-error"></asp:Label>
                                
                                <!-- Password Strength Indicator -->
                                <div class="password-strength">
                                    <div class="password-strength-bar"></div>
                                    <div class="password-strength-text"></div>
                                </div>
                                
                                <!-- Password Requirements -->
                                <div class="password-requirements">
                                    <div class="requirement" id="req-length">
                                        <i class="fas fa-circle"></i>
                                        At least 8 characters
                                    </div>
                                    <div class="requirement" id="req-lowercase">
                                        <i class="fas fa-circle"></i>
                                        One lowercase letter
                                    </div>
                                    <div class="requirement" id="req-uppercase">
                                        <i class="fas fa-circle"></i>
                                        One uppercase letter
                                    </div>
                                    <div class="requirement" id="req-number">
                                        <i class="fas fa-circle"></i>
                                        One number
                                    </div>
                                    <div class="requirement" id="req-special">
                                        <i class="fas fa-circle"></i>
                                        One special character
                                    </div>
                                </div>
                            </div>

                            <!-- Confirm Password -->
                            <div class="input-box">
                                <label class="form-label">Confirm Password</label>
                                <div class="password-input-wrapper">
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                                    <button type="button" class="toggle-password">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                <asp:RequiredFieldValidator ID="reqConfirmPass" ForeColor="Red" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter confirm your password" CssClass="validation-error"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpValidator" ForeColor="Red" runat="server" ValidationGroup="RegisterValidate" ErrorMessage="Password and Confirm Password should be same" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="validation-error"></asp:CompareValidator>
                                <asp:Label ID="lblConfirmPassword" runat="server" CssClass="validation-error"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="button-group">
                        <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                        <asp:Button ID="btnBack" runat="server" Text="Back to Login" CssClass="btn btn-secondary" OnClick="btnBack_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
