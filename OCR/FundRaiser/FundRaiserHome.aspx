<%@ Page Title="" Language="C#" MasterPageFile="~/FundRaiser/FundRaiser.Master" AutoEventWireup="true" CodeBehind="FundRaiserHome.aspx.cs" Inherits="OCR.FundRaiser.FundRaiserHome" %>
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
        /* Modern CSS for FundRaiser Home - no TailwindCSS conflicts */
        .fundraiser-home {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }
        
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeInLeft { from { opacity: 0; transform: translateX(-30px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes fadeInRight { from { opacity: 0; transform: translateX(30px); } to { opacity: 1; transform: translateX(0); } }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        @keyframes float { 0%, 100% { transform: translateY(0px); } 50% { transform: translateY(-20px); } }
        
        .fade-in-up { animation: fadeInUp 0.8s ease-out; }
        .fade-in-left { animation: fadeInLeft 0.8s ease-out; }
        .fade-in-right { animation: fadeInRight 0.8s ease-out; }
        .pulse-animation { animation: pulse 2s infinite; }
        .float-animation { animation: float 3s ease-in-out infinite; }
        
        /* Hero Section */
        .hero-section {
            padding: 80px 0;
            position: relative;
            background: linear-gradient(135deg, #667eea 0%, #1f76bd 100%);
            overflow: hidden;
        }
        
        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,138.7C960,139,1056,117,1152,106.7C1248,96,1344,96,1392,96L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }
        
        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            position: relative;
            z-index: 1;
        }
        
        .hero-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 60px;
            align-items: center;
            min-height: 500px;
        }
        
        .hero-text {
            color: white;
        }
        
        .hero-title {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }
        
        .hero-subtitle {
            font-size: 1.3rem;
            margin-bottom: 40px;
            opacity: 0.9;
            line-height: 1.6;
            font-weight: 300;
        }
        
        .hero-buttons {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .btn-primary-hero {
            background: linear-gradient(135deg, #f59e0b, #ef4444);
            color: white;
            padding: 15px 35px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(245, 158, 11, 0.3);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        
        .btn-primary-hero:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(245, 158, 11, 0.4);
        }
        
        .btn-secondary-hero {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 15px 35px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }
        
        .btn-secondary-hero:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
        }
        
        .hero-image {
            text-align: center;
        }
        
        .hero-image img {
            max-width: 100%;
            height: auto;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
        }
        
        .hero-image img:hover {
            transform: scale(1.05);
        }
        
        /* Stats Section */
        .stats-section {
            padding: 100px 0;
            background: linear-gradient(135deg, #f8fafc 0%, #1f76bd 100%);
            position: relative;
        }
        
        .stats-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .stats-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 80px;
            align-items: center;
        }
        
        .stats-image {
            text-align: center;
        }
        
        .stats-image img {
            max-width: 100%;
            height: auto;
            opacity: 0.8;
        }
        
        .stats-items {
            display: flex;
            flex-direction: column;
            gap: 40px;
        }
        
        .stat-item {
            display: flex;
            align-items: center;
            gap: 30px;
            padding: 30px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 5px solid #667eea;
        }
        
        .stat-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
        }
        
        .stat-number {
            font-size: 3rem;
            font-weight: 700;
            color: #667eea;
            min-width: 100px;
            text-align: center;
            background: linear-gradient(135deg, #667eea, #1f76bd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .stat-content h3 {
            font-size: 1.3rem;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 10px;
        }
        
        .stat-content p {
            color: #64748b;
            line-height: 1.6;
            margin: 0;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-content {
                grid-template-columns: 1fr;
                gap: 40px;
                text-align: center;
            }
            
            .hero-title {
                font-size: 2.5rem;
            }
            
            .hero-buttons {
                justify-content: center;
            }
            
            .stats-content {
                grid-template-columns: 1fr;
                gap: 40px;
            }
            
            .stat-item {
                flex-direction: column;
                text-align: center;
                gap: 20px;
            }
            
            .stat-number {
                font-size: 2.5rem;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="fundraiser-home">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-container">
                <div class="hero-content">
                    <div class="hero-text fade-in-left">
                        <h1 class="hero-title">Welcome <asp:Label ID="lblUserName" runat="server"></asp:Label></h1>
                        <p class="hero-subtitle">It's not how much we give but how much love we put into giving.</p>
                        <div class="hero-buttons">
                            <a href="AboutUs.aspx" class="btn-primary-hero">
                                <i class="fas fa-rocket"></i>
                                Get Started
                            </a>
                            <a href="#" class="btn-secondary-hero">
                                <i class="fas fa-play-circle"></i>
                                Watch Video
                            </a>
                        </div>
                    </div>
                    <div class="hero-image fade-in-right">
                        <img src="assets/images/home-1.jpg" alt="Helping Hands" class="float-animation" />
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Counter Section -->
        <section class="stats-section">
            <div class="stats-container">
                <div class="stats-content">
                    <div class="stats-image fade-in-left">
                        <img src="assets/img/stats-img.svg" alt="Statistics" />
                    </div>
                    <div class="stats-items fade-in-right">
                        <div class="stat-item">
                            <div class="stat-number">
                                <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter">232</span>
                            </div>
                            <div class="stat-content">
                                <h3>Happy People</h3>
                                <p>who have sought help from our system and found the support they needed.</p>
                            </div>
                        </div>
                        
                        <div class="stat-item">
                            <div class="stat-number">
                                <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter">521</span>
                            </div>
                            <div class="stat-content">
                                <h3>NGO's</h3>
                                <p>who have helped in a critical part in developing society, improving communities, and promoting citizen participation.</p>
                            </div>
                        </div>
                        
                        <div class="stat-item">
                            <div class="stat-number">
                                <span data-purecounter-start="0" data-purecounter-end="453" data-purecounter-duration="1" class="purecounter">453</span>
                            </div>
                            <div class="stat-content">
                                <h3>Top Donor's</h3>
                                <p>who have helped to bring smiles on people's faces through their generous contributions.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

