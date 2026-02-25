using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OCR.NGO
{
    public partial class Appointment_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection();
        string conStr = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        SqlCommand cmd;
        SqlDataAdapter adr;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("../Home/Home.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    FetchData();
                }
            }
        }
        protected void FetchData()
        {
            con = new SqlConnection(conStr);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT ID,Name,UserName,PhoneNumber,Email,AppointmentDetail,AppointmentDate,AppointmentMinutes,AppointmentTime,Status FROM tbl_Appointment WHERE NGOName=@Name", con);
            cmd.CommandType = CommandType.Text;
            if (Session["UserName"] != null)
            {
                cmd.Parameters.AddWithValue("@Name", Session["UserName"].ToString());
            }
            adr = new SqlDataAdapter(cmd);
            dt = new DataTable();
            adr.Fill(dt);
            cmd.ExecuteReader();
            cmd.Dispose();
            con.Close();
            grdAppointments.DataSource = dt;
            grdAppointments.DataBind();
        }
        protected void cmdDeny_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conStr);
                con.Open();
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdAppointments.DataKeys[row.RowIndex].Values[0].ToString();
                SqlCommand cmd = new SqlCommand("update tbl_Appointment Set ApprovedBy=@ApprovedBy,ApprovedDate=@ApprovedDate,Status=@Status Where ID=" + ID, con);
                cmd.Parameters.AddWithValue("@ApprovedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@Status", "Rejected");
                if (Session["UserName"] != null)
                {
                    cmd.Parameters.AddWithValue("@ApprovedBy", Session["UserName"].ToString());
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Session Expired. PLease login again to continue.')", true);
                }
                cmd.ExecuteNonQuery();
                con.Close();
                FetchData();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        protected void cmdApprove_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(conStr);
                con.Open();
                Button btn = sender as Button;
                GridViewRow row = btn.NamingContainer as GridViewRow;
                string ID = grdAppointments.DataKeys[row.RowIndex].Values[0].ToString();
                SqlCommand cmd = new SqlCommand("update tbl_Appointment Set ApprovedBy=@ApprovedBy,ApprovedDate=@ApprovedDate,Status=@Status Where ID=" + ID, con);
                cmd.Parameters.AddWithValue("@ApprovedDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@Status", "Approved");
                if (Session["UserName"] != null)
                {
                    cmd.Parameters.AddWithValue("@ApprovedBy", Session["UserName"].ToString());
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
                }
                cmd.ExecuteNonQuery();
                con.Close();
                FetchData();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Somethng went wrong !')", true);
            }
        }

        protected void grdAppointments_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Read Status column
                string status = DataBinder.Eval(e.Row.DataItem, "Status") == DBNull.Value
                                ? ""
                                : DataBinder.Eval(e.Row.DataItem, "Status").ToString();

                // Find buttons (YOUR IDs)
                Button btnApprove = (Button)e.Row.FindControl("cmdApprove");
                Button btnDeny = (Button)e.Row.FindControl("cmdDeny");

                if (status.Equals("Approved", StringComparison.OrdinalIgnoreCase))
                {
                    btnApprove.Visible = false;
                    btnDeny.Visible = true;
                }
                else if (status.Equals("Rejected", StringComparison.OrdinalIgnoreCase))
                {
                    btnApprove.Visible = true;
                    btnDeny.Visible = false;
                }
                else // NULL or empty
                {
                    btnApprove.Visible = true;
                    btnDeny.Visible = true;
                }
            }
        }
    }
}