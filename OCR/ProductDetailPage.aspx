<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailPage.aspx.cs" Inherits="OCR.ProductDetailPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <table class="auto-style1">
            <tr>
                <td>Product Name :</td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtProductName" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Product Name"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Product Category</td>
                <td>
                    <asp:DropDownList ID="ddlProductCategory" runat="server">
                        <asp:ListItem Text="Select Category" Value="select" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="New Product" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Product 1" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Product 2" Value="3"></asp:ListItem>
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td>Product FreshNess</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Brand New</asp:ListItem>
                        <asp:ListItem>Second Hand</asp:ListItem>
                        <asp:ListItem>Purchased another</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="RadioButtonList1" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Name of the Head of Organisation"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <td>Image Of Product</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Font-Size="Medium" Height="38px" Width="301px" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="FileUpload1" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please choose file"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Addition Description</td>
                <td>
                    <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>

                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtDesc" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Description"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Product Price</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtPrice" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Price"></asp:RequiredFieldValidator>
                </td>
                <td>MRP</td>
                <td>
                    <asp:TextBox ID="txtMRP" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtMRP" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter MRP"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Phone Number</td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your number" MaxLength="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="txtPhoneNumber" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter phone number"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Mobile number must be 10 digit" ForeColor="Red" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="txtEmail" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
             <tr>
     <td>Comment</td>
     <td>
         <asp:TextBox ID="txtComment" runat="server"></asp:TextBox>

     </td>
     <td>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ControlToValidate="txtDesc" ValidationGroup="RegisterValidate" runat="server" ErrorMessage="Please enter Description"></asp:RequiredFieldValidator>
     </td>
 </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="RegisterValidate"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
