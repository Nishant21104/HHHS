<%@ Page Title="" Language="C#" MasterPageFile="~/FundRaiser/FundRaiser.Master" AutoEventWireup="true" CodeBehind="FundRequestStatusDetail.aspx.cs" Inherits="OCR.FundRaiser.FundRequestStatusDetail" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .th {
            border-color: black;
            border-style: none;
            border-width: 0.5px;
        }

        .sticked-header-offset {
            margin-top: 8%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 px-5" style="margin-top: 50px;" runat="server">
        <div class="mb-4">
            <h4>Request for Funds</h4>

        </div>
    </div>
    <div class="row mt-5 px-5" style="margin-left: 50px;">
        <div class="col-md-11">
            <asp:GridView ID="grdRequestDetails" CssClass="table table-bordered" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" AutoGenerateColumns="false" OnRowCancelingEdit="GridView1_RowCancelingEdit" runat="server" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="BloodType" HeaderText="Blood Type" />
                    <asp:BoundField DataField="TypeOfDonation" HeaderText="Type Of Donation" />
                    <asp:BoundField DataField="TypeOfDisease" HeaderText="Type Of Disease" />
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-sm" />
                    <asp:CommandField ShowCancelButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary btn-sm" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:Panel ID="pnlRequestDetails" runat="server" Visible="false" Style="margin-left: 110px;">
        <h3>Fund Details</h3>
        <div class="row">
            <div class="col-sm-11">
                <asp:HiddenField ID="hdnId" runat="server" />
                <table class="table" style="border: floralwhite; border-style: groove;">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>PhoneNumber</th>
                            <th>Email</th>
                            <th>Address</th>

                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblName" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                            <td>
                                <asp:Label ID="lblAddress" runat="server"></asp:Label></td>


                        </tr>
                        <tr>
                            <th>BloodType</th>
                            <th>TypeOfDonation</th>
                            <th>TypeOfDisease</th>
                            <th>ProfilePhoto</th>

                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlBloodType" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select Blood Type" Value="0"></asp:ListItem>
                                <asp:ListItem Text="O+" Value="OPositive"></asp:ListItem>
                                <asp:ListItem Text="O-" Value="ONegative"></asp:ListItem>
                                <asp:ListItem Text="A+" Value="APositive"></asp:ListItem>
                                <asp:ListItem Text="A-" Value="ANegative"></asp:ListItem>
                                <asp:ListItem Text="B+" Value="BPositive"></asp:ListItem>
                                <asp:ListItem Text="AB+" Value="ABPositive"></asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTypeOfDonation" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Donation Type" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Blood donation" Value="BloodDonation"></asp:ListItem>
                                    <asp:ListItem Text="Organ Donation" Value="OrganDonation"></asp:ListItem>
                                    <asp:ListItem Text="Clothes Donation" Value="ClothesDonation"></asp:ListItem>
                                    <asp:ListItem Text="Money Donation" Value="Donation"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:DropDownList>
                               
                            </td>
                            <td>
                                <asp:TextBox ID="txtTypeOfDisease" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>

                            <td>
                                <asp:FileUpload ID="fuProfilePhoto" runat="server" />
                                <asp:Label ID="lblProfilePhoto" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <th>RequiredAmount</th>
                            <th>Status</th>
                            <th>StartDate</th>
                            <th>EndDate</th>

                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtRequiredAmount" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtStatus" Enabled="false" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtStartDate" TextMode="Date" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEndDate" TextMode="Date" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>


                        </tr>
                        <tr>
                            <th>Description</th>
                            <th>MainReport</th>
                            <th>FundCollected</th>
                            <th>AadharCard</th>


                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtDescription" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:FileUpload ID="fuMainReport" runat="server" />
                                <asp:Label ID="lblMainReport" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFundCollected" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAadharCard" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>


                        </tr>
                        <tr>
                            <th>AadharCardDocument</th>
                            <th>PANNumber</th>
                            <th>PANNumberPhoto</th>
                            <th>AnnualSalary</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:FileUpload ID="fuAadharCardDocument" runat="server" />
                                <asp:Label ID="lblAadharCardDocument" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPANNumber" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:FileUpload ID="fuPANNumberPhoto" runat="server" />
                                <asp:Label ID="lblPANNumberPhoto" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAnnualSalary" CssClass="input-field" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="lnkUpdate" runat="server" Text="Update" OnClick="lnkUpdate_Click" CssClass="btn btn-primary btn-sm"></asp:Button>
                                <asp:Button ID="lnkCancel" runat="server" Text="Cancel" OnClick="lnkCancel_Click" CssClass="btn btn-primary btn-sm"></asp:Button>
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </asp:Panel>
</asp:Content>--%>





<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for fund request status detail page - no TailwindCSS conflicts */
        .fund-status-detail-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .fund-status-detail-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .fund-status-detail-page .slide-in { animation: slideIn 0.5s ease-out; }
        .fund-status-detail-page .pulse-animation { animation: pulse 2s infinite; }
        
        .fund-status-detail-page .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .fund-status-detail-page .header-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }
        
        .fund-status-detail-page .header-title {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .fund-status-detail-page .header-title i {
            font-size: 1.8rem;
        }
        
        .fund-status-detail-page .requests-table-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            overflow: hidden;
        }
        
        .fund-status-detail-page .modern-gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .fund-status-detail-page .modern-gridview th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px 12px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-right: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .fund-status-detail-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .fund-status-detail-page .modern-gridview td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            border-right: 1px solid #e2e8f0;
            vertical-align: middle;
            font-size: 14px;
        }
        
        .fund-status-detail-page .modern-gridview tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .fund-status-detail-page .modern-gridview tr:hover {
            background-color: #edf2f7;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        
        .fund-status-detail-page .modern-gridview td:last-child {
            border-right: none;
        }
        
        .fund-status-detail-page .btn-edit {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.3);
        }
        
        .fund-status-detail-page .btn-edit:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }
        
        .fund-status-detail-page .btn-cancel {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);
        }
        
        .fund-status-detail-page .btn-cancel:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
        }
        
        .fund-status-detail-page .details-panel {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #10b981;
        }
        
        .fund-status-detail-page .details-header {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .fund-status-detail-page .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
            grid-column-gap: 30px;
        }
        
        .fund-status-detail-page .detail-card {
            background: #f8fafc;
            border-radius: 15px;
            padding: 20px;
            border-left: 4px solid #667eea;
            border-right: 1px solid #e2e8f0;
            transition: all 0.3s ease;
        }
        
        .fund-status-detail-page .detail-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }
        
        .fund-status-detail-page .detail-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 20px;
        }
        
        .fund-status-detail-page .detail-label {
            font-weight: 600;
            color: #64748b;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }
        
        .fund-status-detail-page .form-control {
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
        
        .fund-status-detail-page .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            background: white;
        }
        
        .fund-status-detail-page .form-control:hover {
            border-color: #cbd5e0;
            background: white;
        }
        
        .fund-status-detail-page .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }
        
        .fund-status-detail-page .btn-action {
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .fund-status-detail-page .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }
        
        .fund-status-detail-page .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }
        
        .fund-status-detail-page .btn-secondary {
            background: linear-gradient(135deg, #64748b, #475569);
            color: white;
            box-shadow: 0 4px 15px rgba(100, 116, 139, 0.3);
        }
        
        .fund-status-detail-page .btn-secondary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(100, 116, 139, 0.4);
        }
        
        @media (max-width: 768px) {
            .fund-status-detail-page .container {
                padding: 0 15px;
            }
            
            .fund-status-detail-page .header-card {
                padding: 20px;
            }
            
            .fund-status-detail-page .header-title {
                font-size: 1.5rem;
            }
            
            .fund-status-detail-page .requests-table-card {
                padding: 15px;
                overflow-x: auto;
            }
            
            .fund-status-detail-page .modern-gridview {
                font-size: 12px;
            }
            
            .fund-status-detail-page .modern-gridview th,
            .fund-status-detail-page .modern-gridview td {
                padding: 8px 6px;
            }
            
            .fund-status-detail-page .details-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .fund-status-detail-page .action-buttons {
                flex-direction: column;
            }
            
            .fund-status-detail-page .btn-action {
                width: 100%;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fund-status-detail-page">
        <div class="container">
            <!-- Header Section -->
            <div class="header-card fade-in">
                <h3 class="header-title">
                    <i class="fas fa-clipboard-check"></i>
                    Fund Request Status Details
                </h3>
            </div>

            <!-- Requests Table Section -->
            <div class="requests-table-card slide-in">
                <asp:GridView ID="grdRequestDetails" CssClass="modern-gridview" DataKeyNames="Id" OnRowEditing="GridView1_RowEditing" AutoGenerateColumns="false" OnRowCancelingEdit="GridView1_RowCancelingEdit" runat="server" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false"/>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="BloodType" HeaderText="Blood Type" />
                        <asp:BoundField DataField="TypeOfDonation" HeaderText="Type Of Donation" />
                        <asp:BoundField DataField="TypeOfDisease" HeaderText="Type Of Disease" />
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn-edit" />
                        <asp:CommandField ShowCancelButton="True" ButtonType="Button" ControlStyle-CssClass="btn-cancel" />
                    </Columns>
                </asp:GridView>
            </div>

            <!-- Details Panel -->
            <asp:Panel ID="pnlRequestDetails" runat="server" CssClass="details-panel fade-in">
                <h4 class="details-header">
                    <i class="fas fa-user-edit"></i>
                    Fund Details
                </h4>
                
                <asp:HiddenField ID="hdnId" runat="server" />
                
                <div class="details-grid">
                    <!-- Name -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="detail-label">Name</div>
                        <asp:Label ID="lblName" runat="server" CssClass="form-control" style="background: white; border: none; padding: 0; font-weight: 600;"></asp:Label>
                    </div>

                    <!-- Phone Number -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div class="detail-label">Phone Number</div>
                        <asp:Label ID="lblPhoneNumber" runat="server" CssClass="form-control" style="background: white; border: none; padding: 0; font-weight: 600;"></asp:Label>
                    </div>

                    <!-- Email -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="detail-label">Email Address</div>
                        <asp:Label ID="lblEmail" runat="server" CssClass="form-control" style="background: white; border: none; padding: 0; font-weight: 600;"></asp:Label>
                    </div>

                    <!-- Address -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="detail-label">Address</div>
                        <asp:Label ID="lblAddress" runat="server" CssClass="form-control" style="background: white; border: none; padding: 0; font-weight: 600;"></asp:Label>
                    </div>

                    <!-- Blood Type -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-tint"></i>
                        </div>
                        <div class="detail-label">Blood Type</div>
                        <asp:DropDownList ID="ddlBloodType" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Blood Type" Value="0"></asp:ListItem>
                            <asp:ListItem Text="O+" Value="OPositive"></asp:ListItem>
                            <asp:ListItem Text="O-" Value="ONegative"></asp:ListItem>
                            <asp:ListItem Text="A+" Value="APositive"></asp:ListItem>
                            <asp:ListItem Text="A-" Value="ANegative"></asp:ListItem>
                            <asp:ListItem Text="B+" Value="BPositive"></asp:ListItem>
                            <asp:ListItem Text="AB+" Value="ABPositive"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Type of Donation -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-hand-holding-heart"></i>
                        </div>
                        <div class="detail-label">Type of Donation</div>
                        <asp:DropDownList ID="ddlTypeOfDonation" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Select Donation Type" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Blood donation" Value="BloodDonation"></asp:ListItem>
                            <asp:ListItem Text="Organ Donation" Value="OrganDonation"></asp:ListItem>
                            <asp:ListItem Text="Clothes Donation" Value="ClothesDonation"></asp:ListItem>
                            <asp:ListItem Text="Money Donation" Value="Donation"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <!-- Type of Disease -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-procedures"></i>
                        </div>
                        <div class="detail-label">Type of Disease</div>
                        <asp:TextBox ID="txtTypeOfDisease" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Profile Photo -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-camera"></i>
                        </div>
                        <div class="detail-label">Profile Photo</div>
                        <asp:FileUpload ID="fuProfilePhoto" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblProfilePhoto" runat="server" CssClass="form-control" style="background: white; border: none; padding: 5px 0; font-size: 12px; margin-top: 5px;"></asp:Label>
                    </div>

                    <!-- Required Amount -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div class="detail-label">Required Amount</div>
                        <asp:TextBox ID="txtRequiredAmount" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Status -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-info-circle"></i>
                        </div>
                        <div class="detail-label">Status</div>
                        <asp:TextBox ID="txtStatus" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Start Date -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-calendar-plus"></i>
                        </div>
                        <div class="detail-label">Start Date</div>
                        <asp:TextBox ID="txtStartDate" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- End Date -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-calendar-check"></i>
                        </div>
                        <div class="detail-label">End Date</div>
                        <asp:TextBox ID="txtEndDate" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Description -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <div class="detail-label">Description</div>
                        <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>

                    <!-- Main Report -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-file-medical"></i>
                        </div>
                        <div class="detail-label">Main Report</div>
                        <asp:FileUpload ID="fuMainReport" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblMainReport" runat="server" CssClass="form-control" style="background: white; border: none; padding: 5px 0; font-size: 12px; margin-top: 5px;"></asp:Label>
                    </div>

                    <!-- Fund Collected -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-piggy-bank"></i>
                        </div>
                        <div class="detail-label">Fund Collected</div>
                        <asp:TextBox ID="txtFundCollected" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Aadhar Card -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-id-card"></i>
                        </div>
                        <div class="detail-label">Aadhar Card</div>
                        <asp:TextBox ID="txtAadharCard" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- Aadhar Card Document -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-file-upload"></i>
                        </div>
                        <div class="detail-label">Aadhar Card Document</div>
                        <asp:FileUpload ID="fuAadharCardDocument" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblAadharCardDocument" runat="server" CssClass="form-control" style="background: white; border: none; padding: 5px 0; font-size: 12px; margin-top: 5px;"></asp:Label>
                    </div>

                    <!-- PAN Number -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="detail-label">PAN Number</div>
                        <asp:TextBox ID="txtPANNumber" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <!-- PAN Number Photo -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-image"></i>
                        </div>
                        <div class="detail-label">PAN Number Photo</div>
                        <asp:FileUpload ID="fuPANNumberPhoto" runat="server" CssClass="form-control" />
                        <asp:Label ID="lblPANNumberPhoto" runat="server" CssClass="form-control" style="background: white; border: none; padding: 5px 0; font-size: 12px; margin-top: 5px;"></asp:Label>
                    </div>

                    <!-- Annual Salary -->
                    <div class="detail-card">
                        <div class="detail-icon">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <div class="detail-label">Annual Salary</div>
                        <asp:TextBox ID="txtAnnualSalary" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="action-buttons">
                    <asp:Button ID="lnkUpdate" runat="server" Text="Update" OnClick="lnkUpdate_Click" CssClass="btn-action btn-primary" />
                    <asp:Button ID="lnkCancel" runat="server" Text="Cancel" OnClick="lnkCancel_Click" CssClass="btn-action btn-secondary" />
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>



