using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SetExcercise : System.Web.UI.Page
{
    clsHealthInfo HeInfo = new clsHealthInfo();
    clsWellness ve = new clsWellness();
    public static int usrid;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDay.Text = DateTime.Today.ToString("dd/MM/yyyy");

        if (!IsPostBack)
        {
            LoadgvSEData();
        }
    }

    protected void LoadgvSEData()
    {
        DataTable dt, dx, dy = new DataTable();
        dt = HeInfo.showHealthTrack();
        gvHealth.DataSource = dt;
        gvHealth.DataBind();
        dx = ve.showAllMealPlan();
        gvSetMeal.DataSource = dx;
        gvSetMeal.DataBind();
        dy = ve.showAllExcercisePlan();
        gvExcercise.DataSource = dy;
        gvExcercise.DataBind();
    }


    protected void gvExcercise_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnSetEx.CssClass = "btn btn-primary form-control";
        setExPanel.Visible = true;
        usrid = Convert.ToInt32(gvExcercise.SelectedRow.Cells[1].Text);
        lblSelUsr.Text = gvExcercise.SelectedRow.Cells[1].Text;
        lblSelName.Text = gvExcercise.SelectedRow.Cells[2].Text;
        txtPUps.Text = gvExcercise.SelectedRow.Cells[5].Text;
        txtJJ.Text = gvExcercise.SelectedRow.Cells[6].Text;
        txtDePUps.Text = gvExcercise.SelectedRow.Cells[7].Text;
        txtDiPUps.Text = gvExcercise.SelectedRow.Cells[8].Text;
        txtWAPUps.Text = gvExcercise.SelectedRow.Cells[9].Text;
        txtCobraStrch.Text = gvExcercise.SelectedRow.Cells[10].Text;
        txtChstStrch.Text = gvExcercise.SelectedRow.Cells[11].Text;
        txtYoga.Text = gvExcercise.SelectedRow.Cells[12].Text;
    }

    protected void btnSetEx_Click(object sender, EventArgs e)
    {
        if (gvExcercise.SelectedRow.Cells[1].Text != null)
        {
        usrid = Convert.ToInt32(gvExcercise.SelectedRow.Cells[1].Text);
        ve.Id = usrid.ToString();
        ve.A = txtPUps.Text;
        ve.B = txtJJ.Text;
        ve.C = txtDePUps.Text;
        ve.D = txtDiPUps.Text;
        ve.E = txtWAPUps.Text;
        ve.F = txtCobraStrch.Text;
        ve.G = txtChstStrch.Text;
        ve.H = txtYoga.Text;
        ve.updateExcercisePlan(usrid);
        LoadgvSEData();
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a user first!');", true);
        }
    }

    protected void btnShowHT_Click(object sender, EventArgs e)
    {
        if (HealthPanel.Visible == false)
        {
            HealthPanel.Visible = true;
            btnShowHT.CssClass = "btn btn-success mb-3 mx-3";
        }
        else
        {
            HealthPanel.Visible = false;
            btnShowHT.CssClass = "btn btn-outline-secondary mb-3 mx-3";
        }
    }

    protected void btnShowMP_Click(object sender, EventArgs e)
    {
        if (MealPanel.Visible == false)
        {
            MealPanel.Visible = true;
            btnShowMP.CssClass = "btn btn-success mb-3";
        }
        else
        {
            MealPanel.Visible = false;
            btnShowMP.CssClass = "btn btn-outline-secondary mb-3";
        }
    }
}
