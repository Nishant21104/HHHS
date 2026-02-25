<%@ Page Title="" Language="C#" MasterPageFile="~/FundRaiser/Login.Master" AutoEventWireup="true" CodeBehind="FundRegistration.aspx.cs" Inherits="OCR.FundRaiser.FundRegistration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
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

    <div class="container1" style="margin: auto; width: 50%; padding: 10px; margin-top: 6%; margin-bottom: 05%; height: 690px; border-style: groove;">
        <div class="title">Be a part of us, Register Here !..</div>
        <div class="content">
            <div class="user-details" style="height: 500px;">
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Full Name</span>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqName" ForeColor="Red" ControlToValidate="txtName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrName" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your name" required>--%>
                </div>
                <div class="input-box" style="height: 75px; margin-bottom: 0px;">
                    <span class="details">Username</span>
                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter your username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqUserName" ForeColor="Red" ControlToValidate="txtUserName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your username"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrUsername" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your username" required>--%>
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
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPhoneNumer" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your phone number"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPhone" runat="server"></asp:Label>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>  

                </div>
                <div class="input-box" style="height: 60px; margin-bottom: 0px;">
                    <span class="details">State</span>
                    <asp:DropDownList ID="drpState" runat="server" CssClass="form-control" OnSelectedIndexChanged="drpState_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Select State" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrState" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your email" required>--%>
                </div>
                <div class="input-box" style="height: 60px; margin-bottom: 0px;">
                    <span class="details">City</span>
                    <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select City" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblErrCity" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your number" required>--%>
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Pincode</span>
                    <asp:TextBox ID="txtPincode" runat="server" placeholder="Enter your pin code" MaxLength="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtPincode" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your pincode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPincode" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your email" required>--%>
                </div>
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Address</span>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" MaxLength="1000" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtAddress" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your address"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrAddress" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your number" required>--%>
                </div> 
                <div class="input-box" style="height: 100px; margin-bottom: 0px;">
                    <span class="details">Photo</span>
                    <asp:FileUpload ID="fpuFundRaiser" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="fpuFundRaiser" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please choose your photo"></asp:RequiredFieldValidator>
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Password</span>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqPass" ForeColor="Red" ControlToValidate="txtPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblErrPassword" runat="server"></asp:Label>
                    <%--<input type="text" placeholder="Enter your password" required>--%>
                </div>
                <div class="input-box" style="height: 70px; margin-bottom: 0px;">
                    <span class="details">Confirm Password</span>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" placeholder="Confirm your password" MaxLength="16" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqConfirmPass" ForeColor="Red" ControlToValidate="txtConfirmPassword" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter confirm your password"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblConfirmPassword" runat="server"></asp:Label>
                    <asp:CompareValidator ID="cmpValidator" ForeColor="Red" runat="server" ValidationGroup="RegisterValidate" ErrorMessage="Password and Confirm Password should be same" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                    <%--<input type="text" placeholder="Confirm your password" required>--%>
                </div>
            </div>
          <%--  <div class="gender-details" style="margin-top: 0%;">

                <span class="gender-title">Gender</span>
                <div class="category">

                    <asp:RadioButton CssClass="gender" ID="rdbMale" runat="server" Text="Male" Style="display: inherit" />
                    <asp:RadioButton CssClass="gender" ID="rdbFemale" Text="Female" runat="server" Style="display: inherit" />
                    <asp:RadioButton CssClass="gender" ID="rdbOther" Text="Others" runat="server" Style="display: inherit" />
                    <asp:Label ID="lblErrGender" runat="server"></asp:Label>
                </div>
            </div>--%>
            <div class="button">
                <asp:Button ID="btnSubmit" runat="server" Text="Register" OnClick="btnSubmit_Click" OnClientClick="Validation();" ValidationGroup="RegisterValidate" />
                   <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red"></asp:Label>
                 
                <%--<input type="submit" value="Register">--%>
            </div>
        </div>
    </div>

</asp:Content>
