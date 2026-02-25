<%@ Page Title="" Language="C#" MasterPageFile="~/Home/Home.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="OCR.Home.AboutUs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>About Us</h2>
          <p>Charity is an act of kindness, where a person who has financially more than enough of what he or she needs contributes a part of his or her surplus income for the fulfilment of the needs of those who are less capable.</p>
        </div>

        <div class="row gy-4">
          <div class="col-lg-6">
            <h3>Our Aim</h3>
            <img src="assets/images/4.jpg" class="img-fluid rounded-4 mb-4" alt="">
            <p>Design and integrate an automated system to improve the services and decreased the time spent calls and searching for services offered in the donation.</p>
            <p>Configure a gateway system for online payment to enable individual’s ease of payment from their mobile devices. </p>
          </div>
          <div class="col-lg-6">
            <div class="content ps-0 ps-lg-5">
              <p class="fst-italic">
              What we provide:
              </p>
              <ul>
                <li><i class="bi bi-check-circle-fill"></i>We will provide a a great opportunity for smaller NGOs And Donors who can’t afford mass advertising campaigns to reach their target groups using this system.</li>
                <li><i class="bi bi-check-circle-fill"></i>Donor can search for NGO's and choose to which NGO they want to donate.</li>
                <li><i class="bi bi-check-circle-fill"></i>We will give an option to make an appointment to visit NGO's before donating.</li>
              </ul>
              <p>
               All the information and communication is managed by administrator regarding all the activities happening between Donor, NGo, Fundraiser.
              </p>

              <div class="position-relative mt-4">
                <img src="assets/images/2.jpg" class="img-fluid rounded-4" alt="">
                <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ" class="glightbox play-btn"></a>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>
</asp:Content>
