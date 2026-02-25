<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="FundRequestHistory.aspx.cs" Inherits="OCR.NGO.FundRequestHistory1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron" style="margin-left: 25px; margin-right: 25px; margin-top: 7%">
        <h3 class="text-danger">Previous Fund details</h3>
        <asp:HiddenField ID="hdnApprovalStatus" runat="server"/>  
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px; margin-top: 2%">
        <asp:Button ID="btnaAddNewRequest" runat="server" Width="20%" Text="Add New Request" OnClick="btnaAddNewRequest_Click" CssClass="btn btn-primary" />
        <div class="col-lg-12 " style="margin-top:1%;">
            <div class="table-responsive">
                <asp:GridView ID="grdFundHistory" runat="server" Width="100%" Style="display: block; overflow: scroll; white-space: nowrap;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    
                    <Columns>
                         <asp:TemplateField HeaderText="Mark Completed">
                            <ItemTemplate>
                                <asp:Button ID="cmdComplete" runat="server" Text="Completed" CssClass="btn btn-primary" OnClick="cmdComplete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false"/>
                        <asp:BoundField DataField="NGOName" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Email" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="DonationAmount" HeaderText="Donation Amount" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="Details" HeaderText="Details" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="FundEndDate" HeaderText="Fund End Date" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Cause" HeaderText="Cause" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="FundCompletedDate" HeaderText="Fund Completed Date" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                       
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>--%>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for fund request page - no TailwindCSS conflicts */
        .fund-request-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .fund-request-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .fund-request-page .slide-in { animation: slideIn 0.5s ease-out; }
        .fund-request-page .pulse-animation { animation: pulse 2s infinite; }
        
        .fund-request-page .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .fund-request-page .header-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }
        
        .fund-request-page .header-title {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .fund-request-page .header-title i {
            font-size: 1.8rem;
        }
        
        .fund-request-page .action-section {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .fund-request-page .btn-add-request {
            background: linear-gradient(135deg, #667eea, #1f76bd);
            color: white;
            padding: 12px 30px 12px 50px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            position: relative;
            display: inline-block;
        }
        
        .fund-request-page .btn-add-request::before {
            content: '\f067';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 14px;
        }
        
        .fund-request-page .btn-add-request:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }
        
        .fund-request-page .table-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 25px;
            overflow: hidden;
        }
        
        .fund-request-page .modern-gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .fund-request-page .modern-gridview th {
            background: linear-gradient(135deg, #667eea, #1f76bd);
            color: white;
            padding: 15px 12px;
            text-align: center;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-right: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .fund-request-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .fund-request-page .modern-gridview td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: middle;
            font-size: 14px;
        }
        
        .fund-request-page .modern-gridview tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .fund-request-page .modern-gridview tr:hover {
            background-color: #edf2f7;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        
        .fund-request-page .btn-complete {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
        }
        
        .fund-request-page .btn-complete:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
        }
        
        .fund-request-page .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .fund-request-page .status-approved {
            background: rgba(34, 197, 94, 0.1);
            color: #16a34a;
        }
        
        .fund-request-page .status-pending {
            background: rgba(245, 158, 11, 0.1);
            color: #d97706;
        }
        
        .fund-request-page .status-rejected {
            background: rgba(239, 68, 68, 0.1);
            color: #dc2626;
        }
        
        .fund-request-page .status-completed {
            background: rgba(59, 130, 246, 0.1);
            color: #2563eb;
        }
        
        .fund-request-page .empty-data {
            text-align: center;
            padding: 60px 20px;
            color: #64748b;
            font-size: 16px;
        }
        
        .fund-request-page .empty-data i {
            font-size: 4rem;
            color: #cbd5e1;
            margin-bottom: 20px;
            display: block;
        }
        
        @media (max-width: 768px) {
            .fund-request-page .container {
                padding: 0 15px;
            }
            
            .fund-request-page .header-card {
                padding: 20px;
            }
            
            .fund-request-page .header-title {
                font-size: 1.5rem;
            }
            
            .fund-request-page .table-card {
                padding: 15px;
                overflow-x: auto;
            }
            
            .fund-request-page .modern-gridview {
                font-size: 12px;
            }
            
            .fund-request-page .modern-gridview th,
            .fund-request-page .modern-gridview td {
                padding: 8px 6px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fund-request-page">
        <div class="container">
            <!-- Header Section -->
            <div class="header-card fade-in">
                <h3 class="header-title">
                    <i class="fas fa-history"></i>
                    Previous Fund Details
                </h3>
                <asp:HiddenField ID="hdnApprovalStatus" runat="server"/>  
            </div>

            <!-- Action Section -->
            <div class="action-section slide-in">
                <asp:Button ID="btnaAddNewRequest" runat="server" 
                    Text="Add New Request" 
                    OnClick="btnaAddNewRequest_Click" 
                    CssClass="btn-add-request" />
            </div>

            <!-- Table Section -->
            <div class="table-card">
                <div class="table-responsive">
                    <asp:GridView ID="grdFundHistory" runat="server" 
                        Width="100%" 
                        CssClass="modern-gridview" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="ID" 
                        EmptyDataText="There are no data records to display."
                        GridLines="None">
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Mark Completed">
                                <ItemTemplate>
                                    <asp:Button ID="cmdComplete" runat="server" 
                                        Text="Completed" 
                                        CssClass="btn-complete" 
                                        OnClick="cmdComplete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false"/>
                            <asp:BoundField DataField="NGOName" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="DonationAmount" HeaderText="Donation Amount" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="Details" HeaderText="Details" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="FundEndDate" HeaderText="Fund End Date" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="Cause" HeaderText="Cause" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="FundCompletedDate" HeaderText="Fund Completed Date" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        </Columns>
                        
                        <EmptyDataTemplate>
                            <div class="empty-data">
                                <i class="fas fa-inbox"></i>
                                <p>There are no fund request records to display.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

