<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="ViewAppointment.aspx.cs" Inherits="OCR.Donor.ViewAppointment" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <form id="frm" runat="server">
<div style="margin-left:25px;margin-right:25px;margin-top:2%;">  
    <h3>Appointment history </h3>  
</div>  
<div class="row" style="margin-left: 8px;margin-right:25px;margin-top: 1.5%;">  
    <div class="col-lg-12 ">  
        <div class="table-responsive">  
            <asp:GridView ID="grdAppointments" runat="server" Width="100%" style="display: block; overflow: scroll; white-space: nowrap;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">  
                <Columns>  
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />  
                    <asp:BoundField DataField="Name" HeaderText="Name" />  
                    <asp:BoundField DataField="UserName" HeaderText="User Name"/>  
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number"/>  
                    <asp:BoundField DataField="Email" HeaderText="Email"/>  
                    <asp:BoundField DataField="AppointmentDetail" HeaderText="Appointment Detail"/>  
                    <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date"/>  
                    <asp:BoundField DataField="AppointmentMinutes" HeaderText="Appointment Minutes"/>  
                    <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time"/> 
                    <asp:BoundField DataField="AppointmentWith" HeaderText="Appointment With"/>
                    <asp:BoundField DataField="NGOName" HeaderText="NGO Name"/>
                    <asp:BoundField DataField="FundraiserName" HeaderText="Fundraiser Name"/>
                    <asp:BoundField DataField="Status" HeaderText="Appointment Status"/>  
                </Columns>  
            </asp:GridView>  
        </div>  
    </div>  
