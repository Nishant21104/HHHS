<%@ Page Title="About" Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OCR.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Donor Home Page</title>
    <link href="styles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <h1>Donor Home Page</h1>
                <nav>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="DonationPage.aspx">Make a Donation</a></li>
                        <li><a href="DonorProfile.aspx">My Profile</a></li>
                        <li><a href="Logout.aspx">Logout</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="container">
            <h2>Welcome, <asp:Literal ID="litDonorName" runat="server"></asp:Literal>!</h2>
            <div>
                <!-- Display donor-related information here -->
                <p>Your donation history:</p>
                <asp:GridView ID="gvDonationHistory" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" />
                        <asp:BoundField DataField="CharityName" HeaderText="Charity Name" />
                        <!-- Add more columns as needed -->
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
