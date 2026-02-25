<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="FundRaiserLists.aspx.cs" Inherits="OCR.Donor.FundRaiserDetails" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
    <%--<form id="frmDonor" runat="server">--%>
<%--    <div class="container mt-5">
            <div class="row">
                <div class="col-md-12">
                    <h2>Fundraiser List</h2>
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvFundraiser" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                        <Columns>                         
                            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false"/>
                            <asp:BoundField DataField="Name" HeaderText="Charity Name" />
                             <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />
                             <asp:BoundField DataField="RequiredAmount" HeaderText="Required Amount" />
                            <asp:BoundField DataField="EndDate" HeaderText="Fund EndDate" />
                             <asp:BoundField DataField="FundCollected" HeaderText="Fund Collected" />
                            <asp:BoundField DataField="AnnualSalary" HeaderText="Annual Salary" />
                            <asp:BoundField DataField="TypeOfDonation" HeaderText="Type Of Donation" />
                            <asp:BoundField DataField="ApprovalByAdmin" HeaderText="Approval Status" />
                            <asp:TemplateField HeaderText="Check Details">
                                <ItemTemplate>
                                    <a href='<%# "FundDetails.aspx?FundraiserID=" + Eval("ID") %>' class="btn btn-info btn-sm">View Details</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>--%>
        <%--</form>--%>
<%--</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for fundraiser list page - no TailwindCSS conflicts */
        .fundraiser-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .fundraiser-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .fundraiser-page .slide-in { animation: slideIn 0.5s ease-out; }
        .fundraiser-page .pulse-animation { animation: pulse 2s infinite; }
        
        .fundraiser-page .fundraiser-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .fundraiser-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .fundraiser-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .fundraiser-page .form-body {
            padding: 30px;
        }
        
        .fundraiser-page .modern-gridview {
            width: 100%;
            border: 2px solid #e2e8f0;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .fundraiser-page .modern-gridview th {
            background: #1f76bd;
            color: white;
            padding: 12px 15px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            border-right: 1px solid #5a67d8;
            border-bottom: 2px solid #667eea;
        }
        
        .fundraiser-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .fundraiser-page .modern-gridview td {
            padding: 12px 15px;
            border-right: 1px solid #e2e8f0;
            border-bottom: 1px solid #e2e8f0;
            color: #333;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .fundraiser-page .modern-gridview td:last-child {
            border-right: none;
        }
        
        .fundraiser-page .modern-gridview tr:nth-child(even) td {
            background: #f8fafc;
        }
        
        .fundraiser-page .modern-gridview tr:hover td {
            background: #f0f4ff;
        }
        
        .fundraiser-page .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
        }
        
        .fundraiser-page .status-approved {
            background: #d1fae5;
            color: #065f46;
        }
        
        .fundraiser-page .status-pending {
            background: #fef3c7;
            color: #92400e;
        }
        
        .fundraiser-page .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .fundraiser-page .amount-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            background: #dbeafe;
            color: #1e40af;
        }
        
        .fundraiser-page .progress-bar {
            width: 100%;
            height: 8px;
            background: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            margin-top: 8px;
        }
        
        .fundraiser-page .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            border-radius: 4px;
            transition: width 0.3s ease;
        }
        
        .fundraiser-page .details-btn {
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
        
        .fundraiser-page .details-btn:hover {
            background: #2563eb;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }
        
        .fundraiser-page .text-center {
            text-align: center;
        }
        
        .fundraiser-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .fundraiser-page .mb-2 {
            margin-bottom: 8px;
        }
        
        .fundraiser-page .inline-flex {
            display: inline-flex;
        }
        
        .fundraiser-page .items-center {
            align-items: center;
        }
        
        .fundraiser-page .justify-center {
            justify-content: center;
        }
        
        .fundraiser-page .w-16 {
            width: 64px;
        }
        
        .fundraiser-page .h-16 {
            height: 64px;
        }
        
        .fundraiser-page .rounded-full {
            border-radius: 50%;
        }
        
        .fundraiser-page .text-3xl {
            font-size: 30px;
        }
        
        .fundraiser-page .font-bold {
            font-weight: 700;
        }
        
        .fundraiser-page .text-gray-800 {
            color: #2d3748;
        }
        
        .fundraiser-page .text-gray-600 {
            color: #4a5568;
        }
        
        .fundraiser-page .text-white {
            color: white;
        }
        
        .fundraiser-page .text-2xl {
            font-size: 24px;
        }
        
        .fundraiser-page .mr-2 {
            margin-right: 8px;
        }
        
        .fundraiser-page .mr-4 {
            margin-right: 16px;
        }
        
        .fundraiser-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .fundraiser-page .fundraiser-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .fundraiser-page .modern-gridview {
                font-size: 12px;
            }
            
            .fundraiser-page .modern-gridview th,
            .fundraiser-page .modern-gridview td {
                padding: 10px 8px;
            }
        }
    </style>
    
    <script runat="server">
        protected string GetProgressPercentage(object fundCollected, object requiredAmount)
        {
            try
            {
                if (fundCollected == DBNull.Value || requiredAmount == DBNull.Value)
                    return "0";
                
                double collected = Convert.ToDouble(fundCollected);
                double required = Convert.ToDouble(requiredAmount);
                
                if (required == 0)
                    return "0";
                
                double percentage = (collected / required) * 100;
                return Math.Min(percentage, 100).ToString();
            }
            catch
            {
                return "0";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fundraiser-page">
        <div class="fundraiser-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-orange-500 to-red-600 rounded-full mb-4">
                        <i class="fas fa-hand-holding-usd text-white text-2xl"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">Fundraiser Campaigns</h2>
                    <p class="text-gray-600">Support verified fundraisers making a difference in communities</p>
                </div>

                <!-- Fundraiser Grid -->
                <div class="form-body">
                    <div class="table-responsive">
                        <asp:GridView ID="gvFundraiser" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="modern-gridview"
                            GridLines="None"
                            AllowPaging="True"
                            PageSize="10">
                            <Columns>                         
                                <asp:BoundField DataField="ID" HeaderText="ID" Visible="false"/>
                                <asp:BoundField DataField="Name" HeaderText="Charity Name">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Fund Progress">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <div>
                                            <span class="amount-badge">
                                                $<%# Eval("FundCollected") != DBNull.Value ? Eval("FundCollected", "{0:N0}") : "0" %> / $<%# Eval("RequiredAmount") != DBNull.Value ? Eval("RequiredAmount", "{0:N0}") : "0" %>
                                            </span>
                                            <div class="progress-bar">
                                                <div class="progress-fill" style="width: <%# GetProgressPercentage(Eval("FundCollected"), Eval("RequiredAmount")) %>%"></div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MMM dd, yyyy}">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TypeOfDonation" HeaderText="Donation Type">
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
                                        <a href='<%# "FundDetails.aspx?FundraiserID=" + Eval("ID") %>' class="details-btn">
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

