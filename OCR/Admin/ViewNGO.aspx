<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewNGO.aspx.cs" Inherits="OCR.Admin.ViewNGO" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron" style="margin-left: 25px; margin-right: 25px;">
         <h3>NGO List</h3>  
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px;">
        <div class="col-lg-12 ">
            <div class="table-responsive">
                <asp:GridView ID="grdNGO" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    <Columns>

                        <asp:TemplateField HeaderText="Download" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="cmdDownLoad" runat="server" Text="Download Document" CssClass="btn btn-primary btn-sm" OnClick="cmdDownLoad_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button ID="cmdValid" runat="server" Text="Approve" CssClass="btn btn-primary btn-sm" OnClick="cmdValid_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reject">
                            <ItemTemplate>
                                <asp:Button ID="cmdInValid" runat="server" Text="Reject" CssClass="btn btn-primary btn-sm" OnClick="cmdInValid_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete NGO">
                            <ItemTemplate>
                                <asp:Button ID="cmdDelete" runat="server" Text="Delete NGO" CssClass="btn btn-primary btn-sm" OnClick="cmdDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="State" HeaderText="State" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="ApprovalByAdmin" HeaderText="Approval Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Proofofidentication" HeaderText="Proofofidentication" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>--%>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Modern CSS for NGO View - no TailwindCSS conflicts */
        .ngo-view-page {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Inter', sans-serif;
            padding: 30px;
            position: relative;
        }
        
        .ngo-view-page::before {
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
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .page-title::before {
            content: '🏛️';
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
        
        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 6px;
            align-items: center;
        }
        
        .btn-download {
            background: linear-gradient(135deg, #4299e1, #3182ce);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-download:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(66, 153, 225, 0.3);
        }
        
        .btn-approve {
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-approve:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(72, 187, 120, 0.3);
        }
        
        .btn-reject {
            background: linear-gradient(135deg, #f56565, #e53e3e);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-reject:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(245, 101, 101, 0.3);
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #ed8936, #dd6b20);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .btn-delete:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(237, 137, 54, 0.3);
        }
        
        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .status-approved {
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
        }
        
        .status-pending {
            background: linear-gradient(135deg, #ed8936, #dd6b20);
            color: white;
        }
        
        .status-rejected {
            background: linear-gradient(135deg, #f56565, #e53e3e);
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
            .ngo-view-page {
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
            
            .action-buttons {
                gap: 4px;
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
            
            .btn-download,
            .btn-approve,
            .btn-reject,
            .btn-delete {
                padding: 4px 8px;
                font-size: 10px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ngo-view-page">
        <div class="page-header">
            <h3 class="page-title">NGO Management</h3>
        </div>
        
        <div class="content-container">
            <div class="table-responsive">
                <asp:GridView ID="grdNGO" runat="server" Width="100%" 
                    CssClass="modern-gridview" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="ID" 
                    EmptyDataText="There are no data records to display.">
                    <Columns>
                   <%--     <asp:TemplateField HeaderText="Download" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:Button ID="cmdDownLoad" runat="server" Text="Download" CssClass="btn-download" OnClick="cmdDownLoad_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Approve">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:Button ID="cmdValid" runat="server" Text="Approve" CssClass="btn-approve" OnClick="cmdValid_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reject">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:Button ID="cmdInValid" runat="server" Text="Reject" CssClass="btn-reject" OnClick="cmdInValid_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" CssClass="btn-delete" OnClick="cmdDelete_Click" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="State" HeaderText="State" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <%--<asp:BoundField DataField="ApprovalByAdmin" HeaderText="Approval Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />--%>
                        <%--<asp:BoundField DataField="Proofofidentication" HeaderText="Proof of ID" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

