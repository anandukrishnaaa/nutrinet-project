using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SetAppointment : System.Web.UI.Page
{
    clsWellness ae = new clsWellness();
    DataTable dt = new DataTable();
    public static int usrid;
    public string exp;

    protected void Page_Load(object sender, EventArgs e)
    {   
        if (!IsPostBack)
        {
            if (Session["EmpId"] != null)
            {
                exp = Session["EmpName"].ToString();
                LoadgvSAData();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
            }
        }
    }

    protected void LoadgvSAData()
    {
        dt = ae.showAllMed();
        gvShowApp.DataSource = dt;
        gvShowApp.DataBind();
    }

    protected void gvShow_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["EmpId"] != null)
            {
                exp = Session["EmpName"].ToString();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
            }
        btnSetApp.CssClass = "btn btn-outline-success form-control fs-normal";
        btnReset.CssClass = "btn btn-outline-primary form-control fs-normal";
        lblMsg.Visible = false;
        setApp.Visible = true;
        usrid = Convert.ToInt32(gvShowApp.SelectedRow.Cells[1].Text);
        lblSelUsr.Text = gvShowApp.SelectedRow.Cells[1].Text;
        lblSelName.Text = gvShowApp.SelectedRow.Cells[2].Text;
        txtMsgBox.Text = gvShowApp.SelectedRow.Cells[4].Text;
        txtAppDate.Text = gvShowApp.SelectedRow.Cells[5].Text;
        txtExp.Text = exp;
        txtAppTime.Text = gvShowApp.SelectedRow.Cells[5].Text;
    }


    protected void btnSetApp_Click(object sender, EventArgs e)
    {
        usrid = Convert.ToInt32(gvShowApp.SelectedRow.Cells[1].Text);
        ae.mUId = usrid;
        ae.mUser = gvShowApp.SelectedRow.Cells[2].Text;
        ae.mDate = txtAppDate.Text;
        ae.mTime = txtAppTime.Text;
        ae.mExpert = txtExp.Text;
        ae.mStat = "Approved";
        ae.setApp(usrid);
        lblMsg.Visible = true;
        lblMsg.Text = "Appointment Set!";
        btnSetApp.CssClass = "btn btn-success form-control fs-normal";
        LoadgvSAData();
    }
    protected void btnResetApp_Click(object sender, EventArgs e)
    {
        usrid = Convert.ToInt32(gvShowApp.SelectedRow.Cells[1].Text);
        ae.mUId = usrid;
        ae.mUser = gvShowApp.SelectedRow.Cells[2].Text;
        ae.mDate = txtAppDate.Text;
        ae.mTime = txtAppTime.Text;
        ae.mExpert = txtExp.Text;
        ae.mStat = "Complete";
        ae.setApp(usrid);
        lblMsg.Visible = true;
        lblMsg.Text = "Appointment marked complete!";
        btnReset.CssClass = "btn btn-primary form-control fs-normal";
        LoadgvSAData();
    }
}