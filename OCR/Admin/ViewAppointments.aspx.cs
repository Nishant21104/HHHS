using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.Admin
{
    public partial class ViewAppointments : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("SELECT ID,Name,UserName,PhoneNumber,Email,AppointmentDetail,AppointmentDate,AppointmentMinutes,AppointmentTime,Status FROM tbl_Appointment", con);
            cmd.CommandType = CommandType.Text;
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            grdAppointments.DataSource = dt;
            grdAppointments.DataBind();
        }

      
    }
}