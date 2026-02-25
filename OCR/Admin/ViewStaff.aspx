<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ViewStaff.aspx.cs" Inherits="OCR.Admin.ViewStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="jumbotron" style="margin-left: 25px; margin-right: 25px;">
        <p class="text-danger">Appointment history </p>
        <span class="text-info">Find all your appointment status here!!</span>
    </div>
    <div class="row" style="margin-left: 25px; margin-right: 25px;">
        <div class="col-lg-12 ">
            <div class="table-responsive">
                <asp:GridView ID="grdAppointments" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="ID" EmptyDataText="There are no data records to display.">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                        <asp:BoundField DataField="UserName" HeaderText="User Name" ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="State" HeaderText="State" ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                        <asp:BoundField DataField="City" HeaderText="City" HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />
                        <asp:BoundField DataField="PinCode" HeaderText="PinCode" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="Address" HeaderText="Address" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:BoundField DataField="TypeOfStaff" HeaderText="Type Of Staff" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />                       
                        <asp:BoundField DataField="Status" HeaderText="Status" HeaderStyle-CssClass="visible-xs" ItemStyle-CssClass="visible-xs" />
                        <asp:TemplateField HeaderText="Delete Staff">
                            <ItemTemplate>
                                <asp:Button ID="cmdDelete" runat="server" Text="Delete Staff" CssClass="btn" OnClick="cmdDelete_Click"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
