<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="DonateNow.aspx.cs" Inherits="OCR.Donor.DonateNow" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <script type="text/javascript">
        //document.addEventListener("submit", function (e) {
        //    e.preventDefault();
        //    return false;
        //});

        function openRazorpay() {
            debugger;
            var amount = document.getElementById('<%= txtAmount.ClientID %>').value;
            if (!amount || parseInt(amount) <= 0) {
                alert("Enter valid amount");
                return false;
            }

            var options = {
                key: "<%= ConfigurationManager.AppSettings["RazorpayKey"] %>",
               amount: amount * 100,
               currency: "INR",
               name: "Helping Hands",
               description: "NGO Donation",

               handler: function (response) {
                   debugger;
                   // store values for server
                   document.getElementById('<%= hfAmount.ClientID %>').value = amount;
            document.getElementById('<%= hfPaymentId.ClientID %>').value = response.razorpay_payment_id;

            // trigger server-side save
            document.getElementById('<%= btnHiddenSave.ClientID %>').click();
                }
            };

            var rzp = new Razorpay(options);
            rzp.open();
            return false;
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnablePageMethods="true" />
    <asp:HiddenField ID="hfRazorpayKey" runat="server" />
    <asp:HiddenField ID="hfNgoId" runat="server" />
    <asp:HiddenField ID="hfDonorId" runat="server" />
    <asp:HiddenField ID="hfDonorName" runat="server" />
    <asp:HiddenField ID="hfFundReqId" runat="server" />
    <asp:HiddenField ID="hfAmount" runat="server" />
    <asp:HiddenField ID="hfPaymentId" runat="server" />
    <asp:Button ID="btnHiddenSave"
        runat="server"
        OnClick="btnHiddenSave_Click"
        Style="display: none;" />

    <div class="container mt-5 px-5">
        <h2>Confirm Donation</h2>

        <div class="card p-4">

            <div class="form-group">
                <label>Donation Amount (₹)</label>
                <input type="number" id="txtAmount" runat="server"
                    class="form-control" required />
            </div>

            <h5 class="mt-4">Billing Address</h5>

            <div class="form-group">
                <label>Street Address</label>
                <input type="text" id="txtStreetAddress" runat="server"
                    class="form-control" required />
            </div>

            <div class="form-group">
                <label>City</label>
                <input type="text" id="txtCity" runat="server"
                    class="form-control" required />
            </div>

            <div class="form-group">
                <label>State</label>
                <input type="text" id="txtState" runat="server"
                    class="form-control" required />
            </div>

            <div class="form-group">
                <label>Zip Code</label>
                <input type="text" id="txtZipCode" runat="server"
                    class="form-control" maxlength="6" required />
            </div>

            <div class="mt-4">
                <asp:Button ID="btnPayNow" runat="server"
                    Text="Pay Now"
                    CssClass="btn btn-success"
                    OnClientClick="openRazorpay(); return false;" />
            </div>

        </div>
    </div>

</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .donate-wrapper {
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #607d8b 100%);
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .donate-container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .donate-header {
            background: linear-gradient(135deg, #667eea 0%, #e91e92 100%);
            padding: 40px 30px;
            text-align: center;
            color: white;
        }

        .donate-header h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .donate-header p {
            font-size: 16px;
            opacity: 0.95;
            font-weight: 400;
        }

        .donate-icon {
            width: 64px;
            height: 64px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            font-size: 32px;
        }

        .donate-body {
            padding: 40px 30px;
        }

        .form-section {
            margin-bottom: 32px;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-icon {
            width: 28px;
            height: 28px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: #f7fafc;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            background: white;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-control:hover {
            border-color: #cbd5e0;
        }

        .amount-input-wrapper {
            position: relative;
        }

        .currency-symbol {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            font-weight: 600;
            color: #667eea;
        }

        .amount-input {
            padding-left: 40px;
            font-size: 20px;
            font-weight: 600;
            color: #1a202c;
        }

        .address-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .btn-pay {
            width: 100%;
            padding: 18px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
            letter-spacing: 0.5px;
        }

        .btn-pay:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .btn-pay:active {
            transform: translateY(0);
        }

        .security-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 20px;
            padding: 12px;
            background: #f0fdf4;
            border-radius: 8px;
            color: #166534;
            font-size: 13px;
            font-weight: 500;
        }

        .security-icon {
            font-size: 16px;
        }

        @media (max-width: 640px) {
            .donate-wrapper {
                padding: 20px 10px;
            }

            .donate-header {
                padding: 30px 20px;
            }

            .donate-header h2 {
                font-size: 26px;
            }

            .donate-body {
                padding: 30px 20px;
            }

            .address-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <script type="text/javascript">
        function openRazorpay() {
            debugger;
            var amount = document.getElementById('<%= txtAmount.ClientID %>').value;
            if (!amount || parseInt(amount) <= 0) {
                alert("Please enter a valid donation amount");
                return false;
            }
            var options = {

                key: "<%= ConfigurationManager.AppSettings["RazorpayKey"] %>",
                amount: amount * 100,
                currency: "INR",
                name: "Helping Hands",
                description: "NGO Donation",
                handler: function (response) {
                    debugger;
                    document.getElementById('<%= hfAmount.ClientID %>').value = amount;
                    document.getElementById('<%= hfPaymentId.ClientID %>').value = response.razorpay_payment_id;
                    document.getElementById('<%= btnHiddenSave.ClientID %>').click();
                }
            };
            var rzp = new Razorpay(options);
            rzp.open();
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" EnablePageMethods="true" />
    <asp:HiddenField ID="hfRazorpayKey" runat="server" />
    <asp:HiddenField ID="hfNgoId" runat="server" />
    <asp:HiddenField ID="hfDonorId" runat="server" />
    <asp:HiddenField ID="hfDonorName" runat="server" />
    <asp:HiddenField ID="hfFundReqId" runat="server" />
    <asp:HiddenField ID="hfAmount" runat="server" />
    <asp:HiddenField ID="hfPaymentId" runat="server" />
    <asp:Button ID="btnHiddenSave"
        runat="server"
        OnClick="btnHiddenSave_Click"
        Style="display: none;" />

    <div class="donate-wrapper">
        <div class="donate-container">
            <div class="donate-header">
                <div class="donate-icon">💝</div>
                <h2>Make a Difference</h2>
                <p>Your generosity changes lives</p>
            </div>

            <div class="donate-body">
                <div class="form-section">
                    <div class="section-title">
                        <div class="section-icon">₹</div>
                        Donation Amount
                    </div>
                    <div class="form-group">
                        <label>How much would you like to donate?</label>
                        <div class="amount-input-wrapper">
                            <span class="currency-symbol">₹</span>
                            <input type="number" id="txtAmount" runat="server"
                                class="form-control amount-input"
                                placeholder="1000"
                                required />
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <div class="section-title">
                        <div class="section-icon">📍</div>
                        Billing Address
                    </div>
                    <div class="form-group full-width">
                        <label>Street Address</label>
                        <input type="text" id="txtStreetAddress" runat="server"
                            class="form-control"
                            placeholder="123 Main Street"
                            required />
                    </div>
                    <div class="address-grid">
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" id="txtCity" runat="server"
                                class="form-control"
                                placeholder="Mumbai"
                                required />
                        </div>
                        <div class="form-group">
                            <label>State</label>
                            <input type="text" id="txtState" runat="server"
                                class="form-control"
                                placeholder="Maharashtra"
                                required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Zip Code</label>
                        <input type="text" id="txtZipCode" runat="server"
                            class="form-control"
                            placeholder="400001"
                            maxlength="6"
                            required />
                    </div>
                </div>

                <asp:Button ID="btnPayNow" runat="server"
                    Text="Complete Donation"
                    CssClass="btn-pay"
                    OnClientClick="openRazorpay(); return false;" />

                <div class="security-badge">
                    <span class="security-icon">🔒</span>
                    Secured by Razorpay • Your payment is 100% safe
                </div>
            </div>
        </div>
    </div>
</asp:Content>
