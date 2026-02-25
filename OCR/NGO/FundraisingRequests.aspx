<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="FundraisingRequests.aspx.cs" Inherits="OCR.NGO.FundraisingRequests" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /* styles.css */
        .form-control {
            border-bottom: 2px solid #eee !important;
            border: none;
            font-weight: 600
        }

            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #8bbafe;
                outline: 0;
                box-shadow: none;
                border-radius: 0px;
                border-bottom: 2px solid blue !important;
            }



        .inputbox {
            position: relative;
            margin-bottom: 20px;
            width: 100%
        }

            .inputbox span {
                position: absolute;
                top: 7px;
                left: 11px;
                transition: 0.5s
            }

            .inputbox i {
                position: absolute;
                top: 13px;
                right: 8px;
                transition: 0.5s;
                color: #3F51B5
            }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0
        }

        .inputbox input:focus ~ span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }

        .inputbox input:valid ~ span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }

        .card-blue {
            background-color: #492bc4;
        }

        .hightlight {
            background-color: #5737d9;
            padding: 10px;
            border-radius: 10px;
            margin-top: 15px;
            font-size: 14px;
        }

        .yellow {
            color: #fdcc49;
        }

        .decoration {
            text-decoration: none;
            font-size: 14px;
        }

        .btn-success {
            color: #fff;
            background-color: #492bc4;
            border-color: #492bc4;
        }

            .btn-success:hover {
                color: #fff;
                background-color: #492bc4;
                border-color: #492bc4;
            }


        .decoration:hover {
            text-decoration: none;
            color: #fdcc49;
        }

        .container {
            height: 100vh;
        }

        /* Footer Styles */
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: #fff;
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 px-5" style="margin-top: 50px;">
        <div class="mb-4">
            <h3>Request for Funds</h3>
        
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="card p-3">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">NGO Name</label>
                                <input type="text" id="txtname" name="name" runat="server" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Email</label>
                                <input type="text" id="txtemail" name="email" runat="server" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Phone</label>
                                <input type="text" id="txtphone" name="phone" runat="server" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">End Date of Fund</label>
                                <input type="date" id="txtEndDate" name="name" runat="server" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Address</label>
                                <textarea id="txtaddress" name="address" runat="server" class="form-control" rows="4" required="required"></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Type of Cause</label>
                                <asp:DropDownList ID="ddlCause" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select a Cause" Value=""></asp:ListItem>
                                    <asp:ListItem Text="Elder Care" Value="ElderCare"></asp:ListItem>
                                    <asp:ListItem Text="Mobile Healthcare" Value="Mobile Healthcare"></asp:ListItem>
                                    <asp:ListItem Text="Physiocare" Value="Physiocare"></asp:ListItem>
                                    <asp:ListItem Text="Cataract Surgeries" Value="CataractSurgeries"></asp:ListItem>
                                    <asp:ListItem Text="Cancer Care" Value="CancerCare"></asp:ListItem>
                                    <asp:ListItem Text="Child Education" Value="ChildEducation"></asp:ListItem>
                                    <asp:ListItem Text="Organ Donation" Value="OrganDonation"></asp:ListItem>
                                    <asp:ListItem Text="Clothe Education" Value="ClotheEducation"></asp:ListItem>
                                </asp:DropDownList>
                                <%--<input type="text" id="txtCause" name="Cause" runat="server" class="form-control" required="required" />--%>
                            <%--</div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Required Amount</label>
                                <input type="number" id="txtDonationAmount" name="donation" runat="server" class="form-control" rows="4" required="required" />

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Fund Collected</label>
                                <input type="number" id="txtFundCollected" name="fund" runat="server" class="form-control" rows="4" required="required" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Details</label>
                                <input id="txtDetails" name="Details" runat="server" class="form-control" rows="4" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="inputbox mt-3 mr-2">
                                <label class="form-control">Photo</label>
                                <input type="file" id="idPhoto" runat="server" name="idPhoto" accept="image/*" required class="form-control"><br>
                            </div>
                        </div>
                        <div class="mt-4 mb-4 d-flex justify-content-between">
                            <asp:Button ID="btnAddRequests" runat="server" Text="Add Request" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Submit button -->

    </div>

