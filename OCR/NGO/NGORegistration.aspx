<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/Login.Master" AutoEventWireup="true" CodeBehind="NGORegistration.aspx.cs" Inherits="OCR.NGO.NGORegistration" %>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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
            <div class="user-details">
                <div class="input-box" style="margin-bottom: 0px;">
                    <span class="details">Full NGO Name</span>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrName" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your name" required>--%>
<%--</div>
                  <div class="input-box" style="margin-bottom: 0px;">
                    <span class="details">Name of the Head of the Organisation</span>
                    <asp:TextBox ID="txtHeadOrganization" runat="server" placeholder="Enter Name of the Head of the Organisation"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtHeadOrganization" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Name of the Head of Organisation"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Username</span>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your username"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter user name"></asp:RequiredFieldValidator>
                    
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Email</span>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>  
               </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Phone Number</span>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter phone number"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>  
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">State</span>
                    <asp:DropDownList ID="drpState" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrState" runat="server"></asp:Label>--%>
<%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="drpState" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select State"></asp:RequiredFieldValidator>--%>
<%--  </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">City</span>
                    <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrCity" runat="server"></asp:Label>--%>
<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="drpCity" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select City"></asp:RequiredFieldValidator>--%>
<%--                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Pincode</span>
                    <asp:TextBox ID="txtPincode" runat="server" placeholder="Enter your pin code" MaxLength="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtPincode" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your pincode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPincode" runat="server"></asp:Label>--%>
<%--<input type="text" placeholder="Enter your email" required>--%>
<%--    </div>
                <div class="input-box" style="margin-bottom: 0px;">
                    <span class="details">Address</span>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" MaxLength="1000" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your address"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrAddress" runat="server"></asp:Label>--%>
<%--<input type="text" placeholder="Enter your number" required>--%>
<%--       </div>
                 <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Proof of identication</span>
                    <asp:FileUpload ID="fpuProofOfIdentification" runat="server"/>
                    <asp:RequiredFieldValidator ID="rqdfpuProofOfIdentification" ForeColor="Red" ControlToValidate="fpuProofOfIdentification" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select Proof Of Identification"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblProofOfIdentification" runat="server"></asp:Label>
--%>           <%--<input type="text" placeholder="Enter your number" required>--%>
<%--                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Copy of objectives</span>
                    <asp:FileUpload ID="fpuCopyofobjectives" runat="server"/>
                    <asp:RequiredFieldValidator ID="rqdfpuCopyofobjectives" ForeColor="Red" ControlToValidate="fpuCopyofobjectives" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select Copy of objectives"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCopyofobjectives" runat="server"></asp:Label>--%>
<%--<input type="text" placeholder="Enter your number" required>--%>
<%--   </div>
                <div class="input-box" style="margin-bottom: 0px;">
                    <span class="details">Unique Reg. Id</span>
                     <asp:TextBox ID="txtUniqueRegId" runat="server" placeholder="Enter your Unique Reg. Id" MaxLength="15"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ControlToValidate="txtUniqueRegId" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Unique Reg. Id"></asp:RequiredFieldValidator>
                    
                </div>

                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Password</span>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPass" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPassword" runat="server"></asp:Label>--%>
<%--<input type="text" placeholder="Enter your password" required>--%>
<%--</div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Confirm Password</span>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqConfirmPass" ForeColor="Red" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter confirm your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblConfirmPassword" runat="server"></asp:Label>
                    <asp:CompareValidator ID="cmpValidator" ForeColor="Red" runat="server" ValidationGroup="RegisterValidate" ErrorMessage="Password and Confirm Password should be same" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
--%>  <%--<input type="text" placeholder="Confirm your password" required>--%>
<%--   </div>
            </div>
            <div class="button" style="margin-top:85px;text-align-last: center;">
                <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                   <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                  <asp:Button ID="btnBack" runat="server" Text="Back to Login" OnClick="btnBack_Click" />
              
            </div>
        </div>
    </div>