</div>
    </form>
                      
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for view appointment page - no TailwindCSS conflicts */
        .appointment-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .appointment-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .appointment-page .slide-in { animation: slideIn 0.5s ease-out; }
        .appointment-page .pulse-animation { animation: pulse 2s infinite; }
        
        .appointment-page .appointment-container {
            max-width: 1900px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .appointment-page .form-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .appointment-page .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }
        
        .appointment-page .form-body {
            padding: 30px;
        }
        
        .appointment-page .modern-gridview {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .appointment-page .modern-gridview th {
            background: linear-gradient(135deg, #667eea, #1f76bd);
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border: none;
        }
        
        .appointment-page .modern-gridview td {
            padding: 15px 12px;
            border-bottom: 1px solid #e2e8f0;
            color: #333;
            font-size: 14px;
            vertical-align: middle;
        }
        
        .appointment-page .modern-gridview tr:hover td {
            background: #f8fafc;
        }
        
        .appointment-page .modern-gridview tr:last-child td {
            border-bottom: none;
        }
        
        .appointment-page .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            display: inline-block;
        }
        
        .appointment-page .status-pending {
            background: #fef3c7;
            color: #92400e;
        }
        
        .appointment-page .status-confirmed {
            background: #d1fae5;
            color: #065f46;
        }
        
        .appointment-page .status-cancelled {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .appointment-page .status-completed {
            background: #dbeafe;
            color: #1e40af;
        }
        
        .appointment-page .table-responsive {
            overflow-x: auto;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .appointment-page .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
        }
        
        .appointment-page .empty-state i {
            font-size: 64px;
            color: #d1d5db;
            margin-bottom: 20px;
        }
        
        .appointment-page .empty-state h3 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #374151;
        }
        
        .appointment-page .empty-state p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        
        .appointment-page .filter-section {
            background: #f8fafc;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 25px;
            border: 1px solid #e2e8f0;
        }
        
        .appointment-page .filter-group {
            display: flex;
            gap: 15px;
            align-items: end;
            flex-wrap: wrap;
        }
        
        .appointment-page .filter-input {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            transition: all 0.3s ease;
            color: #333;
            box-sizing: border-box;
        }
        
        .appointment-page .filter-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            background: #fafbff;
        }
        
        .appointment-page .filter-select {
            background: white;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            transition: all 0.3s ease;
            color: #333;
            cursor: pointer;
            box-sizing: border-box;
        }
        
        .appointment-page .filter-select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            background: #fafbff;
        }
        
        .appointment-page .filter-btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .appointment-page .filter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }
        
        .appointment-page .text-center {
            text-align: center;
        }
        
        .appointment-page .mb-8 {
            margin-bottom: 32px;
        }
        
        .appointment-page .mb-4 {
            margin-bottom: 16px;
        }
        
        .appointment-page .mb-2 {
            margin-bottom: 8px;
        }
        
        .appointment-page .mt-4 {
            margin-top: 16px;
        }
        
        .appointment-page .inline-flex {
            display: inline-flex;
        }
        
        .appointment-page .items-center {
            align-items: center;
        }
        
        .appointment-page .justify-center {
            justify-content: center;
        }
        
        .appointment-page .w-16 {
            width: 64px;
        }
        
        .appointment-page .h-16 {
            height: 64px;
        }
        
        .appointment-page .rounded-full {
            border-radius: 50%;
        }
        
        .appointment-page .text-3xl {
            font-size: 30px;
        }
        
        .appointment-page .font-bold {
            font-weight: 700;
        }
        
        .appointment-page .text-gray-800 {
            color: #2d3748;
        }
        
        .appointment-page .text-gray-600 {
            color: #4a5568;
        }
        
        .appointment-page .text-white {
            color: white;
        }
        
        .appointment-page .text-2xl {
            font-size: 24px;
        }
        
        .appointment-page .mr-2 {
            margin-right: 8px;
        }
        
        .appointment-page .mr-3 {
            margin-right: 12px;
        }
        
        .appointment-page .mr-4 {
            margin-right: 16px;
        }
        
        .appointment-page .p-8 {
            padding: 32px;
        }
        
        @media (max-width: 768px) {
            .appointment-page .appointment-container {
                max-width: 100%;
                padding: 0 15px;
            }
            
            .appointment-page .filter-group {
                flex-direction: column;
                align-items: stretch;
            }
            
            .appointment-page .modern-gridview {
                font-size: 12px;
            }
            
            .appointment-page .modern-gridview th,
            .appointment-page .modern-gridview td {
                padding: 10px 8px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div class="appointment-page">
        <div class="appointment-container">
            <div class="form-card p-8 fade-in">
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="inline-flex items-center justify-center w-16 h-16 bg-gradient-to-r from-blue-500 to-indigo-600 rounded-full mb-4">
                        <i class="fas fa-calendar-alt text-white text-2xl"></i>
                    </div>
                    <h2 class="text-3xl font-bold text-gray-800 mb-2">My Appointments</h2>
                    <p class="text-gray-600">View your appointment history and details</p>
                </div>

                <!-- Filter Section -->
              <%--  <div class="filter-section">
                    <div class="filter-group">
                        <div style="flex: 1;">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input" placeholder="Search appointments..." Width="100%"></asp:TextBox>
                        </div>
                        <div>
                            <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="filter-select">
                                <asp:ListItem Value="">All Status</asp:ListItem>
                                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                                <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                                <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                <asp:ListItem Value="Completed">Completed</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:DropDownList ID="ddlDateFilter" runat="server" CssClass="filter-select">
                                <asp:ListItem Value="">All Dates</asp:ListItem>
                                <asp:ListItem Value="Today">Today</asp:ListItem>
                                <asp:ListItem Value="ThisWeek">This Week</asp:ListItem>
                                <asp:ListItem Value="ThisMonth">This Month</asp:ListItem>
                                <asp:ListItem Value="Upcoming">Upcoming</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Button ID="btnFilter" runat="server" CssClass="filter-btn" Text="Apply Filter" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                </div>--%>

                <!-- Appointments Grid -->
                <div class="form-body">
                    <div class="table-responsive">
                        <asp:GridView ID="grdAppointments" runat="server" 
                            Width="100%" 
                            CssClass="modern-gridview" 
                            AutoGenerateColumns="False" 
                            DataKeyNames="ID" 
                            EmptyDataText="No appointments found."
                            GridLines="None"
                            AllowPaging="True"
                            PageSize="10">
                            <Columns>  
                                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />  
                                <asp:BoundField DataField="Name" HeaderText="Name" >
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="UserName" HeaderText="User Name">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email" HeaderText="Email">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppointmentDetail" HeaderText="Purpose">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppointmentDate" HeaderText="Date" DataFormatString="{0:MMM dd, yyyy}">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppointmentTime" HeaderText="Time">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppointmentMinutes" HeaderText="Duration">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AppointmentWith" HeaderText="With">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NGOName" HeaderText="NGO">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FundraiserName" HeaderText="Fundraiser">
                                    <HeaderStyle CssClass="text-left" />
                                    <ItemStyle CssClass="text-left" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Status">
                                    <HeaderStyle CssClass="text-center" />
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <span class="status-badge status-<%# Eval("Status").ToString().ToLower() %>">
                                            <%# Eval("Status") %>
                                        </span>
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

