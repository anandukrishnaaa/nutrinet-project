using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SetMealPlan : System.Web.UI.Page
{
    DataTable dt, dx, dy = new DataTable();
    clsHealthInfo HeInfo = new clsHealthInfo();
    clsWellness ve = new clsWellness();
    public static int usrid;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDay.Text = DateTime.Today.ToString("dd/MM/yyyy");

        if (!IsPostBack)
        {
            LoadgvSMData();
        }
    }

    protected void LoadgvSMData()
    {
        dt = HeInfo.showHealthTrack();
        gvHealth.DataSource = dt;
        gvHealth.DataBind();
        dx = ve.showAllExcercisePlan();
        gvExcercise.DataSource = dx;
        gvExcercise.DataBind();
        dy = ve.showAllMealPlan();
        gvSetMeal.DataSource = dy;
        gvSetMeal.DataBind();
    }


    protected void gvSetMeal_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnSetMeal.CssClass = "btn-outline-primary form-control";
        usrid = Convert.ToInt32(gvSetMeal.SelectedRow.Cells[1].Text);
        lblSelUsr.Text = gvSetMeal.SelectedRow.Cells[1].Text;
        lblSelName.Text = gvSetMeal.SelectedRow.Cells[2].Text;
        txtMon.Text = gvSetMeal.SelectedRow.Cells[5].Text;
        txtTue.Text = gvSetMeal.SelectedRow.Cells[6].Text;
        txtWed.Text = gvSetMeal.SelectedRow.Cells[7].Text;
        txtThu.Text = gvSetMeal.SelectedRow.Cells[8].Text;
        txtFri.Text = gvSetMeal.SelectedRow.Cells[9].Text;
        txtSat.Text = gvSetMeal.SelectedRow.Cells[10].Text;
    }

    protected void btnShowHT_Click(object sender, EventArgs e)
    {
        if (HealthPanel.Visible == false)
        {
            HealthPanel.Visible = true;
            btnShowHT.CssClass = "btn btn-success mx-3 mb-3"; 
        }
        else
        {
            HealthPanel.Visible = false;
            btnShowHT.CssClass = "btn btn-outline-secondary mx-3 mb-3"; 
        }
    }
    
    protected void btnShowEx_Click(object sender, EventArgs e)
    {
        if (ExcercisePanel.Visible == false)
        {
            ExcercisePanel.Visible = true;
            btnShowEx.CssClass = "btn btn-success mb-3"; 
        }
        else
        {
            ExcercisePanel.Visible = false;
            btnShowEx.CssClass = "btn btn-outline-secondary mb-3"; 
        }
    }

    protected void btnSetMeal_Click(object sender, EventArgs e)
    {
        if (gvSetMeal.SelectedRow.Cells[1].Text != null)
        {
            usrid = Convert.ToInt32(gvSetMeal.SelectedRow.Cells[1].Text);
            ve.A = txtMon.Text.ToString();
            ve.B = txtTue.Text.ToString();
            ve.C = txtWed.Text.ToString();
            ve.D = txtThu.Text.ToString();
            ve.E = txtFri.Text.ToString();
            ve.F = txtSat.Text.ToString();
            ve.updateMealPlan(usrid);
            btnSetMeal.CssClass = "btn btn-primary form-control";
            LoadgvSMData();
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a user first!');", true);
        }
    }
}


    