<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewPaymentHistory.aspx.cs" Inherits="OCR.Admin.ViewPaymentHistory" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="jumbotron" style="margin-left: 25px; margin-right: 25px; margin-top: 3%;">
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
                        <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CardHolder" HeaderText="Card Holder Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CVVNumber" HeaderText="CVV Number" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="BillNo" HeaderText="Bill No" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                       <asp:BoundField DataField="BillingAddress" HeaderText="Billing Address" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="NGOFundraisingRequestID" HeaderText="Fundraising Request ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="NgoID" HeaderText="Ngo ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />   
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Modern CSS for Payment History View - no TailwindCSS conflicts */
        .payment-history-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            padding: 30px;
            position: relative;
        }
        
        .payment-history-page::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.05" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }
        
        .page-header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 16px;
            padding: 24px 32px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
        }
        
        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1a202c;
            margin: 0;
            background: linear-gradient(135deg, #38a169, #2f855a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .page-title::before {
            content: '💳';
            font-size: 32px;
            -webkit-text-fill-color: initial;
        }
        
        .content-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
        }
        
        .modern-gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        .modern-gridview th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 16px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }
        
        .modern-gridview td {
            padding: 16px 12px;
            border-right: 1px solid #e2e8f0;
            border-bottom: 1px solid #e2e8f0;
            color: #2d3748;
            font-weight: 500;
            background: white;
            vertical-align: middle;
        }
        
        .modern-gridview td:last-child {
            border-right: none;
        }
        
        .modern-gridview tr:last-child td {
            border-bottom: none;
        }
        
        .modern-gridview tr:hover td {
            background: #f8fafc;
        }
        
        .amount-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .payment-type-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .payment-card {
            background: linear-gradient(135deg, #4299e1, #3182ce);
            color: white;
        }
        
        .payment-upi {
            background: linear-gradient(135deg, #ed8936, #dd6b20);
            color: white;
        }
        
        .payment-cash {
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
        }
        
        .empty-data {
            text-align: center;
            padding: 60px 20px;
            color: #718096;
            font-size: 16px;
            font-style: italic;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .payment-history-page {
                padding: 20px 15px;
            }
            
            .page-header {
                padding: 20px;
                margin-bottom: 20px;
            }
            
            .page-title {
                font-size: 24px;
            }
            
            .content-container {
                padding: 20px;
            }
            
            .modern-gridview {
                font-size: 14px;
            }
            
            .modern-gridview th,
            .modern-gridview td {
                padding: 12px 8px;
            }
        }
        
        @media (max-width: 480px) {
            .page-title {
                font-size: 20px;
            }
            
            .modern-gridview th,
            .modern-gridview td {
                padding: 8px 6px;
                font-size: 12px;
            }
            
            .amount-badge,
            .payment-type-badge {
                padding: 2px 6px;
                font-size: 9px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="payment-history-page">
        <div class="page-header">
            <h3 class="page-title">Payment History</h3>
        </div>
        
        <div class="content-container">
            <div class="table-responsive">
                <asp:GridView ID="grdPaymentHistory" runat="server" Width="100%" 
                    CssClass="modern-gridview" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="ID" 
                    EmptyDataText="There are no data records to display.">
                    <Columns>                        
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="DonorName" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="DonationAmount" HeaderText="Donation Amount" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CardHolder" HeaderText="Card Holder Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="CVVNumber" HeaderText="CVV Number" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="FundDonated" HeaderText="Fund Donated" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="BillNo" HeaderText="Bill No" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="BillingAddress" HeaderText="Billing Address" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                       <%-- <asp:BoundField DataField="NGOFundraisingRequestID" HeaderText="Fundraising Request ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="NgoID" HeaderText="Ngo ID" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />   --%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

