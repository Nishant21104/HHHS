<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Inherits="OCR.Donor.MakeAppointment" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        form1 {
            max-width: 300px;
            margin: 10px auto;
            padding: 10px 20px;
            background: #f4f7f8;
            border-radius: 8px;
        }



        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="datetime"],
        input[type="email"],
        input[type="number"],
        input[type="search"],
        input[type="tel"],
        input[type="time"],
        input[type="url"],
        textarea,
        select {
            background: rgba(255,255,255,0.1);
            border: none;
            font-size: 16px;
            height: auto;
            margin: auto;
            outline: 0;
            padding: 8px;
            width: 100%;
            background-color: #e8eeef;
            color: black;
            box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
            margin-bottom: 30px;
        }

        input[type="radio"],
        input[type="checkbox"] {
            margin: 0 4px 8px 0;
        }

        select {
            padding: 6px;
            height: 32px;
            border-radius: 2px;
        }

        button {
            padding: 19px 39px 18px 39px;
            color: #FFF;
            background-color: #4bc970;
            font-size: 18px;
            text-align: center;
            font-style: normal;
            border-radius: 5px;
            width: 100%;
            border: 1px solid #3ac162;
            border-width: 1px 1px 3px;
            box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
            margin-bottom: 10px;
        }

        fieldset {
            margin-bottom: 30px;
            border: none;
        }

        legend {
            font-size: 1.4em;
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

            label.light {
                font-weight: 300;
                display: inline;
            }

        .number {
            background-color: #5fcf80;
            color: #fff;
            height: 30px;
            width: 30px;
            display: inline-block;
            font-size: 0.8em;
            margin-right: 4px;
            line-height: 30px;
            text-align: center;
            text-shadow: 0 1px 0 rgba(255,255,255,0.2);
            border-radius: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
        <div id="container" style="margin: auto; width: 50%; border: 3px solid green; padding: 10px; margin-top: 1%; margin-bottom: 1%;">

            <div id="body_header">
            
                <h2>Make your appointments here !</h2>


            </div>
            <fieldset>
                <legend><span class="number">1</span>Your basic details</legend>
                <label for="name" id="lblName" runat="server">Name*</label>
                <input type="text" id="txtName" runat="server" name="user_name" placeholder="Name" required pattern="[a-zA-Z0-9]+" />

                <label for="mail">Email*</label>
                <input type="email" id="txtEmail" runat="server" name="user_email" placeholder="abc@xyz.com" required>
                <label for="tel">Mobile Number*</label>
                <input type="tel" id="txtMobile" runat="server" placeholder="Enter your mobile number" name="user_num">
            </fieldset>

            <fieldset>
                <legend><span class="number">2</span>Appointment Details</legend>
                <label for="appointment_description">Appointment With?</label>
                <asp:DropDownList ID="ddlTypeOfUser" runat="server" Width="100%" CssClass="form-control" OnSelectedIndexChanged="ddlTypeOfUser_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                    <asp:ListItem Value="NGO" Text="NGO"></asp:ListItem>
                    <asp:ListItem Value="Fundraiser" Text="Fundraiser"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlNGO" runat="server" Visible="false" Width="100%" CssClass="form-control">
                </asp:DropDownList>
                <asp:DropDownList ID="ddlFundRaiser" runat="server" Visible="false" Width="100%" CssClass="form-control">
                </asp:DropDownList>
                <label for="appointment_description">Appointment Description:</label>
                <textarea id="txtAppointmentDesc" runat="server" name="appointment_description" placeholder="Reason for appointment"></textarea>
                <label for="date">Date:</label>
                <input type="date" id="txtDate" runat="server" name="date" value="" required />
                <label for="time">Time:</label>
                <input type="time" name="time" id="txtTime" runat="server" value="" required />
                <label for="duration" id="rdbMinutes" runat="server">How Long??(Minutes)</label>
                <table>
                    <tr>
                        <td>
                            <input type="radio" id="Minutes1" name="Minutes" value="30"></td>
                        <td>
                            <label for="age1">30</label>
                        </td>
                        <td>
                            <input type="radio" id="Minutes2" name="Minutes" value="60"></td>
                        <td>
                            <label for="age2">60</label></td>
                        <td>
                            <input type="radio" id="Minutes3" name="Minutes" value="90"></td>
                        <td>
                            <label for="age3">90</label></td>
                    </tr>
                </table>
            </fieldset>
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Request For Appointment"></asp:Button>
        </div>

</asp:Content>--%>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Modern CSS for Make Appointment - no TailwindCSS conflicts */
        .appointment-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            padding: 30px;
            position: relative;
        }

            .appointment-page::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.05" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
                background-size: cover;
            }

        #container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
            max-width: 600px;
            margin: 40px auto;
        }

        #body_header {
            text-align: center;
            margin-bottom: 40px;
        }

            #body_header h2 {
                font-size: 32px;
                font-weight: 700;
                color: #1a202c;
                margin: 0;
                background: linear-gradient(135deg, #4bc970, #3ac162);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 12px;
            }

                #body_header h2::before {
                    content: '📅';
                    font-size: 36px;
                    -webkit-text-fill-color: initial;
                }

        fieldset {
            border: none;
            margin-bottom: 40px;
            position: relative;
        }

        legend {
            font-size: 18px;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .number {
            background: linear-gradient(135deg, #4bc970, #3ac162);
            color: white;
            height: 36px;
            width: 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            font-weight: 700;
            border-radius: 50%;
            box-shadow: 0 4px 12px rgba(75, 201, 112, 0.3);
        }

        label {
            display: block;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="time"],
        textarea,
        select {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
            margin-bottom: 20px;
        }

            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="tel"]:focus,
            input[type="date"]:focus,
            input[type="time"]:focus,
            textarea:focus,
            select:focus {
                outline: none;
                border-color: #4bc970;
                background: white;
                box-shadow: 0 0 0 4px rgba(75, 201, 112, 0.1);
            }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
            margin-bottom: 20px;
        }

            .form-control:focus {
                outline: none;
                border-color: #4bc970;
                background: white;
                box-shadow: 0 0 0 4px rgba(75, 201, 112, 0.1);
            }

        /* Ensure DropDownList is visible */
        .form-control {
            display: block !important;
            visibility: visible !important;
            opacity: 1 !important;
            position: relative !important;
            z-index: 10 !important;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .radio-option {
            display: flex;
            align-items: center;
            gap: 8px;
        }

            .radio-option input[type="radio"] {
                width: auto;
                margin: 0;
                transform: scale(1.2);
            }

            .radio-option label {
                margin: 0;
                font-weight: 500;
                text-transform: none;
                color: #2d3748;
                cursor: pointer;
            }

        #btnSubmit {
            background: linear-gradient(135deg, #4bc970, #3ac162);
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            width: 100%;
            box-shadow: 0 4px 15px rgba(75, 201, 112, 0.3);
        }

            #btnSubmit:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(75, 201, 112, 0.4);
            }

            #btnSubmit:active {
                transform: translateY(0);
            }

        /* Responsive Design */
        @media (max-width: 768px) {
            .appointment-page {
                padding: 20px 15px;
            }

            #container {
                padding: 30px 20px;
                margin: 20px auto;
            }

            #body_header h2 {
                font-size: 24px;
            }

            .radio-group {
                flex-direction: column;
                gap: 12px;
            }
        }

        @media (max-width: 480px) {
            #container {
                padding: 20px 15px;
            }

            #body_header h2 {
                font-size: 20px;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"],
            input[type="date"],
            input[type="time"],
            textarea,
            select,
            .form-control {
                padding: 12px 14px;
                font-size: 14px;
            }

            #btnSubmit {
                padding: 14px 24px;
                font-size: 16px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="appointment-page">
        <div id="container">
            <div id="body_header">
                <h2>Make Your Appointment</h2>
            </div>

            <fieldset>
                <legend><span class="number">1</span>Your Basic Details</legend>
                <label for="txtName">Name*</label>
                <input type="text" id="txtName" runat="server" name="user_name" placeholder="Enter your full name" required pattern="[a-zA-Z0-9]+" />

                <label for="txtEmail">Email*</label>
                <input type="email" id="txtEmail" runat="server" name="user_email" placeholder="Enter your email address" required />

                <label for="txtMobile">Mobile Number*</label>
                <input type="tel" id="txtMobile" runat="server" placeholder="Enter your mobile number" name="user_num" />
            </fieldset>

            <fieldset>
                <legend><span class="number">2</span>Appointment Details</legend>
                <label for="ddlTypeOfUser">Appointment With*</label>
                <asp:DropDownList ID="ddlTypeOfUser" runat="server"
                    CssClass="form-control"
                    OnSelectedIndexChanged="ddlTypeOfUser_SelectedIndexChanged"
                    AutoPostBack="true"
                    Width="100%"
                    Height="50px"
                    Font-Size="15px"
                    BackColor="#f8fafc"
                    BorderColor="#e2e8f0"
                    BorderWidth="2px"
                    BorderStyle="Solid">
                    <asp:ListItem Value="0" Text="Select Appointment Type"></asp:ListItem>
                    <asp:ListItem Value="NGO" Text="NGO"></asp:ListItem>
                    <asp:ListItem Value="Fundraiser" Text="Fundraiser"></asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlNGO" runat="server"
                    Visible="false"
                    CssClass="form-control"
                    Width="100%"
                    Height="45px"
                    Font-Size="15px"
                    BackColor="#f8fafc"
                    BorderColor="#e2e8f0"
                    BorderWidth="2px"
                    BorderStyle="Solid">
                </asp:DropDownList>

                <asp:DropDownList ID="ddlFundRaiser" runat="server"
                    Visible="false"
                    CssClass="form-control"
                    Width="100%"
                    Height="45px"
                    Font-Size="15px"
                    BackColor="#f8fafc"
                    BorderColor="#e2e8f0"
                    BorderWidth="2px"
                    BorderStyle="Solid">
                </asp:DropDownList>

                <label for="txtAppointmentDesc">Appointment Description</label>
                <textarea id="txtAppointmentDesc" runat="server" name="appointment_description" placeholder="Please describe the reason for your appointment"></textarea>

                <label for="txtDate">Preferred Date*</label>
                <input type="date" id="txtDate" runat="server" name="date" required />

                <label for="txtTime">Preferred Time*</label>
                <input type="time" id="txtTime" runat="server" name="time" required />

                <label for="rdbMinutes">Duration (Minutes)</label>
                <div class="radio-group">
                    <%--  <div class="radio-option">
                        <input type="radio" id="Minutes1" name="Minutes" value="30" runat="server" />
                        <label for="Minutes1">30 minutes</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="Minutes2" name="Minutes" value="60" runat="server" />
                        <label for="Minutes2">60 minutes</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" id="Minutes3" name="Minutes" value="90" runat="server" />
                        <label for="Minutes3">90 minutes</label>
                    </div>--%>
                    <div class="radio-group">
                        <div class="radio-option">
                            <asp:RadioButton ID="rb30" runat="server" GroupName="Minutes" Text="30 minutes" />
                        </div>
                        <div class="radio-option">
                            <asp:RadioButton ID="rb60" runat="server" GroupName="Minutes" Text="60 minutes" />
                        </div>
                        <div class="radio-option">
                            <asp:RadioButton ID="rb90" runat="server" GroupName="Minutes" Text="90 minutes" />
                        </div>
                    </div>
                </div>

                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Request Appointment" />
            </fieldset>
        </div>
    </div>
</asp:Content>