</asp:Content>--%>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for fundraising request page - no TailwindCSS conflicts */
        .fundraising-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .fundraising-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .fundraising-page .slide-in { animation: slideIn 0.5s ease-out; }
        .fundraising-page .pulse-animation { animation: pulse 2s infinite; }
        
        .fundraising-page .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .fundraising-page .header-section {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #492bc4;
        }
        
        .fundraising-page .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: #492bc4;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .fundraising-page .page-title i {
            font-size: 1.8rem;
        }
        
        .fundraising-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            overflow: hidden;
        }
        
        .fundraising-page .form-group {
            margin-bottom: 25px;
        }
        
        .fundraising-page .form-label {
            font-weight: 600;
            color: #4a5568;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
            display: block;
        }
        
        .fundraising-page .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f8fafc;
            color: #2d3748;
            font-weight: 500;
        }
        
        .fundraising-page .form-control:focus {
            outline: none;
            border-color: #492bc4;
            box-shadow: 0 0 0 3px rgba(73, 43, 196, 0.1);
            background: white;
        }
        
        .fundraising-page .form-control:hover {
            border-color: #cbd5e0;
            background: white;
        }
        
        .fundraising-page textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }
        
        .fundraising-page .btn-submit {
            background: linear-gradient(135deg, #492bc4, #5737d9);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(73, 43, 196, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: relative;
            display: inline-block;
        }
        
        .fundraising-page .btn-submit::before {
            content: '\f067';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 14px;
        }
        
        .fundraising-page .btn-submit {
            padding-left: 50px;
        }
        
        .fundraising-page .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(73, 43, 196, 0.4);
        }
        
        .fundraising-page .file-upload-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }
        
        .fundraising-page .file-upload-wrapper input[type=file] {
            position: absolute;
            left: -9999px;
        }
        
        .fundraising-page .file-upload-label {
            display: block;
            padding: 12px 16px;
            border: 2px dashed #cbd5e0;
            border-radius: 10px;
            background: #f8fafc;
            color: #4a5568;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            font-weight: 500;
        }
        
        .fundraising-page .file-upload-label:hover {
            border-color: #492bc4;
            background: white;
            color: #492bc4;
        }
        
        .fundraising-page .file-upload-label i {
            margin-right: 8px;
        }
        
        @media (max-width: 768px) {
            .fundraising-page .container {
                padding: 0 15px;
            }
            
            .fundraising-page .header-section {
                padding: 20px;
            }
            
            .fundraising-page .page-title {
                font-size: 1.5rem;
            }
            
            .fundraising-page .form-card {
                padding: 20px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fundraising-page">
        <div class="container">
            <!-- Header Section -->
            <div class="header-section fade-in">
                <h3 class="page-title">
                    <i class="fas fa-hand-holding-usd"></i>
                    Request for Funds
                </h3>
            </div>

            <!-- Form Section -->
            <div class="form-card slide-in">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">NGO Name</label>
                            <input type="text" id="txtname" name="name" runat="server" class="form-control" required="required" placeholder="Enter NGO name">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <input type="text" id="txtemail" name="email" runat="server" class="form-control" required="required" placeholder="Enter email address">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Phone</label>
                            <input type="text" id="txtphone" name="phone" runat="server" class="form-control" required="required" placeholder="Enter phone number">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">End Date of Fund</label>
                            <input type="date" id="txtEndDate" name="name" runat="server" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Address</label>
                            <textarea id="txtaddress" name="address" runat="server" class="form-control" rows="4" required="required" placeholder="Enter complete address"></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Type of Cause</label>
                            <asp:DropDownList ID="ddlCause" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select a Cause" Value=""></asp:ListItem>
                                <asp:ListItem Text="Elder Care" Value="ElderCare"></asp:ListItem>
                                <asp:ListItem Text="Mobile Healthcare" Value="Mobile Healthcare"></asp:ListItem>
                                <asp:ListItem Text="Physiocare" Value="Physiocare"></asp:ListItem>
                                <asp:ListItem Text="Cataract Surgeries" Value="CataractSurgeries"></asp:ListItem>
                                <asp:ListItem Text="Cancer Care" Value="CancerCare"></asp:ListItem>
                                <asp:ListItem Text="Child Education" Value="ChildEducation"></asp:ListItem>
                                <asp:ListItem Text="Organ Donation" Value="OrganDonation"></asp:ListItem>
                                <asp:ListItem Text="Clothe Education" Value="ClotheEducation"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Required Amount</label>
                            <input type="number" id="txtDonationAmount" name="donation" runat="server" class="form-control" required="required" placeholder="Enter required amount">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Fund Collected</label>
                            <input type="number" id="txtFundCollected" name="fund" runat="server" class="form-control" required="required" placeholder="Enter fund collected">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Details</label>
                            <input id="txtDetails" name="Details" runat="server" class="form-control" placeholder="Enter additional details" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Photo</label>
                            <div class="file-upload-wrapper">
                                <input type="file" id="idPhoto" runat="server" name="idPhoto" accept="image/*" required>
                                <label for="<%= idPhoto.ClientID %>" class="file-upload-label">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                    Choose Photo or Drag Here
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="text-center mt-4">
                            <asp:Button ID="btnAddRequests" runat="server" 
                                Text="Add Request" 
                                OnClick="btnSubmit_Click" 
                                CssClass="btn-submit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


