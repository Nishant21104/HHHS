<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="NgoDetails.aspx.cs" Inherits="OCR.Donor.NgoDetails" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .pd-wrap {
            padding: 0px 0;
            font-family: 'Poppins', sans-serif;
        }

        .heading-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .sub-heading {
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            display: block;
            font-weight: 600;
            color: #2e9ca1;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .heading-section h2 {
            font-size: 32px;
            font-weight: 500;
            padding-top: 10px;
            padding-bottom: 15px;
            font-family: 'Poppins', sans-serif;
        }

        .user-img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            position: relative;
            min-width: 80px;
            background-size: 100%;
        }

        .carousel-testimonial .item {
            padding: 30px 10px;
        }

        .quote {
            position: absolute;
            top: -23px;
            color: #2e9da1;
            font-size: 27px;
        }

        .name {
            margin-bottom: 0;
            line-height: 14px;
            font-size: 17px;
            font-weight: 500;
        }

        .position {
            color: #adadad;
            font-size: 14px;
        }

        .owl-nav button {
            position: absolute;
            top: 50%;
            transform: translate(0, -50%);
            outline: none;
            height: 25px;
        }

            .owl-nav button svg {
                width: 25px;
                height: 25px;
            }

            .owl-nav button.owl-prev {
                left: 25px;
            }

            .owl-nav button.owl-next {
                right: 25px;
            }

            .owl-nav button span {
                font-size: 45px;
            }

        .product-thumb .item img {
            height: 150px;
        }

        .product-name {
            font-size: 22px;
            font-weight: 500;
            line-height: 22px;
            margin-bottom: 4px;
        }

        .product-price-discount {
            font-size: 16px;
            font-weight: 400;
            padding: 10px 0;
            clear: both;
        }

            .product-price-discount span.line-through {
                text-decoration: line-through;
                margin-left: 10px;
                font-size: 14px;
                vertical-align: middle;
                color: #a5a5a5;
            }

        .display-flex {
            display: flex;
        }

        .align-center {
            align-items: center;
        }

        .product-info {
            width: 100%;
        }

        .reviews-counter {
            font-size: 13px;
        }

            .reviews-counter span {
                vertical-align: -2px;
            }

        .rate {
            float: left;
            padding: 0 10px 0 0;
        }

            .rate:not(:checked) > input {
                position: absolute;
                top: -9999px;
            }

            .rate:not(:checked) > label {
                float: right;
                width: 15px;
                overflow: hidden;
                white-space: nowrap;
                cursor: pointer;
                font-size: 21px;
                color: #ccc;
                margin-bottom: 0;
                line-height: 21px;
            }

                .rate:not(:checked) > label:before {
                    content: '\2605';
                }

            .rate > input:checked ~ label {
                color: #ffc700;
            }

            .rate:not(:checked) > label:hover,
            .rate:not(:checked) > label:hover ~ label {
                color: #deb217;
            }

            .rate > input:checked + label:hover,
            .rate > input:checked + label:hover ~ label,
            .rate > input:checked ~ label:hover,
            .rate > input:checked ~ label:hover ~ label,
            .rate > label:hover ~ input:checked ~ label {
                color: #c59b08;
            }

        .product-dtl p {
            font-size: 14px;
            line-height: 24px;
            color: #7a7a7a;
        }

        .product-dtl .form-control {
            font-size: 15px;
        }

        .product-dtl label {
            line-height: 16px;
            font-size: 15px;
        }

        .form-control:focus {
            outline: none;
            box-shadow: none;
        }

        .product-count {
            margin-top: 15px;
        }

            .product-count .qtyminus,
            .product-count .qtyplus {
                width: 34px;
                height: 34px;
                background: #212529;
                text-align: center;
                font-size: 19px;
                line-height: 36px;
                color: #fff;
                cursor: pointer;
            }

            .product-count .qtyminus {
                border-radius: 3px 0 0 3px;
            }

            .product-count .qtyplus {
                border-radius: 0 3px 3px 0;
            }

            .product-count .qty {
                width: 60px;
                text-align: center;
            }

        .round-black-btn {
            border-radius: 4px;
            background: #212529;
            color: #fff;
            padding: 7px 45px;
            display: inline-block;
            margin-top: 20px;
            border: solid 2px #212529;
            transition: all 0.5s ease-in-out 0s;
        }

            .round-black-btn:hover,
            .round-black-btn:focus {
                background: transparent;
                color: #212529;
                text-decoration: none;
            }

        .product-info-tabs {
            margin-top: 25px;
        }

            .product-info-tabs .nav-tabs {
                border-bottom: 2px solid #d8d8d8;
            }

                .product-info-tabs .nav-tabs .nav-item {
                    margin-bottom: 0;
                }

                .product-info-tabs .nav-tabs .nav-link {
                    border: none;
                    border-bottom: 2px solid transparent;
                    color: #323232;
                }

                .product-info-tabs .nav-tabs .nav-item .nav-link:hover {
                    border: none;
                }

                .product-info-tabs .nav-tabs .nav-item.show .nav-link,
                .product-info-tabs .nav-tabs .nav-link.active,
                .product-info-tabs .nav-tabs .nav-link.active:hover {
                    border: none;
                    border-bottom: 2px solid #d8d8d8;
                    font-weight: bold;
                }

            .product-info-tabs .tab-content .tab-pane {
                padding: 30px 20px;
                font-size: 15px;
                line-height: 24px;
                color: #7a7a7a;
            }

        .review-form .form-group {
            clear: both;
        }

        .mb-20 {
            margin-bottom: 20px;
        }
    </style>
    <!------ Include the above in your HEAD tag ---------->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
    <%--<form id="form1" runat="server">--%>
       <%-- <asp:HiddenField ID="hdnFundraiserID" runat="server" />
        <div class="pd-wrap">
            <div class="container">
                <div class="heading-section">
                    <h2>NGO Details</h2>

                </div>
                <div class="row">
                    <div class="col-md-5">
                            <h3 id="hApprovalStatus" runat="server" style="color:green;font-weight:bolder;text-align-last: center;margin:0px;"></h3>
                        <div id="slider">
                            <div class="item">
                                <asp:Image ID="Image1" runat="server" Style="width: -webkit-fill-available;" />
                            </div>
                            <div class="product-price-discount">
                                <h2 id="ngoName" runat="server"></h2>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-7">
                        <table id="tbl1" runat="server" style="width: 100%;">
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Cause</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label id="h1Cause" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Amount Needed</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="fundAmount" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Description</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="p1Para" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Phone Number</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblPhoneNumber" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Email</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblEmail" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Address</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblAddress" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; padding-bottom: 15px;">
                                    <label>Registered Id</label></td>
                                <td style="width: 70%; padding-bottom: 15px;">
                                    <label class="form-control-label" id="lblGovID" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-bottom: 15px;">
                                    <label>Valid Till</label></td>
                                <td>
                                    <label class="form-control-label" id="validTill" runat="server"></label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-bottom: 15px;">
                                    <asp:Button ID="btnDonateNow" runat="server" OnClick="btnDonateNow_Click" CssClass="btn btn-primary btn-sm" Text="Donate Now" />
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
        /* Custom CSS for NGO details page - no TailwindCSS conflicts */
        .ngo-details-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .ngo-details-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .ngo-details-page .slide-in { animation: slideIn 0.5s ease-out; }
        .ngo-details-page .pulse-animation { animation: pulse 2s infinite; }
        
        .ngo-details-page .details-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .ngo-details-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .ngo-details-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #1f76bd 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .ngo-details-page .form-body {
            padding: 30px;
        }
        
        .ngo-details-page .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-top: 35px;
        }
        
        .ngo-details-page .image-section {
            position: relative;
        }
        
        .ngo-details-page .ngo-image {
            width: 100%;
            height: 450px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .ngo-details-page .status-badge {
            position: absolute;
            top: -55px;
            left: 0px;
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 15px 20px;
            border-radius: 10px;
            backdrop-filter: blur(10px);
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .ngo-details-page .status-approved {
            background: rgba(34, 197, 94, 0.9);
        }
        
        .ngo-details-page .status-pending {
            background: rgba(245, 158, 11, 0.9);
        }
        
        .ngo-details-page .status-rejected {
            background: rgba(239, 68, 68, 0.9);
        }
        
        .ngo-details-page .info-section {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .ngo-details-page .info-item {
            display: flex;
            align-items: flex-start;
            padding: 15px;
            background: #f8fafc;
            border-radius: 10px;
            border-left: 4px solid #667eea;
        }
        
        .ngo-details-page .info-icon {
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
        
        .ngo-details-page .info-content {
            flex: 1;
        }
        
        .ngo-details-page .info-label {
            font-weight: 600;
            color: #4a5568;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 5px;
        }
        
        .ngo-details-page .info-value {
            color: #2d3748;
            font-size: 16px;
            line-height: 1.5;
        }
        
        .ngo-details-page .donate-section {
            margin-top: 30px;
            text-align: center;
        }
        
        .ngo-details-page .donate-btn {
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
        
        .ngo-details-page .donate-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.4);
        }
        
        .ngo-details-page .text-center {
            text-align: center;
        }
        
        .ngo-details-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .ngo-details-page .mb-4 {
            margin-bottom: 16px;
        }
        
        .ngo-details-page .inline-flex {
            display: inline-flex;
        }
        
        .ngo-details-page .items-center {
            align-items: center;
        }
        
        .ngo-details-page .justify-center {
            justify-content: center;
        }
        
        .ngo-details-page .w-16 {
            width: 64px;
        }
        
        .ngo-details-page .h-16 {
            height: 64px;
        }
        
        .ngo-details-page .rounded-full {
            border-radius: 50%;
        }
        
        .ngo-details-page .text-3xl {
            font-size: 30px;
        }
        
        .ngo-details-page .font-bold {
            font-weight: 700;
        }
        
        .ngo-details-page .text-gray-800 {
            color: #2d3748;
        }
        
        .ngo-details-page .text-gray-600 {
            color: #4a5568;
        }
        
        .ngo-details-page .text-white {
            color: white;
        }
        
        .ngo-details-page .text-2xl {
            font-size: 24px;
        }
        
        .ngo-details-page .mr-2 {
            margin-right: 8px;
        }
        
        .ngo-details-page .mr-4 {
            margin-right: 16px;
        }
        
        .ngo-details-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .ngo-details-page .details-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .ngo-details-page .details-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .ngo-details-page .ngo-image {
                height: 250px;
            }
            
            .ngo-details-page .status-badge {
                font-size: 12px;
                padding: 10px 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdnFundraiserID" runat="server" />

    <div class="ngo-details-page">
        <div class="details-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="form-header">
                    <div class="text-center">
                        <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-purple-500 to-pink-600 rounded-full mb-4">
                            <i class="fas fa-building text-white text-2xl"></i>
                        </div>
                        <h2 class="text-3xl font-bold text-white">NGO Details</h2>
                        <p class="text-white opacity-90">Learn more about this verified organization</p>
                    </div>
                </div>

                <!-- Details Grid -->
                <div class="form-body">
                    <div class="details-grid">
                        <!-- Image Section -->
                        <div class="image-section">
                            <asp:Image ID="Image1" runat="server" CssClass="ngo-image" />
                            <div class="status-badge status-<%# hApprovalStatus.InnerText.ToLower() %>" id="hApprovalStatus" runat="server">
                                <%# hApprovalStatus.InnerText %>
                            </div>
                            <div class="text-center mt-4">
                                <h2 id="ngoName" runat="server" class="text-2xl font-bold text-gray-800"></h2>
                            </div>
                        </div>

                        <!-- Info Section -->
                        <div class="info-section">
                            <!-- Cause -->
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-hand-holding-heart"></i>
                                </div>
                                <div class="info-content">
                                    <div class="info-label">Cause</div>
                                    <div class="info-value" id="h1Cause" runat="server"></div>
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

                            <!-- Registered ID -->
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-id-card"></i>
                                </div>
                                <div class="info-content">
                                    <div class="info-label">Registered ID</div>
                                    <div class="info-value" id="lblGovID" runat="server"></div>
                                </div>
                            </div>

                            <!-- Valid Till -->
                            <div class="info-item">
                                <div class="info-icon">
                                    <i class="fas fa-calendar-alt"></i>
                                </div>
                                <div class="info-content">
                                    <div class="info-label">Valid Till</div>
                                    <div class="info-value" id="validTill" runat="server"></div>
                                </div>
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

