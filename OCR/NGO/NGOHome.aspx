<%@ Page Title="" Language="C#" MasterPageFile="~/NGO/NGO.Master" AutoEventWireup="true" CodeBehind="NGOHome.aspx.cs" Inherits="OCR.NGO.Home" %>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero" class="hero">
    <div class="container position-relative">
      <div class="row gy-5" data-aos="fade-in">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start">
          <h2>Welcome <asp:Label ID="lblUserName" runat="server"></asp:Label></h2>
          <p>It’s not how much we give but how much love we put into giving.</p>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="AboutUs.aspx" class="btn-get-started">Get Started</a>
            <a href="#" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2">
          <img src="assets/images/home-1.jpg" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="100">
        </div>
      </div>
    </div>
    </section>
    <section id="stats-counter" class="stats-counter">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4 align-items-center">

          <div class="col-lg-6">
            <img src="assets/img/stats-img.svg" alt="" class="img-fluid">
          </div>

          <div class="col-lg-6">

            <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Happy people</strong> who have seeked help from our system.</p>
            </div><!-- End Stats Item -->

            <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>NGO's</strong> who have helped in a critical part in developing society, improving communities, and promoting citizen participation</p>
            </div><!-- End Stats Item -->

            <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="453" data-purecounter-duration="1" class="purecounter"></span>
              <p><strong>Top Donor's</strong> who have helped to bring smile on people's face</p>
            </div><!-- End Stats Item -->

          </div>

        </div>

      </div>
    </section>

</asp:Content>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Custom CSS for NGO home page - maintaining existing color scheme */
        .ngo-home-page {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        @keyframes fadeIn { from { opacity: 0; transform: translateY(-10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes slideIn { from { opacity: 0; transform: translateX(-20px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes zoomOut { from { opacity: 0; transform: scale(1.1); } to { opacity: 1; transform: scale(1); } }
        @keyframes countUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        
        .ngo-home-page .fade-in { animation: fadeIn 0.8s ease-out; }
        .ngo-home-page .slide-in { animation: slideIn 0.6s ease-out; }
        .ngo-home-page .zoom-out { animation: zoomOut 0.8s ease-out; }
        .ngo-home-page .count-up { animation: countUp 1s ease-out; }
        
        /* Hero Section */
        .ngo-home-page .hero {
            background: linear-gradient(135deg, #1f76bd 0%, #1f76bd 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }
        
        .ngo-home-page .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,96C1248,75,1344,53,1392,42.7L1440,32L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }
        
        .ngo-home-page .hero-container {
            position: relative;
            z-index: 2;
        }
        
        .ngo-home-page .hero-content {
            color: white;
        }
        
        .ngo-home-page .hero h2 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .ngo-home-page .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.95;
            font-weight: 300;
        }
        
        .ngo-home-page .hero-actions {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }
        
        .ngo-home-page .btn-get-started {
            background: linear-gradient(135deg, #f59e0b, #ef4444);
            color: white;
            padding: 15px 35px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3);
            display: inline-flex;
            align-items: center;
        }
        
        .ngo-home-page .btn-get-started:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.4);
            color: white;
        }
        
        .ngo-home-page .btn-watch-video {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 15px 25px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.3);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .ngo-home-page .btn-watch-video:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            color: white;
        }
        
        .ngo-home-page .hero-image {
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        
        .ngo-home-page .hero-image:hover {
            transform: scale(1.05);
        }
        
        /* Stats Counter Section */
        .ngo-home-page .stats-counter {
            padding: 100px 0;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        }
        
        .ngo-home-page .stats-item {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
            border-left: 4px solid #667eea;
            transition: all 0.3s ease;
        }
        
        .ngo-home-page .stats-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        
        .ngo-home-page .stats-number {
            font-size: 3rem;
            font-weight: 700;
            color: #667eea;
            margin-right: 1.5rem;
            min-width: 100px;
            text-align: center;
        }
        
        .ngo-home-page .stats-text {
            flex: 1;
        }
        
        .ngo-home-page .stats-text strong {
            color: #2d3748;
            font-size: 1.2rem;
            display: block;
            margin-bottom: 0.5rem;
        }
        
        .ngo-home-page .stats-text p {
            color: #4a5568;
            margin: 0;
            line-height: 1.6;
        }
        
        .ngo-home-page .stats-image {
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .ngo-home-page .hero h2 {
                font-size: 2.5rem;
            }
            
            .ngo-home-page .hero p {
                font-size: 1.1rem;
            }
            
            .ngo-home-page .hero-actions {
                justify-content: center;
            }
            
            .ngo-home-page .stats-number {
                font-size: 2rem;
                min-width: 80px;
            }
            
            .ngo-home-page .stats-counter {
                padding: 60px 0;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ngo-home-page">
        <!-- Hero Section -->
        <section id="hero" class="hero">
            <div class="container hero-container position-relative">
                <div class="row gy-5">
                    <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start hero-content fade-in">
                        <h2>Welcome <asp:Label ID="lblUserName" runat="server"></asp:Label></h2>
                        <p>It's not how much we give but how much love we put into giving.</p>
                        <div class="d-flex justify-content-center justify-content-lg-start">
                          <a href="#" class="btn-get-started">Get Started</a>
                            <a href="#" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
                        </div>
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2">
                        <img src="assets/images/home-1.jpg" class="img-fluid hero-image zoom-out" alt="Hero Image">
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Counter Section -->
        <section id="stats-counter" class="stats-counter">
            <div class="container">
                <div class="row gy-4 align-items-center">
                    <div class="col-lg-6">
                        <img src="assets/img/stats-img.svg" alt="Stats Image" class="img-fluid stats-image slide-in">
                    </div>
                    <div class="col-lg-6">
                        <div class="stats-item d-flex align-items-center count-up">
                            <span class="stats-number" data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1">232</span>
                            <div class="stats-text">
                                <strong>Happy people</strong>
                                <p>who have seeked help from our system.</p>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="stats-item d-flex align-items-center count-up">
                            <span class="stats-number" data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1">521</span>
                            <div class="stats-text">
                                <strong>NGO's</strong>
                                <p>who have helped in a critical part in developing society, improving communities, and promoting citizen participation</p>
                            </div>
                        </div><!-- End Stats Item -->

                        <div class="stats-item d-flex align-items-center count-up">
                            <span class="stats-number" data-purecounter-start="0" data-purecounter-end="453" data-purecounter-duration="1">453</span>
                            <div class="stats-text">
                                <strong>Top Donor's</strong>
                                <p>who have helped to bring smile on people's face</p>
                            </div>
                        </div><!-- End Stats Item -->
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