</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

        body {
            font-family: "Poppins", Arial, sans-serif;
            background: #f4f7fb;
            margin: 0;
            padding: 0;
        }

        .container1 {
            margin: 28px auto;
            max-width: 960px;
            width: 100%;
            background: #fff;
            padding: 22px;
            border-radius: 8px;
            box-shadow: 0 8px 26px rgba(18,30,47,0.06);
        }

        .title {
            font-size: 20px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 12px;
            color: #222;
        }

        .content .user-details {
            display: flex;
            flex-wrap: wrap;
            gap: 18px 28px;
            margin: 12px 0 6px 0;
        }

        .user-details .input-box {
            width: calc(50% - 14px);
            min-width: 220px;
        }

        .input-box span.details {
            display: block;
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
        }

        .user-details .input-box input[type="text"],
        .user-details .input-box input[type="email"],
        .user-details .input-box input[type="password"],
        .user-details .input-box input[type="tel"],
        .user-details .input-box select,
        .user-details .input-box textarea {
            width: 100%;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #e6e9ee;
            padding: 10px 14px;
            box-sizing: border-box;
            background: #fff;
            transition: box-shadow .15s ease, border-color .15s ease;
        }

        .user-details .input-box textarea {
            min-height: 88px;
            resize: vertical;
            padding-top: 10px;
            padding-bottom: 10px;
        }

            .user-details .input-box input:focus,
            .user-details .input-box select:focus,
            .user-details .input-box textarea:focus {
                outline: none;
                border-color: #f85a40;
                box-shadow: 0 8px 20px rgba(248,90,64,0.06);
            }

        /* wrapper for icon + element */
        .input-wrapper {
            position: relative;
            width: 100%;
        }

        .icon-svg {
            position: absolute;
            left: 12px;
            top: 43%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            pointer-events: none;
        }

        .icon-svg2 {
            position: absolute;
            left: 12px;
            top: 24%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            pointer-events: none;
        }

        .input-with-icon {
            padding-left: 44px !important;
            height: 44px;
            display: block;
            width: 100%;
            box-sizing: border-box;
            border-radius: 8px;
            border: 1px solid #e6e9ee;
            font-size: 15px;
            background: #fff;
        }

        .user-details .input-box select.input-with-icon {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            padding-left: 44px !important;
            background-image: none;
        }

        .user-details .input-box textarea.input-with-icon {
            min-height: 88px;
            padding-top: 12px;
        }

        /* file */
        .file-input-wrapper {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 12px;
            height: 44px;
            border-radius: 8px;
            border: 1px solid #e6e9ee;
            background: #fff;
            box-sizing: border-box;
        }

            .file-input-wrapper input[type=file] {
                cursor: pointer;
                z-index: 3;
                background: transparent;
            }

            .file-input-wrapper .file-name {
                color: #6f6f6f;
                font-size: 13px;
            }

        .form-grid {
            row-gap: 10px !important; /* ↓ smaller gap (default ~22px) */
        }

        /* Reduce inside spacing within each input-box */
        .input-box {
            margin-bottom: -16px !important; /* exact spacing you want */
        }

        /* Remove default extra spacing from dropdowns, textarea, etc. */
        .input-wrapper,
        .input-with-icon,
        textarea.input-with-icon,
        select.input-with-icon {
            margin: 0 !important;
        }

        /* buttons */
        .button-row {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 24px;
        }

        .btn-primary {
            background: linear-gradient(90deg,#f85a40,#ff7a55);
            color: #fff;
            border: none;
            padding: 12px 34px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 16px;
            box-shadow: 0 12px 28px rgba(248,90,64,0.12);
        }

        .btn-outline {
            background: #fff;
            border: 1px solid #f0f0f0;
            color: #f85a40;
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 16px;
        }

        .validator {
            color: #d9534f;
            font-size: 12px;
            margin-top: 6px;
            display: block;
        }
        .alignm{
            margin-top:-19px;
        }
        @media (max-width:760px) {
            .user-details .input-box {
                width: 100%;
            }

            .container1 {
                padding: 16px;
            }
        }
    </style>

    <script>Y</script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 30px auto; max-width: 760px;">
        <div class="container1">
            <div class="title">Be a part of us, Register Here !</div>

            <div class="content">
                <div class="user-details">

                    <!-- Full NGO Name -->
                    <div class="input-box">
                        <span class="details">Full NGO Name</span>
                        <div class="input-wrapper">
                            <!-- building icon (inline SVG) -->
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M3 22h18v-2H3v2zM7 18h2v-2H7v2zm0-4h2v-2H7v2zm6 4h2v-2h-2v2zm0-4h2v-2h-2v2zM5 2v18h14V2H5zm2 2h10v14H7V4z" />
                                </svg>
                            </span>
                            <asp:TextBox ID="txtName" runat="server" CssClass="input-with-icon" placeholder="Enter your name"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" CssClass="validator" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Head of Organisation -->
                    <div class="input-box">
                        <span class="details">Name of the Head of the Organisation</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-6 8v-1c0-2.21 3.13-4 6-4s6 1.79 6 4v1H6z" />
                                </svg>
                            </span>
                            <asp:TextBox ID="txtHeadOrganization" runat="server" CssClass="input-with-icon" placeholder="Name of the Head of the Organisation"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" CssClass="validator" ControlToValidate="txtHeadOrganization" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Name of the Head of Organisation"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Username -->
                    <div class="input-box">
                        <span class="details">Username</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 1.6c-3.2 0-9.6 1.6-9.6 4.8v1.6h19.2v-1.6c0-3.2-6.4-4.8-9.6-4.8z" />
                                </svg></span>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="input-with-icon" placeholder="Enter your username"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" CssClass="validator" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter user name"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Email -->
                    <div class="input-box">
                        <span class="details">Email</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5L4 8V6l8 5 8-5v2z" />
                                </svg></span>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-with-icon" placeholder="Enter your email"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" CssClass="validator" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>

                    <!-- Phone Number -->
                   
                    <div class="input-box">
                         <div class="alignm">
                        <span class="details">Phone Number</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6.6 10.8c1.6 3.2 3.9 5.5 7.1 7.1l2.2-2.2c.3-.3.8-.4 1.2-.3 1.3.3 2.7.5 4.1.5.6 0 1 .4 1 1v3.9c0 .6-.4 1-1 1C10 22 2 14 2 3.5 2 2.9 2.4 2.5 3 2.5H6.9c.6 0 1 .4 1 1 0 1.4.2 2.8.5 4.1.1.4 0 .9-.3 1.2L6.6 10.8z" />
                                </svg></span>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="input-with-icon" placeholder="Enter your number" MaxLength="10"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" CssClass="validator" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter phone number"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                    </div>
                    </div>
                    <!-- State -->
                    <div class="input-box">
                    <div class="alignm">

                        <span class="details">State</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 2L2 7v13h20V7L12 2zM7 20H5v-2h2v2zm0-4H5v-2h2v2zM19 20h-2v-2h2v2z" />
                                </svg></span>
                            <asp:DropDownList ID="drpState" runat="server" CssClass="input-with-icon" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Label ID="lblErrState" runat="server"></asp:Label>
                    </div>
                    </div>

                    <!-- City -->
                    <div class="input-box">
                        <div class="alignm">
                        <span class="details">City</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 2L2 7v13h20V7L12 2zM7 20H5v-2h2v2zm0-4H5v-2h2v2zM19 20h-2v-2h2v2z" />
                                </svg></span>
                            <asp:DropDownList ID="drpCity" runat="server" CssClass="input-with-icon">
                                <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                        </div>

                    <!-- Address -->
                    <div class="input-box">
                        <div class="alignm">
                        <span class="details">Address</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 2C8.1 2 5 5.1 5 9c0 6.2 7 13 7 13s7-6.8 7-13c0-3.9-3.1-7-7-7zM12 11.5c-1.4 0-2.5-1.1-2.5-2.5S10.6 6.5 12 6.5s2.5 1.1 2.5 2.5S13.4 11.5 12 11.5z" />
                                </svg></span>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="input-with-icon" placeholder="Enter your address"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" CssClass="validator" ControlToValidate="txtAddress" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your address"></asp:RequiredFieldValidator>
                    </div>
                        </div>
                    <div class="input-box">
                        <span class="details">Pincode</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 2C8.1 2 5 5.1 5 9c0 6.2 7 13 7 13s7-6.8 7-13c0-3.9-3.1-7-7-7zM12 11.5c-1.4 0-2.5-1.1-2.5-2.5S10.6 6.5 12 6.5s2.5 1.1 2.5 2.5S13.4 11.5 12 11.5z" />
                                </svg></span>
                            <asp:TextBox ID="txtPincode" runat="server" CssClass="input-with-icon" placeholder="Enter pin code" MaxLength="6"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" CssClass="validator" ControlToValidate="txtPincode" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your pincode"></asp:RequiredFieldValidator>
                    </div>
                    <!-- Proof of identification -->
                    <div class="input-box">
                        <span class="details">Proof of identification</span>
                        <label class="file-input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M3 5h18v14H3V5zm3 3h4v2H6V8zm0 4h8v2H6v-2zm12 3h-2v-2h2v2z" />
                                </svg></span>
                            <asp:FileUpload ID="fpuProofOfIdentification" runat="server" />
                        </label>
                        <asp:RequiredFieldValidator ID="rqdfpuProofOfIdentification" ForeColor="Red" CssClass="validator" ControlToValidate="fpuProofOfIdentification" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select Proof Of Identification"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Copy of objectives -->
                    <div class="input-box">
                        <span class="details">Copy of objectives</span>
                        <label class="file-input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M14 2H6c-1.1 0-2 .9-2 2v16l4-2h8c1.1 0 2-.9 2-2V8l-4-6z" />
                                </svg></span>
                            <asp:FileUpload ID="fpuCopyofobjectives" runat="server" />
                        </label>
                        <asp:RequiredFieldValidator ID="rqdfpuCopyofobjectives" ForeColor="Red" CssClass="validator" ControlToValidate="fpuCopyofobjectives" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please select Copy of objectives"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Unique Reg. Id -->
                    <div class="input-box">
                        <span class="details">Unique Reg. Id</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6 2h12v4H6V2zm0 6h12v12H6V8zm6 2a2 2 0 110 4 2 2 0 010-4z" />
                                </svg></span>
                            <asp:TextBox ID="txtUniqueRegId" runat="server" CssClass="input-with-icon" placeholder="Enter your Unique Reg. Id" MaxLength="15"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" CssClass="validator" ControlToValidate="txtUniqueRegId" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Unique Reg. Id"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Password -->
                    <div class="input-box">
                        <span class="details">Password</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 8V7a5 5 0 00-10 0v1H5v12h14V8h-2zM9 7a3 3 0 016 0v1H9V7z" />
                                </svg></span>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-with-icon" placeholder="Enter your password" TextMode="Password" MaxLength="16"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="reqPass" ForeColor="Red" CssClass="validator" ControlToValidate="txtPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Confirm Password -->
                    <div class="input-box">
                        <span class="details">Confirm Password</span>
                        <div class="input-wrapper">
                            <span class="icon-svg" aria-hidden="true">
                                <svg viewBox="0 0 24 24" width="18" height="18" fill="#9aa3ae" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M17 8V7a5 5 0 00-10 0v1H5v12h14V8h-2zM9 7a3 3 0 016 0v1H9V7z" />
                                </svg></span>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-with-icon" placeholder="Confirm your password" TextMode="Password" MaxLength="16"></asp:TextBox>
                        </div>
                        <asp:CompareValidator ID="cmpValidator" ForeColor="Red" CssClass="validator" runat="server" ValidationGroup="RegisterValidate" ErrorMessage="Password and Confirm Password should be same" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                    </div>

                </div>

                <div class="button-row">
                    <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" CssClass="btn-primary" ValidationGroup="RegisterValidate" />
                    <asp:Button ID="btnBack" runat="server" Text="Back to Login" OnClick="btnBack_Click" CssClass="btn-outline" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
