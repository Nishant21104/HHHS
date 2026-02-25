<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddFundraiser.aspx.cs" Inherits="OCR.Admin.AddFundraiser" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container1" style="margin: auto; width: 50%; padding: 10px; margin-top: 6%; margin-bottom: 05%; height: 690px; border-style: groove;">
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
                    <span class="details">User Name</span>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your User name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqdUserName" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your user name"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblUserName" runat="server"></asp:Label>
                </div>

                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Title</span>
                    <asp:TextBox ID="txtTitle" runat="server" placeholder="Enter your title"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtitle" ForeColor="Red" ControlToValidate="txtTitle" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Title"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrTitle" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Email</span>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqEmail" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrEmail" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Phone Number</span>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhoneNumer" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your phone number"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPhone" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 60px; margin-bottom: 0px;">
                    <span class="details">State</span>
                    <asp:DropDownList ID="drpState" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrState" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 60px; margin-bottom: 0px;">
                    <span class="details">City</span>
                    <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrCity" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Banner</span>
                     <asp:FileUpload ID="Bannerfileupload" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="Bannerfileupload" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please choose image"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblBannerfileupload" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Description</span>
                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Enter your Description" MaxLength="1000" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtDescription" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Description"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrDescription" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Amount</span>
                    <asp:TextBox ID="txtAmount" runat="server" placeholder="Enter your Amount" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqAmount" ForeColor="Red" ControlToValidate="txtAmount" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Amount"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrAmount" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Start Date</span>
                    <asp:TextBox ID="txtStartDate" runat="server" MaxLength="16" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqStartDate" ForeColor="Red" ControlToValidate="txtStartDate" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select start date"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">End Date</span>
                    <asp:TextBox ID="txtEndDate" runat="server" MaxLength="16" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqdEndDate" ForeColor="Red" ControlToValidate="txtEndDate" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select end date"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
                 <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Status</span>
                    <asp:TextBox ID="txtStatus" runat="server" MaxLength="16"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqd" ForeColor="Red" ControlToValidate="txtStatus" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select status"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </div>
            </div>
            <div class="button">
                <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                   <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
            </div> 
        </div>
    </div>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Modern CSS for Add Fundraiser - no TailwindCSS conflicts */
        .fundraiser-add-page {
            background: linear-gradient(135deg, #667eea 0%, #1f76bd 100%);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            padding: 30px;
            position: relative;
        }
        
        .fundraiser-add-page::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.05" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }
        
        .container1 {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0px auto;
        }
        
        .title {
            font-size: 32px;
            font-weight: 700;
            color: #1a202c;
            margin: 0 0 30px 0;
            background: linear-gradient(135deg, #f85a40, #ff7a55);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        
        .title::before {
            content: '🎯';
            font-size: 36px;
            -webkit-text-fill-color: initial;
        }
        
        .user-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 24px;
            margin-bottom: 30px;
        }
        
        .input-box {
            position: relative;
        }
        
        .input-box span.details {
            display: block;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .input-box input,
        .input-box textarea,
        .input-box select {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
        }
        
        .input-box input:focus,
        .input-box textarea:focus,
        .input-box select:focus {
            outline: none;
            border-color: #f85a40;
            background: white;
            box-shadow: 0 0 0 4px rgba(248, 90, 64, 0.1);
        }
        
        .input-box textarea {
            resize: vertical;
            min-height: 100px;
        }
        
        .input-box .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
        }
        
        .input-box .form-control:focus {
            outline: none;
            border-color: #f85a40;
            background: white;
            box-shadow: 0 0 0 4px rgba(248, 90, 64, 0.1);
        }
        
        .input-box input[type="file"] {
            padding: 10px;
            background: #f8fafc;
            border: 2px dashed #e2e8f0;
            cursor: pointer;
        }
        
        .input-box input[type="file"]:focus {
            border-color: #f85a40;
            border-style: solid;
        }
        
        .button {
            text-align: center;
            margin-top: 40px;
        }
        
        .button input {
            background: linear-gradient(135deg, #f85a40, #ff7a55);
            color: white;
            border: none;
            padding: 16px 48px;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 4px 15px rgba(248, 90, 64, 0.3);
        }
        
        .button input:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(248, 90, 64, 0.4);
        }
        
        .button input:active {
            transform: translateY(0);
        }
        
        .validation-error {
            color: #e53e3e;
            font-size: 12px;
            margin-top: 4px;
            display: block;
            font-weight: 500;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .fundraiser-add-page {
                padding: 20px 15px;
            }
            
            .container1 {
                padding: 30px 20px;
                margin: 20px auto;
            }
            
            .title {
                font-size: 24px;
            }
            
            .user-details {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .button input {
                padding: 14px 32px;
                font-size: 16px;
            }
        }
        
        @media (max-width: 480px) {
            .container1 {
                padding: 20px 15px;
            }
            
            .title {
                font-size: 20px;
            }
            
            .input-box input,
            .input-box textarea,
            .input-box select,
            .input-box .form-control {
                padding: 12px 14px;
                font-size: 14px;
            }
            
            .button input {
                padding: 12px 24px;
                font-size: 14px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fundraiser-add-page">
        <div class="container1">
            <div class="title">Create Fundraiser Campaign</div>
            <div class="content">
                <div class="user-details">
                    <div class="input-box">
                        <span class="details">Full Name</span>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrName" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">User Name</span>
                        <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your User name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqdUserName" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your user name" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblUserName" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Title</span>
                        <asp:TextBox ID="txtTitle" runat="server" placeholder="Enter your title"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtitle" ForeColor="Red" ControlToValidate="txtTitle" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Title" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrTitle" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Email</span>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your email" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrEmail" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Phone Number</span>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10" TextMode="Number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqPhoneNumer" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your phone number" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrPhone" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">State</span>
                        <asp:DropDownList ID="drpState" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblErrState" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">City</span>
                        <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblErrCity" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Banner</span>
                        <asp:FileUpload ID="Bannerfileupload" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="Bannerfileupload" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please choose image" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblBannerfileupload" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box" style="grid-column: span 2;">
                        <span class="details">Description</span>
                        <asp:TextBox ID="txtDescription" runat="server" placeholder="Enter your Description" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtDescription" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Description" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrDescription" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Amount</span>
                        <asp:TextBox ID="txtAmount" runat="server" placeholder="Enter your Amount" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqAmount" ForeColor="Red" ControlToValidate="txtAmount" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your Amount" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblErrAmount" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Start Date</span>
                        <asp:TextBox ID="txtStartDate" runat="server" MaxLength="16" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqStartDate" ForeColor="Red" ControlToValidate="txtStartDate" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select start date" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblStartDate" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">End Date</span>
                        <asp:TextBox ID="txtEndDate" runat="server" MaxLength="16" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqdEndDate" ForeColor="Red" ControlToValidate="txtEndDate" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select end date" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label1" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                    <div class="input-box">
                        <span class="details">Status</span>
                        <asp:TextBox ID="txtStatus" runat="server" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqd" ForeColor="Red" ControlToValidate="txtStatus" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select status" CssClass="validation-error"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblStatus" runat="server" CssClass="validation-error"></asp:Label>
                    </div>
                </div>
                <div class="button">
                    <asp:Button ID="btnSubmit" runat="server" Text="Create Campaign" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" CssClass="validation-error"></asp:Label>
                </div> 
            </div>
        </div>
    </div>
</asp:Content>


