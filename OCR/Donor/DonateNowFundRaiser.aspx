<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="DonateNowFundRaiser.aspx.cs" Inherits="OCR.Donor.DonateNowFundRaiser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<form id="form1" runat="server">--%>
        <div class="container mt-5 px-5">
            <div class="mb-4">
                <h2>Confirm order and pay</h2>
               
            </div>
            <div class="row">
                <div class="col-md-9">
                    <div class="card p-3">
                        <h6 class="text-uppercase">Payment details</h6>
                        <div class="inputbox mt-3">
                            <label>Name on Card</label>
                            <input type="text" name="name" runat="server" id="txtCardHolder" class="form-control" required="required">
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="inputbox mt-3 mr-2">
                                    <label>Card Number</label>
                                    <input type="text" runat="server" id="txtCardNumber" name="cardnum" maxlength="16" class="form-control" required="required">
                                    <i class="fa fa-credit-card"></i>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex flex-row">
                                    <div class="inputbox mt-3 mr-2">
                                        <label>Expiry Date</label>
                                        <input type="date" runat="server" id="txtExpiryDate" class="form-control" required="required">
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="inputbox mt-3 mr-2">
                                    <label>CVV Number</label>
                                    <input type="text" name="name" id="txtCVV" onchange="isValid_CVV_Number(this.value)" runat="server" class="form-control" required="required">
                                </div>
                                <div class="inputbox mt-3 mr-2">
                                    <label>Amount</label>
                                    <input type="number" name="name" id="txtAmount" runat="server" class="form-control" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="mt-4 mb-4">
                            <h6 class="text-uppercase">Billing Address</h6>
                            <div class="row mt-3">
                                <div class="col-md-6">
                                    <div class="inputbox mt-3 mr-2">
                                        <label>Billing Address</label>
                                        <input type="text" name="name" runat="server" id="txtStreetAddress" class="form-control" required="required">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="inputbox mt-3 mr-2">
                                        <label>City</label>
                                        <input type="text" name="name" runat="server" id="txtCity" class="form-control" required="required">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6">
                                    <div class="inputbox mt-3 mr-2">
                                        <label>State</label>
                                        <input type="text" name="name" runat="server" id="txtState" class="form-control" required="required">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="inputbox mt-3 mr-2">
                                        <label>Zip Code</label>
                                        <input type="text" name="name" runat="server" id="txtZipCode" class="form-control" required="required">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 mb-4 d-flex justify-content-between">
                        <a href="FundDetails.aspx">Previous page</a>
                        <asp:Button ID="btnPayNow" runat="server" Text="Pay Now" OnClick="btnPayNow_Click" CssClass="btn btn-success px-3" />
                    </div>
                </div>

            </div>
        </div>
    <%--</form>--%>
</asp:Content>
