using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Donor
{
    public partial class ViewAppointment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                FetchData();
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_Appointment  Where Username=@UserName", con);
            cmd.Parameters.AddWithValue("@UserName", Session["DonorUserName"].ToString());
            cmd.CommandType = CommandType.Text;          
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();

            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                grdAppointments.DataSource = dt;
                grdAppointments.DataBind();
            }
        }
    }
}