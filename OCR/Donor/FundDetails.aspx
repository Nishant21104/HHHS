<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="FundDetails.aspx.cs" Inherits="OCR.Donor.FundDetails" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        html {
            font-size: 14pt;
        }

        body {
            margin: 0;
            padding: 0;
        }

        main {
            width: 90%;
            margin: 1rem auto;
            padding: 0;
        }

        @media screen and (max-width: 900px) {
            main {
                width: 95%;
            }
        }

        .title {
            margin: 0;
            border: none;
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            padding: 0;
            border: none;
        }

            .cards div {
                flex: 1 30%;
            }

        .card {
            display: flex;
            flex-direction: column;
            margin: 0.5rem;
            background-color: #fff;
            border: 1px solid grey;
            border-radius: 5px;
            box-shadow: 0px 10px 15px 0 rgba(0, 0, 0, 0.3);
        }

        .card-image {
            margin: 0;
        }

            .card-image img {
                max-width: 100%;
                border-radius: 3px 3px 0 0;
            }

        .card-text {
            justify-self: flex-start;
            margin: 0;
            padding: 1rem;
        }

        .card-inner {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin: 0;
            padding: 1rem;
        }

        button {
            padding: 10px 20px;
            font-size: 0.85rem;
            color: white;
            background-image: radial-gradient(circle, #cc8400, #c20000);
            background-size: 400% 100%;
            background-position: top right;
            border: none;
            border-radius: 5px;
            transition: all 0.4s ease-in-out;
        }

            button:hover {
                background-image: radial-gradient(circle, #cc8400, #c20000);
                background-position: center;
                cursor: pointer;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
    <%--<form id="frmFundDetails" runat="server">--%>
<%--         <div class="pd-wrap">
            <div class="container">
                <div class="heading-section" style="margin-bottom: 6%;text-align: -webkit-center;margin-top: 2%;">
                    <h2>Fundraiser Details</h2>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <div id="slider">
                            <div class="item">
                                <asp:Image ID="Image1" runat="server" Style="width: -webkit-fill-available;" />
                            </div>
                            <div class="product-price-discount">
                                <h2 id="fundRaiserName" runat="server"></h2>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-7">
                        <table id="tbl1" runat="server" style="width: 100%;">
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Fund Required For</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label id="h1TypeofDonation" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Amount Needed</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="fundAmount" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Description</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="p1Para" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Phone Number</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblPhoneNumber" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Email</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblEmail" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Address</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblAddress" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%;padding-bottom: 15px;">
                                    <label>Approval Status to Raise Fund</label></td>
                                <td style="width: 70%;padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblApprovedByAdmin" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-bottom: 15px;">
                                    <label>End Date of Fund</label></td>
                                <td style="padding-bottom: 15px;">
                                    <label class="form-control-label" id="validTill" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   <asp:Button ID="btnDonateNow" runat="server" OnClick="btnDonateNow_Click" CssClass="btn btn-primary btn-sm"  Text="Donate Now"/> 
                                </td>

                            </tr>
                        </table>

                    </div>
                </div>
            </div>
        </div>--%>
    <%--</form>--%>
<%--</asp:Content>--%>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for fund details page - no TailwindCSS conflicts */
        .fund-details-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .fund-details-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .fund-details-page .slide-in { animation: slideIn 0.5s ease-out; }
        .fund-details-page .pulse-animation { animation: pulse 2s infinite; }
        
        .fund-details-page .details-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .fund-details-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .fund-details-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .fund-details-page .form-body {
            padding: 30px;
        }
        
        .fund-details-page .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-top: 30px;
        }
        
        .fund-details-page .image-section {
            position: relative;
        }
        
        .fund-details-page .fund-image {
            width: 100%;
            height: 450px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .fund-details-page .fund-name-overlay {
            position: absolute;
            bottom: 180px;
            left: 20px;
            right: 20px;
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            backdrop-filter: blur(10px);
        }
        
        .fund-details-page .fund-name-overlay h2 {
            margin: 0;
            font-size: 24px;
            font-weight: 600;
        }
        
        .fund-details-page .info-section {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .fund-details-page .info-item {
            display: flex;
            align-items: flex-start;
            padding: 15px;
            background: #f8fafc;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }
        
        .fund-details-page .info-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }
        
        .fund-details-page .info-content {
            flex: 1;
        }
        
        .fund-details-page .info-label {
            font-weight: 600;
            color: #4a5568;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 5px;
        }
        
        .fund-details-page .info-value {
            color: #2d3748;
            font-size: 16px;
            line-height: 1.5;
        }
        
        .fund-details-page .donate-section {
            margin-top: 30px;
            text-align: center;
        }
        
        .fund-details-page .donate-btn {
            background: linear-gradient(135deg, #f59e0b, #ef4444);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 50px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3);
        }
        
        .fund-details-page .donate-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.4);
        }
        
        .fund-details-page .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
        }
        
        .fund-details-page .status-approved {
            background: #d1fae5;
            color: #065f46;
        }
        
        .fund-details-page .status-pending {
            background: #fef3c7;
            color: #92400e;
        }
        
        .fund-details-page .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .fund-details-page .text-center {
            text-align: center;
        }
        
        .fund-details-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .fund-details-page .mb-4 {
            margin-bottom: 16px;
        }
        
        .fund-details-page .inline-flex {
            display: inline-flex;
        }
        
        .fund-details-page .items-center {
            align-items: center;
        }
        
        .fund-details-page .justify-center {
            justify-content: center;
        }
        
        .fund-details-page .w-16 {
            width: 64px;
        }
        
        .fund-details-page .h-16 {
            height: 64px;
        }
        
        .fund-details-page .rounded-full {
            border-radius: 50%;
        }
        
        .fund-details-page .text-3xl {
            font-size: 30px;
        }
        
        .fund-details-page .font-bold {
            font-weight: 700;
        }
        
        .fund-details-page .text-gray-800 {
            color: #2d3748;
        }
        
        .fund-details-page .text-gray-600 {
            color: #4a5568;
        }
        
        .fund-details-page .text-white {
            color: white;
        }
        
        .fund-details-page .text-2xl {
            font-size: 24px;
        }
        
        .fund-details-page .mr-2 {
            margin-right: 8px;
        }
        
        .fund-details-page .mr-4 {
            margin-right: 16px;
        }
        
        .fund-details-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .fund-details-page .details-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .fund-details-page .details-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .fund-details-page .fund-image {
                height: 250px;
            }
            
            .fund-details-page .fund-name-overlay h2 {
                font-size: 18px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fund-details-page">
        <div class="details-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-4">
                        <i class="fas fa-hand-holding-usd text-white text-2xl"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">Fundraiser Details</h2>
                    <p class="text-gray-600">Learn more about this fundraising campaign</p>
                </div>

                <!-- Details Grid -->
                <div class="details-grid">
                    <!-- Image Section -->
                    <div class="image-section">
                        <asp:Image ID="Image1" runat="server" CssClass="fund-image" />
                        <div class="fund-name-overlay">
                            <h2 id="fundRaiserName" runat="server"></h2>
                        </div>
                    </div>

                    <!-- Info Section -->
                    <div class="info-section">
                        <!-- Fund Type -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-tag"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Fund Required For</div>
                                <div class="info-value" id="h1TypeofDonation" runat="server"></div>
                            </div>
                        </div>

                        <!-- Amount -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Amount Needed</div>
                                <div class="info-value" id="fundAmount" runat="server"></div>
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-info-circle"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Description</div>
                                <div class="info-value" id="p1Para" runat="server"></div>
                            </div>
                        </div>

                        <!-- Phone -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Phone Number</div>
                                <div class="info-value" id="lblPhoneNumber" runat="server"></div>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Email</div>
                                <div class="info-value" id="lblEmail" runat="server"></div>
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Address</div>
                                <div class="info-value" id="lblAddress" runat="server"></div>
                            </div>
                        </div>

                        <!-- Status -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">Approval Status</div>
                                <span class="status-badge status-<%# lblApprovedByAdmin.InnerText.ToLower() %>" id="lblApprovedByAdmin" runat="server"></span>
                            </div>
                        </div>

                        <!-- End Date -->
                        <div class="info-item">
                            <div class="info-icon">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div class="info-content">
                                <div class="info-label">End Date of Fund</div>
                                <div class="info-value" id="validTill" runat="server"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Donate Section -->
                <div class="donate-section">
                    <asp:Button ID="btnDonateNow" runat="server" 
                        OnClick="btnDonateNow_Click" 
                        CssClass="donate-btn" 
                        Text="Donate Now" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>



