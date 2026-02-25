<%@ Page Title="" Language="C#" MasterPageFile="~/Donor/Donor.Master" AutoEventWireup="true" CodeBehind="DonorHome.aspx.cs" Inherits="OCR.Donor.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%--<form id="frm" runat="server">--%>
    <!-- Carousel
    ================================================== -->

    <div id="homeCarousel" class="carousel slide carousel-home" data-ride="carousel">
            <%--<asp:Label ID="lblUserName" runat="server"></asp:Label>--%>
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#homeCarousel" data-slide-to="1"></li>
            <li data-target="#homeCarousel" data-slide-to="2"></li>
        </ol>

        <div class="carousel-inner" role="listbox">

            <div class="item active">

                <img src="Donorassets/images/slider/home-slider-1.jpg" alt="">

                <div class="container">

                    <div class="carousel-caption">

                        <h2 class="carousel-title bounceInDown animated slow">Because they need your help</h2>
                        <h4 class="carousel-subtitle bounceInUp animated slow ">Do not let them down</h4>
                         <asp:Button ID="btnDonateNow" runat="server" Width="20%" Text="DONATE NOW" OnClick="btnaAddNewRequest_Click" CssClass="btn btn-lg btn-secondary hidden-xs bounceInUp animated slow" />

                    </div>
                    <!-- /.carousel-caption -->

                </div>

            </div>
            <!-- /.item -->


            <div class="item ">

                <img src="Donorassets/images/slider/home-slider-2.jpg" alt="">

                <div class="container">

                    <div class="carousel-caption">

                        <h2 class="carousel-title bounceInDown animated slow">Together we can improve their lives</h2>
                        <h4 class="carousel-subtitle bounceInUp animated slow">So let's do it !</h4>
                        <asp:Button ID="Button1" runat="server" Width="20%" Text="DONATE NOW" OnClick="btnaAddNewRequest_Click" CssClass="btn btn-lg btn-secondary hidden-xs bounceInUp animated slow" />

                    </div>
                    <!-- /.carousel-caption -->

                </div>

            </div>
            <!-- /.item -->




            <div class="item ">

                <img src="Donorassets/images/slider/home-slider-3.jpg" alt="">

                <div class="container">

                    <div class="carousel-caption">

                        <h2 class="carousel-title bounceInDown animated slow">A penny is a lot of money, if you have not got a penny.</h2>
                        <h4 class="carousel-subtitle bounceInUp animated slow">You can make the diffrence !</h4>
                      <asp:Button ID="Button2" runat="server" Width="20%" Text="DONATE NOW" OnClick="btnaAddNewRequest_Click" CssClass="btn btn-lg btn-secondary hidden-xs bounceInUp animated slow" />

                    </div>
                    <!-- /.carousel-caption -->

                </div>

            </div>
            <!-- /.item -->

        </div>

        <a class="left carousel-control" href="#homeCarousel" role="button" data-slide="prev">
            <span class="fa fa-angle-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>

        <a class="right carousel-control" href="#homeCarousel" role="button" data-slide="next">
            <span class="fa fa-angle-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>
    <!-- /.carousel -->

    <div class="section-home about-us fadeIn animated">

        <div class="container">

            <div class="row">

                <div class="col-md-4 col-sm-8">

                    <div class="about-us-col">

                        <div class="col-icon-wrapper">
                            <img src="Donorassets/images/icons/our-mission-icon.png" alt="">
                        </div>
                        <h3 class="col-title">our mission</h3>
                        <div class="col-details">

                            <p>Our mission is to provide a transparent online platform that empowers individuals and organizations to make a meaningful impact through donations. We are connecting those in need with donors worldwide, fostering a community of generosity, and positive change.</p>

                        </div>

                    </div>

                </div>


                <div class="col-md-4 col-sm-8">

                    <div class="about-us-col">

                        <div class="col-icon-wrapper">
                            <img src="Donorassets/images/icons/make-donation-icon.png" alt="">
                        </div>
                        <h3 class="col-title">Make donations</h3>

                        <a href="NgoList.aspx" class="btn btn-primary">Donate here.. </a>

                    </div>

                </div>


                <div class="col-md-4 col-sm-8">

                    <div class="about-us-col">

                        <div class="col-icon-wrapper">
                            <img src="Donorassets/images/icons/help-icon.png" alt="">
                        </div>
                        <h3 class="col-title">Help & support</h3>

                        <a href="../Contact.aspx" class="btn btn-primary">Connect with us.. </a>

                    </div>

                </div>



            </div>

        </div>

    </div>
    <!-- /.about-us -->

    <div class="section-home home-reasons">

        <div class="container">

            <div class="row">

                <div class="col-md-6">

                    <div class="reasons-col animate-onscroll fadeIn">

                        <asp:Image ID="Imagefirst" runat="server" />

                        <div class="reasons-titles">

                            <h3 class="reasons-title" runat="server" id="h3"></h3>

                        </div>

                        <div class="on-hover hidden-xs">

                            <p runat="server" id="p3"></p>
                        </div>
                    </div>

                </div>


                <div class="col-md-6">

                    <div class="reasons-col animate-onscroll fadeIn">
                        <asp:Image ID="Imagesecond" runat="server" />

                        <div class="reasons-titles">

                            <h3 class="reasons-title" runat="server" id="h4"></h3>

                        </div>

                        <div class="on-hover hidden-xs">
                            <p runat="server" id="p4"></p>
                        </div>


                    </div>

                </div>


            </div>



        </div>


    </div>
    <!-- /.home-reasons -->



       <%--</form>--%>
</asp:Content>
