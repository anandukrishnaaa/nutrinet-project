using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class ReqAppointment : System.Web.UI.Page
{
    clsWellness ap = new clsWellness(); 
    int flag;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadReqApp();
        }
    }

    protected void LoadReqApp()
    {
        if (Session["UserId"] != null)
        {
        flag = 0;
        int id = Convert.ToInt32(Session["UserId"]);
        DataTable dt = new DataTable();
        dt = ap.showMed(id);
        gvReqApp.DataSource = dt;
        gvReqApp.DataBind();
        txtId.Text = id.ToString();
        string chkdate = gvReqApp.Rows[0].Cells[6].Text.ToString();
        if (chkdate != null && chkdate != "&nbsp;")
        {
            string today = DateTime.Today.ToString("dd/MM/yyyy");
            DateTime d1 = Convert.ToDateTime(today);
            DateTime d2 = Convert.ToDateTime(chkdate);
            if (DateTime.Compare(d1,d2)>0)
            {
                flag = 1;
            }
        }
        txtName.Text = Session["UserName"].ToString();
        if (gvReqApp.Rows[0].Cells[8].Text != null)
        {
            string status = gvReqApp.Rows[0].Cells[8].Text;
            if (status == "Approved")
            {
                lblAppEx.Visible = true;
                lblAppEx.Text = "Expert in charge : " + gvReqApp.Rows[0].Cells[4].Text;
                txtMsg.Text = gvReqApp.Rows[0].Cells[5].Text;
                txtAppTime.Text = gvReqApp.Rows[0].Cells[7].Text;
                txtDate.Text = gvReqApp.Rows[0].Cells[6].Text;
                btnSubmit.Text = "Appointment Approved!";
                btnSubmit.CssClass = "btn btn-success form-control";
                txtId.Enabled = false;
                txtName.Enabled = false;
                txtMsg.Enabled = false;
                txtDate.Enabled = false;
                txtAppTime.Enabled = false;
                btnSubmit.Enabled = false;
            }
            else if (status == "Requested")
            {
                txtMsg.Text = gvReqApp.Rows[0].Cells[5].Text;
                txtAppTime.Text = gvReqApp.Rows[0].Cells[7].Text;
                txtDate.Text = gvReqApp.Rows[0].Cells[6].Text;
                txtId.Enabled = false;
                txtName.Enabled = false;
                txtMsg.Enabled = false;
                txtDate.Enabled = false;
                txtAppTime.Enabled = false;
                btnSubmit.Text = "Appointment Request Pending.";
                btnSubmit.CssClass = "btn btn-outline-success form-control";
                btnSubmit.Enabled = false;
            }
            else if ((status == "Complete")||(flag==1))
            {
                btnSubmit.CssClass = "btn btn-outline-success form-control";
                lblAppEx.Text = "Previous Appointment Complete! Feel free to schedule your next appointment.";
                lblAppEx.Visible = true;
            }
        }
        else
        {
            lblAppEx.Visible = true;
            lblAppEx.Text = "No Appoinments Scheduled.";
        }
        }
        else
        {
            lblAppEx.Visible = true;
            lblAppEx.Text = "No Appoinments Scheduled";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtMsg.Text.ToString() == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill in the details!');window.location ='ReqAppointment.aspx';", true);
        }
        else if (txtDate.Text.ToString() == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Please fill in the details!';", true);
        }
        else if (txtAppTime.Text.ToString() == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill in the details!');window.location ='ReqAppointment.aspx';", true);
        }
        else
        {
            ap.mUId = Convert.ToInt32(txtId.Text);
            ap.mUser = txtName.Text;
            ap.mDate = txtDate.Text;
            ap.mTime = txtAppTime.Text;
            ap.mMsg = txtMsg.Text.ToString();
            ap.mExpert = "Unassigned";
            ap.mStat = "Requested";
            ap.reqApp(Convert.ToInt32(txtId.Text));
            lblAppEx.Visible = true;
            lblAppEx.Text = "Appointment Requested.";
            btnSubmit.CssClass = "btn btn-success";
            LoadReqApp();
        }
    }
}