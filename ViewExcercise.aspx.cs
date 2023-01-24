using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ViewExcercise : System.Web.UI.Page
{
    DataTable dt,dx = new DataTable();
    clsWellness ve = new clsWellness();
    public string day = DateTime.Today.DayOfWeek.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDay.Text = DateTime.Today.ToString("dd/MM/yyyy");

        if (day == "Saturday" || day == "Sunday")
        {
            lblPrg.Visible = false;
            btnPrg.Visible = false;
            lblWE.Visible = true;
        }
        else
        {
            checkProgress();
        }
       
        if (!IsPostBack)
        {
            LoadgvExData();
        }
    }

    protected void LoadgvExData()
    {
        if (Session["UserId"] != null)
        {
        int id = Convert.ToInt32(Session["UserId"]);
        dt = ve.showExcercisePlan(id);
        if (checkData(dt) == 0)
        {
            lblPrg.Text = "It seems like you have not been assigned an Excercise Plan yet, please check back in later.";
            lblPrg.CssClass = "fs-5";
            btnPrg.Visible = false;
            btnPrg.Enabled = false;
        }
        gvExInv.DataSource = dt;
        gvExInv.DataBind();
        for (int i = 0; i < gvExInv.Columns.Count; i++)
        {
            dx.Columns.Add(gvExInv.HeaderRow.Cells[i].Text);
        }
        foreach (GridViewRow row in gvExInv.Rows)
        {
            DataRow dr = dx.NewRow();
            for (int j = 0; j < gvExInv.Columns.Count; j++)
            {
                dr[gvExInv.HeaderRow.Cells[j].Text] = row.Cells[j].Text;
            }

            dx.Rows.Add(dr);
        }
        gvExcercise.DataSource = ConvertColumnsAsRows(dx);
        gvExcercise.DataBind();
        gvExcercise.HeaderRow.Visible = false;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }

    // This function is used to convert columns to rows
    public DataTable ConvertColumnsAsRows(DataTable dt)
    {
        DataTable dtnew = new DataTable();
        //Convert all the rows to columns
        for (int i = 0; i <= dt.Rows.Count; i++)
        {
            dtnew.Columns.Add(Convert.ToString(i));
        }
        DataRow dr;
        // Convert All the Columns to Rows
        for (int j = 0; j < dt.Columns.Count; j++)
        {
            dr = dtnew.NewRow();
            dr[0] = dt.Columns[j].ToString();
            for (int k = 1; k <= dt.Rows.Count; k++)
                dr[k] = dt.Rows[k - 1][j];
            dtnew.Rows.Add(dr);
        }
        return dtnew;
    }

    protected void checkProgress()
    {
        ve.Id = Session["UserId"].ToString();
        ve.fTable = "ExcerciseDB";
        ve.fCol = "Ex_Flag";
        string flag = ve.getflag();

        if (day == "Saturday" || day == "Sunday")
        {
            lblWE.Visible = true;
            btnPrg.Enabled = false;
        }
        else if (flag == day)
        {
            lblPrg.Text = "<h5>Well done! You have already completed Today's Plan!</h5>";
            btnPrg.Visible = false;
        }
        else if (flag != "Not Completed")
        {
            lblPrg.Text = "Last Completed on " + flag;
            lblPrg.CssClass = "fs-5";
            btnPrg.Enabled = true;
        }
    }

    protected int checkData(DataTable dt)
    {
        int count = 0;
        foreach (DataColumn col in dt.Columns)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (row[col].ToString() == "0")
                {
                    count++;
                }
            }
        }
        if (count > 5)
        {
            return 0;
        }
        else
        {
            return 1;
        }
    }

    protected void btnPrg_Click(object sender, EventArgs e)
    {
        btnPrg.Visible = true;
        ve.Id = Session["UserId"].ToString();
        ve.fTable = "ExcerciseDB";
        ve.fDay = day.ToString();
        ve.fCol = "Ex_Flag";
        ve.updateflag();
        checkProgress();
    }
}