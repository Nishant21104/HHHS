<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OCR.Donor.ChangePassword" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Modern Change Password Page Design */
        .password-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
            padding: 40px 20px;
            position: relative;
            overflow: hidden;
        }
        
        /* Animated background elements */
        .password-page::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: float 20s infinite ease-in-out;
        }
        
        .password-page::after {
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
        
        .password-container {
            max-width: 500px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease-out;
        }
        
        .password-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        /* Header with gradient and glass effect */
        .password-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.95) 0%, rgba(118, 75, 162, 0.95) 100%);
            padding: 40px 40px 50px 40px;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        
        .password-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse"><path d="M 20 0 L 0 0 0 20" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.5;
        }
        
        .password-header h4 {
            margin: 0;
            font-size: 32px;
            font-weight: 700;
            color: white;
            position: relative;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .password-header .subtitle {
            margin: 10px 0 0 0;
            font-size: 16px;
            color: rgba(255, 255, 255, 0.9);
            position: relative;
            font-weight: 400;
        }
        
        .password-header .icon {
            font-size: 48px;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        
        .password-body {
            padding: 40px;
            position: relative;
        }
        
        /* Security Info Card */
        .security-info {
            background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 30px;
            border-left: 4px solid #0ea5e9;
            animation: slideInRight 0.5s ease-out both;
        }
        
        .security-info .info-title {
            font-weight: 700;
            color: #0c4a6e;
            font-size: 14px;
            margin: 0 0 8px 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .security-info .info-text {
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
        
        .form-fieldset:nth-child(2) { animation-delay: 0.1s; }
        .form-fieldset:nth-child(3) { animation-delay: 0.15s; }
        .form-fieldset:nth-child(4) { animation-delay: 0.2s; }
        
        .form-fieldset:hover {
            border-color: #667eea;
            box-shadow: 0 8px 24px rgba(102, 126, 234, 0.12);
            transform: translateY(-2px);
        }
        
        .form-label {
            font-weight: 700;
            color: #2d3748;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 12px;
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
            padding: 14px 50px 14px 18px;
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
        
        /* Button Styling */
        .btn {
            width: 100%;
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
            margin-top: 10px;
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
        
        /* Success Message Styling */
        .success-message {
            background: #f0fdf4;
            border: 1px solid #bbf7d0;
            color: #16a34a;
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
        
        .success-message i {
            color: #22c55e;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .password-page {
                padding: 20px 10px;
            }
            
            .password-container {
                max-width: 100%;
                padding: 0;
            }
            
            .password-header {
                padding: 30px 20px 40px 20px;
            }
            
            .password-header h4 {
                font-size: 24px;
            }
            
            .password-body {
                padding: 30px 20px;
            }
            
            .form-fieldset {
                padding: 20px;
            }
            
            .btn {
                padding: 14px 24px;
                font-size: 14px;
            }
        }
        
        @media (max-width: 480px) {
            .password-card {
                border-radius: 20px;
            }
            
            .password-header {
                border-radius: 20px 20px 0 0;
            }
            
            .form-fieldset {
                border-radius: 12px;
                padding: 16px;
            }
        }
    </style>
    
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            // Password toggle functionality
            setupPasswordToggle();

            // Password strength checker for new password fields
            setupPasswordStrength();

            // Handle error message visibility
            setupErrorMessageVisibility();
        });

        function setupErrorMessageVisibility() {
            const errorLabel = document.getElementById('<%= lb1.ClientID %>');
            if (errorLabel) {
                // Show label if it has content, hide if empty
                const observer = new MutationObserver(function (mutations) {
                    mutations.forEach(function (mutation) {
                        if (mutation.type === 'childList' || mutation.type === 'characterData') {
                            const text = errorLabel.textContent || errorLabel.innerText;
                            if (text && text.trim() !== '') {
                                errorLabel.style.display = 'flex';
                            } else {
                                errorLabel.style.display = 'none';
                            }
                        }
                    });
                });

                observer.observe(errorLabel, {
                    childList: true,
                    characterData: true,
                    subtree: true
                });

                // Initial check
                const initialText = errorLabel.textContent || errorLabel.innerText;
                if (initialText && initialText.trim() !== '') {
                    errorLabel.style.display = 'flex';
                }
            }
        }

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
            const newPasswordInputs = document.querySelectorAll('input[id*="NewPassword"]');

            newPasswordInputs.forEach(input => {
                input.addEventListener('input', function () {
                    const password = this.value;
                    const strengthContainer = this.closest('.form-fieldset').querySelector('.password-strength');
                    const requirementsContainer = this.closest('.form-fieldset').querySelector('.password-requirements');

                    if (password.length > 0 && strengthContainer) {
                        strengthContainer.classList.add('show');
                        if (requirementsContainer) {
                            requirementsContainer.classList.add('show');
                        }

                        const strength = checkPasswordStrength(password);
                        updateStrengthIndicator(strength, this.closest('.form-fieldset'));
                        updateRequirements(password, this.closest('.form-fieldset'));
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="password-page">
        <div class="password-container">
            <div class="password-card">
                <!-- Header -->
                <div class="password-header">
                    <div class="icon">
                        <i class="fas fa-lock"></i>
                    </div>
                    <h4>Change Password</h4>
                    <p class="subtitle">Update your account security</p>
                </div>

                <!-- Body -->
                <div class="password-body">
                    <!-- Security Info -->
                    <div class="security-info">
                        <div class="info-title">
                            <i class="fas fa-shield-alt"></i>
                            Security Notice
                        </div>
                        <p class="info-text">
                            For your account security, please verify your current password first, then choose a strong new password 
                            with a mix of letters, numbers, and special characters.
                        </p>
                    </div>

                    <!-- Error/Success Message -->
                    <asp:Label ID="lb1" runat="server" CssClass="error-message" style="display: none;"></asp:Label>

                    <!-- Verify Password Panel -->
                    <asp:Panel ID="pnlVerify" runat="server">
                        <div class="form-fieldset">
                            <label class="form-label">Current Password</label>
                            <div class="password-input-wrapper">
                                <asp:TextBox ID="txtCurrentPassword" runat="server" 
                                    CssClass="form-control" 
                                    TextMode="Password" 
                                    placeholder="Enter your current password">
                                </asp:TextBox>
                                <button type="button" class="toggle-password">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>

                        <asp:Button ID="btnVerify" runat="server" 
                            Text="Verify Password" 
                            CssClass="btn btn-primary" 
                            OnClick="btnVerify_Click" />
                    </asp:Panel>

                    <!-- Change Password Panel -->
                    <asp:Panel ID="pnlChange" runat="server" Visible="false">
                        <div class="form-fieldset">
                            <label class="form-label">New Password</label>
                            <div class="password-input-wrapper">
                                <asp:TextBox ID="txtNewPassword" runat="server" 
                                    CssClass="form-control" 
                                    TextMode="Password" 
                                    placeholder="Enter your new password">
                                </asp:TextBox>
                                <button type="button" class="toggle-password">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            
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

                        <div class="form-fieldset">
                            <label class="form-label">Confirm New Password</label>
                            <div class="password-input-wrapper">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" 
                                    CssClass="form-control" 
                                    TextMode="Password" 
                                    placeholder="Confirm your new password">
                                </asp:TextBox>
                                <button type="button" class="toggle-password">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>

                        <asp:Button ID="btnChangePassword" runat="server" 
                            Text="Update Password" 
                            CssClass="btn btn-primary" 
                            OnClick="btnChangePassword_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
