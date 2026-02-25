<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="MyDetails.aspx.cs" Inherits="OCR.NGO.MyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Modern NGO Profile Page Design */
        body {
            margin: 0;
            padding: 0;
        }
        
        .profile-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', 'Segoe UI', system-ui, -apple-system, sans-serif;
            padding: 40px 20px;
            position: relative;
            overflow: hidden;
        }
        
        /* Animated background elements */
        .profile-page::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: float 20s infinite ease-in-out;
        }
        
        .profile-page::after {
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
        
        .profile-container {
            max-width: 900px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
            animation: fadeInUp 0.6s ease-out;
        }
        
        .profile-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            backdrop-filter: blur(10px);
        }
        
        /* Header with gradient and glass effect */
        .profile-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.95) 0%, rgba(118, 75, 162, 0.95) 100%);
            padding: 40px 40px 100px 40px;
            position: relative;
            overflow: hidden;
        }
        
        .profile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><defs><pattern id="grid" width="20" height="20" patternUnits="userSpaceOnUse"><path d="M 20 0 L 0 0 0 20" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="1"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.5;
        }
        
        .profile-header h4 {
            margin: 0;
            font-size: 32px;
            font-weight: 700;
            color: white;
            position: relative;
            text-align: center;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .edit-btn {
            position: absolute;
            top: 30px;
            right: 30px;
            background: rgba(255, 255, 255, 0.25);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.4);
            padding: 10px 20px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-decoration: none;
            backdrop-filter: blur(10px);
        }
        
        .edit-btn:hover {
            background: rgba(255, 255, 255, 0.35);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        
        .profile-body {
            padding: 0 40px 40px 40px;
            margin-top: -60px;
            position: relative;
        }
        
        /* Profile Image Section - Card style */
        .profile-image-section {
            background: white;
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            animation: scaleIn 0.5s ease-out 0.2s both;
        }
        
        .profile-image {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #667eea;
            margin-bottom: 20px;
            box-shadow: 0 8px 24px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
        }
        
        .profile-image:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 32px rgba(102, 126, 234, 0.4);
        }
        
        .file-upload {
            display: inline-block;
            position: relative;
            overflow: hidden;
        }
        
        .file-upload label {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 12px 24px;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 14px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        .file-upload label:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        .file-upload input[type="file"] {
            position: absolute;
            left: -9999px;
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
        }
        
        .form-fieldset:nth-child(2) { animation-delay: 0.05s; }
        .form-fieldset:nth-child(3) { animation-delay: 0.1s; }
        .form-fieldset:nth-child(4) { animation-delay: 0.15s; }
        .form-fieldset:nth-child(5) { animation-delay: 0.2s; }
        .form-fieldset:nth-child(6) { animation-delay: 0.25s; }
        .form-fieldset:nth-child(7) { animation-delay: 0.3s; }
        .form-fieldset:nth-child(8) { animation-delay: 0.35s; }
        .form-fieldset:nth-child(9) { animation-delay: 0.4s; }
        .form-fieldset:nth-child(10) { animation-delay: 0.45s; }
        
        .form-fieldset:hover {
            border-color: #667eea;
            box-shadow: 0 8px 24px rgba(102, 126, 234, 0.12);
            transform: translateY(-2px);
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: 200px 1fr;
            gap: 20px;
            align-items: center;
        }
        
        .form-label {
            font-weight: 700;
            color: #2d3748;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .form-label::before {
            content: '';
            width: 4px;
            height: 20px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 2px;
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
        
        textarea.form-control {
            resize: vertical;
            min-height: 100px;
            font-family: inherit;
        }
        
        /* Dropdown custom styling */
        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-color: #f8fafc;
            background-image: url('data:image/svg+xml,<svg width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1 1.5L6 6.5L11 1.5" stroke="%23667eea" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>');
            background-repeat: no-repeat;
            background-position: right 18px center;
            padding-right: 45px;
            cursor: pointer;
            color: #2d3748;
            line-height: normal;
        }
        
        select.form-control option {
            background: white;
            color: #2d3748;
            padding: 10px;
        }
        
        select.form-control option:checked,
        select.form-control option:hover {
            background: #667eea;
            color: white;
        }
        
        select.form-control::-ms-expand {
            display: none;
        }
        
        /* Button Group */
        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 40px;
            animation: fadeInUp 0.6s ease-out 0.5s both;
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
        
        .btn-cancel {
            background: #f1f5f9;
            color: #475569;
            border: 2px solid #e2e8f0;
        }
        
        .btn-cancel:hover {
            background: #e2e8f0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .btn-save {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
        }
        
        .btn-save:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.5);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-page {
                padding: 20px 10px;
            }
            
            .profile-container {
                max-width: 100%;
                padding: 0;
            }
            
            .profile-header {
                padding: 30px 20px 80px 20px;
            }
            
            .profile-header h4 {
                font-size: 24px;
            }
            
            .edit-btn {
                position: static;
                margin-top: 20px;
                display: block;
                width: fit-content;
                margin-left: auto;
                margin-right: auto;
            }
            
            .profile-body {
                padding: 0 20px 30px 20px;
                margin-top: -50px;
            }
            
            .profile-image-section {
                padding: 20px;
            }
            
            .profile-image {
                width: 120px;
                height: 120px;
            }
            
            .form-fieldset {
                padding: 20px;
            }
            
            .form-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }
            
            .form-label {
                font-size: 12px;
            }
            
            .button-group {
                grid-template-columns: 1fr;
                gap: 15px;
                margin-top: 30px;
            }
            
            .btn {
                padding: 14px 24px;
                font-size: 14px;
            }
        }
        
        @media (max-width: 480px) {
            .profile-card {
                border-radius: 20px;
            }
            
            .profile-header {
                border-radius: 20px 20px 0 0;
            }
            
            .form-fieldset {
                border-radius: 12px;
                padding: 16px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-page">
        <div class="profile-container">
            <div class="profile-card">
                <!-- Header -->
                <div class="profile-header">
                    <h4>My Profile</h4>
                    <asp:Button ID="btnEditDetail" runat="server" 
                        CssClass="edit-btn" 
                        Text="✏️ Edit" 
                        OnClick="btnEditDetails_Click" />
                </div>

                <!-- Body -->
                <div class="profile-body">
                    <!-- Profile Photo -->
                    <div class="profile-image-section">
                        <asp:Image ID="Image1" runat="server" CssClass="profile-image" />
                        <div class="file-upload">
                            <asp:FileUpload ID="NGOfileupload" runat="server" />
                            <label for="<%= NGOfileupload.ClientID %>">
                                <i class="fas fa-camera"></i>
                                Change Photo
                            </label>
                        </div>
                    </div>

                    <!-- NGO Name -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">NGO Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter NGO name"></asp:TextBox>
                        </div>
                    </div>

                    <!-- About You -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">About You</label>
                            <textarea id="txtAboutyou" runat="server" class="form-control" rows="4" placeholder="Tell us about your NGO..." required></textarea>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Address</label>
                            <input type="text" id="txtAddress" runat="server" class="form-control" placeholder="Enter NGO address" required />
                        </div>
                    </div>

                    <!-- Phone Number -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Phone Number</label>
                            <input type="text" id="txtPhoneNumber" runat="server" class="form-control" placeholder="+91 XXXXX XXXXX" />
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Email Address</label>
                            <input type="email" id="txtEmail" runat="server" class="form-control" placeholder="ngo@example.com" />
                        </div>
                    </div>

                    <!-- Type Of NGO -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Type Of NGO</label>
                            <asp:DropDownList ID="ddlTypeOfNGO" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Charitable Orientation" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Service Orientation" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Participatory Orientation" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Community-based Organisations (CBOs)" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Citywide Organisations" Value="5"></asp:ListItem>
                                <asp:ListItem Text="National NGOs" Value="6"></asp:ListItem>
                                <asp:ListItem Text="International NGOs" Value="7"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Main Purpose -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Main Purpose</label>
                            <input type="text" id="txtPurpose" runat="server" class="form-control" placeholder="Enter main purpose" required />
                        </div>
                    </div>

                    <!-- Bank Name -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Bank Name</label>
                            <input type="text" id="txtBankName" runat="server" class="form-control" placeholder="Enter bank name" required />
                        </div>
                    </div>

                    <!-- Bank Account Holder Name -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Account Holder Name</label>
                            <input type="text" id="txtBankAccountHolderName" runat="server" class="form-control" placeholder="Enter account holder name" />
                        </div>
                    </div>

                    <!-- Branch Name -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Branch Name</label>
                            <input type="text" id="txtBranchName" runat="server" class="form-control" placeholder="Enter branch name" />
                        </div>
                    </div>

                    <!-- Account Number -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Account Number</label>
                            <input type="number" id="txtAccountNumber" runat="server" class="form-control" placeholder="Enter account number" required />
                        </div>
                    </div>

                    <!-- IFSC Code -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">IFSC Code</label>
                            <input type="text" id="txtIFSCCode" runat="server" class="form-control" placeholder="Enter IFSC code" required />
                        </div>
                    </div>

                    <!-- Website URL -->
                    <div class="form-fieldset">
                        <div class="form-grid">
                            <label class="form-label">Website URL</label>
                            <input type="text" id="txtwebsite" runat="server" class="form-control" placeholder="https://www.example.com" />
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="button-group">
                        <asp:Button ID="btnCancel" runat="server" 
                            Text="Cancel" 
                            CssClass="btn btn-cancel" />
                        <asp:Button ID="btnSave" runat="server" 
                            Text="Save Changes" 
                            CssClass="btn btn-save" 
                            OnClick="btnSave_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>