<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OCR.NGO.Contact" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Contact us on</h2>
    <address>
       Kandivali East<br />
        Mumbai, MH 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        9619749449
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:ankit21104@gmail.com">ankit21104@gmail.com</a><br />
        <strong>Marketing:</strong> 
        <a href="mailto:nishantjhait@tsdcmumbai.in">nishantjhait@tsdcmumbai.in</a>
        <a href="https://mail.google.com/mail/?view=cm&fs=1&to=nishantjhait@tsdcmumbai.in" target="_blank">
        nishantjhait@tsdcmumbai.in
</a>
    </address>
</asp:Content>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for contact page - no TailwindCSS conflicts */
        .contact-page {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        
        .contact-page .fade-in { animation: fadeIn 0.6s ease-out; }
        .contact-page .slide-in { animation: slideIn 0.5s ease-out; }
        .contact-page .pulse-animation { animation: pulse 2s infinite; }
        
        .contact-page .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .contact-page .contact-header {
            text-align: center;
            margin-bottom: 50px;
        }
        
        .contact-page .page-title {
            font-size: 2.5rem;
            font-weight: 700;
            color: #667eea;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }
        
        .contact-page .page-title i {
            font-size: 2rem;
        }
        
        .contact-page .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 40px;
        }
        
        .contact-page .contact-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            transition: all 0.3s ease;
            border-left: 5px solid #667eea;
        }
        
        .contact-page .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .contact-page .card-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }
        
        .contact-page .card-icon i {
            font-size: 2rem;
            color: white;
        }
        
        .contact-page .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #2d3748;
            margin: 0 0 20px 0;
        }
        
        .contact-page .address-block {
            font-size: 1.1rem;
            color: #4a5568;
            line-height: 1.8;
            margin-bottom: 15px;
        }
        
        .contact-page .address-block strong {
            color: #2d3748;
            font-weight: 600;
            display: block;
            margin-bottom: 8px;
        }
        
        .contact-page .address-block abbr {
            color: #667eea;
            font-weight: 600;
        }
        
        .contact-page .contact-links {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .contact-page .contact-link {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 15px 20px;
            background: #f8fafc;
            border-radius: 12px;
            text-decoration: none;
            color: #4a5568;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }
        
        .contact-page .contact-link:hover {
            background: white;
            border-color: #667eea;
            color: #667eea;
            transform: translateX(5px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.1);
        }
        
        .contact-page .contact-link i {
            font-size: 1.2rem;
            color: #667eea;
            width: 25px;
            text-align: center;
        }
        
        .contact-page .contact-link strong {
            font-weight: 600;
            color: #2d3748;
            margin-right: 8px;
        }
        
        .contact-page .contact-link:hover strong {
            color: #667eea;
        }
        
        @media (max-width: 768px) {
            .contact-page .container {
                padding: 0 15px;
            }
            
            .contact-page .page-title {
                font-size: 2rem;
            }
            
            .contact-page .contact-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .contact-page .contact-card {
                padding: 30px 20px;
            }
            
            .contact-page .card-icon {
                width: 60px;
                height: 60px;
            }
            
            .contact-page .card-icon i {
                font-size: 1.5rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-page">
        <div class="container">
            <!-- Header Section -->
            <div class="contact-header fade-in">
                <h2 class="page-title">
                    <i class="fas fa-envelope-open-text"></i>
                    Contact Us
                </h2>
            </div>

            <!-- Contact Grid -->
            <div class="contact-grid">
                <!-- Physical Address Card -->
                <div class="contact-card slide-in">
                    <div class="card-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <h3 class="card-title">Our Location</h3>
                    <div class="address-block">
                        <strong>Office Address</strong>
                        Kandivali East<br />
                        Mumbai, MH 98052-6399<br />
                        <abbr title="Phone">P:</abbr>
                        9619749449
                    </div>
                </div>

                <!-- Email Contact Card -->
                <div class="contact-card slide-in">
                    <div class="card-icon">
                        <i class="fas fa-at"></i>
                    </div>
                    <h3 class="card-title">Email Us</h3>
                    <div class="contact-links">
                        <a href="https://mail.google.com/mail/?view=cm&fs=1&to=ankit21104@gmail.com" target="_blank" class="contact-link">
                            <i class="fas fa-headset"></i>
                            <strong>Support:</strong>
                            ankit21104@gmail.com
                        </a>
                       <a href="https://mail.google.com/mail/?view=cm&fs=1&to=nishantjhait@tsdcmumbai.in" target="_blank" class="contact-link">
                        
                            <i class="fas fa-bullhorn"></i>
                            <strong>Marketing:</strong>
                            nishantjhait@tsdcmumbai.in
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

