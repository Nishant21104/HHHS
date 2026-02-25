<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="NgoList.aspx.cs" Inherits="OCR.Donor.NgoList" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <h2>NGO List</h2>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvNGOList" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                        <Columns>                         
                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false"/>
                            <asp:BoundField DataField="NGOName" HeaderText="NGO Name" />
                             <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                             <asp:BoundField DataField="DonationAmount" HeaderText="Required Amount" />
                            <asp:BoundField DataField="FundEndDate" HeaderText="Fund EndDate" />
                             <asp:BoundField DataField="FundDonated" HeaderText="Fund Collected" />
                            <asp:BoundField DataField="ApprovalByAdmin" HeaderText="Approval Status" />
                            <asp:TemplateField HeaderText="Details">
                                <ItemTemplate>
                                    <a href='<%# "NGODetails.aspx?NgoID=" + Eval("ID") %>' class="btn btn-info btn-sm">View Details</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for NGO list page - no TailwindCSS conflicts */
        .ngo-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .ngo-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .ngo-page .slide-in { animation: slideIn 0.5s ease-out; }
        .ngo-page .pulse-animation { animation: pulse 2s infinite; }
        
        .ngo-page .ngo-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .ngo-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .ngo-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .ngo-page .form-body {
            padding: 30px;
        }
        
        .ngo-page .modern-gridview {
            width: 100%;
            border: 2px solid #e2e8f0;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .ngo-page .modern-gridview th {
            background: #667eea;
            color: white;
            padding: 12px 15px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            border-right: 1px solid #5a67d8;
            border-bottom: 2px solid #667eea;
        }
        
        .ngo-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .ngo-page .modern-gridview td {
            padding: 12px 15px;
            border-right: 1px solid #e2e8f0;
            border-bottom: 1px solid #e2e8f0;
            color: #333;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .ngo-page .modern-gridview td:last-child {
            border-right: none;
        }
        
        .ngo-page .modern-gridview tr:nth-child(even) td {
            background: #f8fafc;
        }
        
        .ngo-page .modern-gridview tr:hover td {
            background: #f0f4ff;
        }
        
        .ngo-page .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
        }
        
        .ngo-page .status-approved {
            background: #d1fae5;
            color: #065f46;
        }
        
        .ngo-page .status-pending {
            background: #fef3c7;
            color: #92400e;
        }
        
        .ngo-page .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .ngo-page .amount-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            background: #dbeafe;
            color: #1e40af;
        }
        
        .ngo-page .progress-bar {
            width: 100%;
            height: 8px;
            background: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            margin-top: 5px;
        }
        
        .ngo-page .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 4px;
            transition: width 0.3s ease;
        }
        
        .ngo-page .details-btn {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            background: #3b82f6;
            color: white;
        }
        
        .ngo-page .details-btn:hover {
            background: #2563eb;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }
        
        .ngo-page .text-center {
            text-align: center;
        }
        
        .ngo-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .ngo-page .mb-2 {
            margin-bottom: 8px;
        }
        
        .ngo-page .inline-flex {
            display: inline-flex;
        }
        
        .ngo-page .items-center {
            align-items: center;
        }
        
        .ngo-page .justify-center {
            justify-content: center;
        }
        
        .ngo-page .w-16 {
            width: 64px;
        }
        
        .ngo-page .h-16 {
            height: 64px;
        }
        
        .ngo-page .rounded-full {
            border-radius: 50%;
        }
        
        .ngo-page .text-3xl {
            font-size: 30px;
        }
        
        .ngo-page .font-bold {
            font-weight: 700;
        }
        
        .ngo-page .text-gray-800 {
            color: #2d3748;
        }
        
        .ngo-page .text-gray-600 {
            color: #4a5568;
        }
        
        .ngo-page .text-white {
            color: white;
        }
        
        .ngo-page .text-2xl {
            font-size: 24px;
        }
        
        .ngo-page .mr-2 {
            margin-right: 8px;
        }
        
        .ngo-page .mr-4 {
            margin-right: 16px;
        }
        
        .ngo-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .ngo-page .ngo-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .ngo-page .modern-gridview {
                font-size: 12px;
            }
            
            .ngo-page .modern-gridview th,
            .ngo-page .modern-gridview td {
                padding: 10px 8px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ngo-page">
        <div class="ngo-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-purple-500 to-pink-600 rounded-full mb-4">
                        <i class="fas fa-hands-helping text-white text-2xl"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">NGO Directory</h2>
                    <p class="text-gray-600">Discover and support verified NGOs making a difference</p>
                </div>

                <!-- NGO Grid -->
                <div class="form-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvNGOList" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="modern-gridview"
                            GridLines="None"
                            AllowPaging="True"
                            PageSize="10">
                            <Columns>                         
                                <asp:BoundField DataField="ID" HeaderText="ID" Visible="false"/>
                                <asp:BoundField DataField="NGOName" HeaderText="NGO Name">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Fund Progress">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <div>
                                            <span class="amount-badge">
                                                $<%# Eval("FundDonated", "{0:N0}") %> / $<%# Eval("DonationAmount", "{0:N0}") %>
                                            </span>
                                            <div class="progress-bar">
                                                <div class="progress-fill" style="width: <%# Convert.ToDouble(Eval("FundDonated")) / Convert.ToDouble(Eval("DonationAmount")) * 100 %>%"></div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FundEndDate" HeaderText="End Date" DataFormatString="{0:MMM dd, yyyy}">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Status">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <span class="status-badge status-<%# Eval("ApprovalByAdmin").ToString().ToLower() %>">
                                            <%# Eval("ApprovalByAdmin") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actions">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <a href='<%# "NGODetails.aspx?NgoID=" + Eval("ID") %>' class="details-btn">
                                            <i class="fas fa-eye mr-2"></i>View Details
                                        </a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="modern-gridview-header" />
                            <RowStyle CssClass="modern-gridview-row" />
                            <AlternatingRowStyle CssClass="modern-gridview-alternate" />
                            <PagerStyle CssClass="modern-gridview-pager" HorizontalAlign="Center" />
                            <EmptyDataRowStyle CssClass="empty-state" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


