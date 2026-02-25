using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.NetworkInformation;
using System.Xml.Linq;
using System.IO;

namespace OCR
{
    public partial class ProductDetailPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if(Convert.ToInt32(txtMRP.Text)> Convert.ToInt32(txtPrice.Text))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('MRP should be less than Price.');", true);
                return;
            }
            bool folderExists = Directory.Exists(Server.MapPath(@"~\ImageFiles\"));
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            if (!folderExists)
            {

                Directory.CreateDirectory(Server.MapPath(@"~\ImageFiles\"));
            }
            if (FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath(@"~\ImageFiles\" + filename));
            }

            SqlConnection con = new SqlConnection(@"Data Source=NISHANT\SQLEXPRESS;Initial Catalog=HHHS;Integrated Security=True;MultipleActiveResultSets=True;");            
            con.Open();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO [dbo].[ProductDetail]([ProductName],[ProductCategory],[ProductFreshness],[Image],[Description],[ProductPrice],[MRP],[Comment],[PhoneNumber],[Email]) VALUES (@ProductName,@ProductCategory,@ProductFreshness,@Image, @Description,@ProductPrice,@MRP,@Comment,@PhoneNumber,@Email)", con);
            cmd1.CommandType = CommandType.Text;
            cmd1.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
            cmd1.Parameters.AddWithValue("@ProductCategory", ddlProductCategory.SelectedItem.Text.Trim());
            cmd1.Parameters.AddWithValue("@ProductFreshness", RadioButtonList1.SelectedItem.Text.Trim());
            cmd1.Parameters.AddWithValue("@Image", filename);
            cmd1.Parameters.AddWithValue("@Description", txtDesc.Text);
            cmd1.Parameters.AddWithValue("@ProductPrice", txtPrice.Text);
            cmd1.Parameters.AddWithValue("@MRP", txtMRP.Text.Trim());
            cmd1.Parameters.AddWithValue("@Comment", txtComment.Text);
            cmd1.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
            cmd1.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd1.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Product has been added Succesfully.');", true);

        }
    }
}