<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="Appointment details.aspx.cs" Inherits="OCR.NGO.Appointment_details" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron" style="margin-left: 25px; margin-right: 25px; margin-top: 7%;">
        <h4>Appointments booked by Donor's</h4>
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px; margin-top: 2%;">
        <div class="col-lg-12 ">
            <div class="table-responsive">
                <asp:GridView ID="grdAppointments" runat="server" Width="100%" Style="display: block; overflow: scroll; white-space: nowrap;" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    <Columns>
                         <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button ID="cmdApprove" runat="server" Text="Approve" CssClass="btn btn-primary" OnClick="cmdApprove_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deny">
                            <ItemTemplate>
                                <asp:Button ID="cmdDeny" runat="server" Text="Deny" CssClass="btn btn-primary" OnClick="cmdDeny_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="AppointmentDetail" HeaderText="Appointment Detail" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="AppointmentMinutes" HeaderText="Appointment Minutes" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Status" HeaderText="Appointment Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                       

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for appointment page - no TailwindCSS conflicts */
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
        
        .appointment-page .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .appointment-page .header-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }
        
        .appointment-page .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .appointment-page .page-title i {
            font-size: 1.8rem;
        }
        
        .appointment-page .table-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 25px;
            overflow: hidden;
        }
        
        .appointment-page .modern-gridview {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .appointment-page .modern-gridview th {
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
        
        .appointment-page .modern-gridview th:last-child {
            border-right: none;
        }
        
        .appointment-page .modern-gridview td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: middle;
            font-size: 14px;
        }
        
        .appointment-page .modern-gridview tr:nth-child(even) {
            background-color: #f8fafc;
        }
        
        .appointment-page .modern-gridview tr:hover {
            background-color: #edf2f7;
            transform: scale(1.01);
            transition: all 0.2s ease;
        }
        
        .appointment-page .btn-approve {
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
            margin-right: 5px;
        }
        
        .appointment-page .btn-approve:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
        }
        
        .appointment-page .btn-deny {
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
        
        .appointment-page .btn-deny:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
        }
        
        .appointment-page .status-badge {
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .appointment-page .status-approved {
            background: rgba(34, 197, 94, 0.1);
            color: #16a34a;
        }
        
        .appointment-page .status-pending {
            background: rgba(245, 158, 11, 0.1);
            color: #d97706;
        }
        
        .appointment-page .status-denied {
            background: rgba(239, 68, 68, 0.1);
            color: #dc2626;
        }
        
        .appointment-page .appointment-date {
            font-weight: 600;
            color: #2d3748;
        }
        
        .appointment-page .appointment-time {
            color: #4a5568;
            font-size: 13px;
        }
        
        .appointment-page .empty-data {
            text-align: center;
            padding: 60px 20px;
            color: #64748b;
            font-size: 16px;
        }
        
        .appointment-page .empty-data i {
            font-size: 4rem;
            color: #cbd5e1;
            margin-bottom: 20px;
            display: block;
        }
        
        @media (max-width: 768px) {
            .appointment-page .container {
                padding: 0 15px;
            }
            
            .appointment-page .header-card {
                padding: 20px;
            }
            
            .appointment-page .page-title {
                font-size: 1.5rem;
            }
            
            .appointment-page .table-card {
                padding: 15px;
                overflow-x: auto;
            }
            
            .appointment-page .modern-gridview {
                font-size: 12px;
            }
            
            .appointment-page .modern-gridview th,
            .appointment-page .modern-gridview td {
                padding: 8px 6px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="appointment-page">
        <div class="container">
            <!-- Header Section -->
            <div class="header-card fade-in">
                <h4 class="page-title">
                    <i class="fas fa-calendar-check"></i>
                    Appointments Booked by Donors
                </h4>
            </div>

            <!-- Table Section -->
            <div class="table-card slide-in">
                <div class="table-responsive">
                    <asp:GridView ID="grdAppointments" runat="server" 
                        Width="100%" 
                        CssClass="modern-gridview" 
                        AutoGenerateColumns="False" 
                        OnRowDataBound="grdAppointments_RowDataBound"
                        DataKeyNames="ID" 
                        EmptyDataText="There are no data records to display."
                        GridLines="None">
                        
                        <Columns>
                            <asp:TemplateField HeaderText="Approve">
                                <ItemTemplate>
                                    <asp:Button ID="cmdApprove" runat="server" 
                                        Text="Approve" 
                                        CssClass="btn-approve" 
                                        OnClick="cmdApprove_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Deny">
                                <ItemTemplate>
                                    <asp:Button ID="cmdDeny" runat="server" 
                                        Text="Deny" 
                                        CssClass="btn-deny" 
                                        OnClick="cmdDeny_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                            <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="AppointmentDetail" HeaderText="Appointment Detail" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                            <asp:BoundField DataField="AppointmentDate" HeaderText="Appointment Date" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" DataFormatString="{0:dd-MM-yyyy}" />
                            <asp:BoundField DataField="AppointmentMinutes" HeaderText="Appointment Minutes" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="AppointmentTime" HeaderText="Appointment Time" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                            <asp:BoundField DataField="Status" HeaderText="Appointment Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        </Columns>
                        
                        <EmptyDataTemplate>
                            <div class="empty-data">
                                <i class="fas fa-calendar-times"></i>
                                <p>There are no appointment records to display.</p>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
