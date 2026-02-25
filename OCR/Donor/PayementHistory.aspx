<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="PayementHistory.aspx.cs" Inherits="OCR.Donor.PayementHistory" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="frm" runat="server">--%>
<%--    <div class="jumbotron" style="margin-left: 25px; margin-right: 25px; margin-top: 3%;">
        <h4>Payement History</h4>
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px; margin-top: 1.5%;">
        <div class="col-lg-12 ">
            <div class="table-responsive">
                <asp:GridView ID="grdPaymentHistory" runat="server" Width="100%" Style="display: block; overflow: scroll; white-space: nowrap;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    <Columns>                        
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="DonorName" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="DonationAmount" HeaderText="DonationAmount" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CardHolder" HeaderText="CardHolder" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CVVNumber" HeaderText="CVVNumber" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="FundDonated" HeaderText="FundDonated" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="BillNo" HeaderText="BillNo" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                       <asp:BoundField DataField="BillingAddress" HeaderText="BillingAddress" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="NGOFundraisingRequestID" HeaderText="Fundraising Request ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="NgoID" HeaderText="Ngo ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />   
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
        /* Custom CSS for payment history page - no TailwindCSS conflicts */
        .payment-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .payment-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .payment-page .slide-in { animation: slideIn 0.5s ease-out; }
        .payment-page .pulse-animation { animation: pulse 2s infinite; }
        
        .payment-page .payment-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .payment-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .payment-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .payment-page .form-body {
            padding: 30px;
        }
        
        .payment-page .modern-gridview {
            width: 100%;
            border: 1px solid #e2e8f0;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .payment-page .modern-gridview th {
            background: #1f76bd;
            color: white;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
            border-bottom: 2px solid #667eea;
        }
        
        .payment-page .modern-gridview td {
            padding: 12px 15px;
            border-bottom: 1px solid #e2e8f0;
            color: #333;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .payment-page .modern-gridview tr:nth-child(even) td {
            background: #f8fafc;
        }
        
        .payment-page .modern-gridview tr:hover td {
            background: #f0f4ff;
        }
        
        .payment-page .amount-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            background: #d1fae5;
            color: #065f46;
        }
        
        .payment-page .payment-type-badge {
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            background: #dbeafe;
            color: #1e40af;
        }
        
        .payment-page .text-center {
            text-align: center;
        }
        
        .payment-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .payment-page .mb-2 {
            margin-bottom: 8px;
        }
        
        .payment-page .inline-flex {
            display: inline-flex;
        }
        
        .payment-page .items-center {
            align-items: center;
        }
        
        .payment-page .justify-center {
            justify-content: center;
        }
        
        .payment-page .w-16 {
            width: 64px;
        }
        
        .payment-page .h-16 {
            height: 64px;
        }
        
        .payment-page .rounded-full {
            border-radius: 50%;
        }
        
        .payment-page .text-3xl {
            font-size: 30px;
        }
        
        .payment-page .font-bold {
            font-weight: 700;
        }
        
        .payment-page .text-gray-800 {
            color: #2d3748;
        }
        
        .payment-page .text-gray-600 {
            color: #4a5568;
        }
        
        .payment-page .text-white {
            color: white;
        }
        
        .payment-page .text-2xl {
            font-size: 24px;
        }
        
        .payment-page .mr-2 {
            margin-right: 8px;
        }
        
        .payment-page .mr-4 {
            margin-right: 16px;
        }
        
        .payment-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .payment-page .payment-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .payment-page .modern-gridview {
                font-size: 12px;
            }
            
            .payment-page .modern-gridview th,
            .payment-page .modern-gridview td {
                padding: 10px 8px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="payment-page">
        <div class="payment-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-green-500 to-emerald-600 rounded-full mb-4">
                        <i class="fas fa-receipt text-white text-2xl"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">Payment History</h2>
                    <p class="text-gray-600">View your donation and payment records</p>
                </div>

                <!-- Payment Grid -->
                <div class="form-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grdPaymentHistory" runat="server" 
                            Width="100%" 
                            CssClass="modern-gridview" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="ID" 
                            EmptyDataText="No payment records found."
                            GridLines="None"
                            AllowPaging="True"
                            PageSize="10">
                            <Columns>                        
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                                <asp:BoundField DataField="DonorName" HeaderText="Donor Name">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Amount">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <span class="amount-badge">
                                            ₹<%# Eval("DonationAmount", "{0:N2}") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payment Type">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <span class="payment-type-badge">
                                            <%# Eval("PaymentType") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated To">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BillNo" HeaderText="Bill Number">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                               <%-- <asp:BoundField DataField="NGOFundraisingRequestID" HeaderText="Request ID">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number"> <HeaderStyle CssClass="text-center" />
                                <ItemStyle CssClass="text-center" /> 
                               </asp:BoundField>
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
