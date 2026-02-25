using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace OCR
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Fetch and display donor-related information
                DisplayDonorInfo();
                DisplayDonationHistory();
            }
        }
        private void DisplayDonorInfo()
        {
            // Assuming you have a method to fetch donor information from the database
            string donor = Session["DonorUserName"].ToString(); // Implement this method according to your authentication mechanism
            if (donor != null)
            {
                litDonorName.Text = donor;
            }
        }

        private void DisplayDonationHistory()
        {
            // Assuming you have a method to fetch donation history for the logged-in donor from the database
            string donor = Session["DonorUserName"].ToString(); // Implement this method according to your authentication mechanism
            if (donor != null)
            {
                // Fetch donation history for the donor
                // List<Donation> donations = DonationManager.GetDonationsByDonor(donor.Id); // Example method call
                // Bind donation history to the GridView
                // gvDonationHistory.DataSource = donations;
                // gvDonationHistory.DataBind();
                // Replace the above lines with actual logic to fetch and bind donation history
            }
        }
        
    }
}