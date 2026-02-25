<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="DonorLists.aspx.cs" Inherits="OCR.NGO.DonorLists" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="jumbotron" style="margin-left: 25px; margin-right: 25px;">
        <h3>Donor List</h3>
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px;">
        <div class="col-lg-12 ">
            <div class="table-responsive">
                <asp:GridView ID="grdDonors" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="DonorName" HeaderText="Donor Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="State" HeaderText="State" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="BillingAddress" HeaderText="Billing Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="BillNo" HeaderText="Bill Number" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                      </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for donor list page - no TailwindCSS conflicts */
        .donor-list-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .donor-list-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .donor-list-page .slide-in { animation: slideIn 0.5s ease-out; }
        .donor-list-page .pulse-animation { animation: pulse 2s infinite; }
        
        .donor-list-page .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .donor-list-page .header-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }
        
        .donor-list-page .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .donor-list-page .page-title i {
            font-size: 1.8rem;
        }
        
        .donor-list-page .table-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 25px;
            overflow: hidden;
        }
        
        .donor-list-page .modern-gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .donor-list-page .modern-gridview th {
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
        
        .donor-list-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .donor-list-page .modern-gridview td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: middle;
            font-size: 14px;
        }
        
        .donor-list-page .modern-gridview tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .donor-list-page .modern-gridview tr:hover {
            background-color: #edf2f7;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        
        .donor-list-page .donor-name {
            font-weight: 600;
            color: #2d3748;
        }
        
        .donor-list-page .fund-amount {
            font-weight: 700;
            color: #16a34a;
            font-size: 15px;
        }
        
        .donor-list-page .contact-info {
            color: #4a5568;
            font-size: 13px;
        }
        
        .donor-list-page .empty-data {
            text-align: center;
            padding: 60px 20px;
            color: #64748b;
            font-size: 16px;
        }
        
        .donor-list-page .empty-data i {
            font-size: 4rem;
            color: #cbd5e1;
            margin-bottom: 20px;
            display: block;
        }
        
        @media (max-width: 768px) {
            .donor-list-page .container {
                padding: 0 15px;
            }
            
            .donor-list-page .header-card {
                padding: 20px;
            }
            
            .donor-list-page .page-title {
                font-size: 1.5rem;
            }
            
            .donor-list-page .table-card {
                padding: 15px;
                overflow-x: auto;
            }
            
            .donor-list-page .modern-gridview {
                font-size: 12px;
            }
            
            .donor-list-page .modern-gridview th,
            .donor-list-page .modern-gridview td {
                padding: 8px 6px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="donor-list-page">
        <div class="container">
            <!-- Header Section -->
            <div class="header-card fade-in">
                <h3 class="page-title">
                    <i class="fas fa-users"></i>
                    Donor List
                </h3>
            </div>

            <!-- Table Section -->
            <div class="table-card slide-in">
                <div class="table-responsive">
                    <asp:GridView ID="grdDonors" runat="server" 
                        Width="100%" 
                        CssClass="modern-gridview" 
                        AutoGenerateColumns="False" 
                        DataKeyNames="ID" 
                        EmptyDataText="There are no data records to display."
                        GridLines="None">
                        
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                            <asp:BoundField DataField="DonorName" HeaderText="Donor Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="State" HeaderText="State" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="BillingAddress" HeaderText="Billing Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="BillNo" HeaderText="Bill Number" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        </Columns>
                        
                        <EmptyDataTemplate>
                            <div class="empty-data">
                                <i class="fas fa-user-friends"></i>
                                <p>There are no donor records to display.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
