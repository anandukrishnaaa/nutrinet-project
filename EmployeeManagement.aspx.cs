using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class EmployeeManagement : System.Web.UI.Page
{
    clsAdmin admin = new clsAdmin();
    clsReg reg = new clsReg();
    DataTable dt;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadEmpData();
        }
    }

    protected void LoadEmpData()
    {
        lblEmpCount.Text = Convert.ToString(reg.getEmpCount());
        lblApprove.Visible = false;
        lblRemove.Visible = false;
        dt = admin.displayEmp();
        grdEmp.DataSource = dt;
        grdEmp.DataBind(); 
    }
    
    protected void grdEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtId.Text = grdEmp.SelectedRow.Cells[1].Text;
    }
    
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        if (txtId.Text.Trim() == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please choose Doctor!');", true);
            return;
        }
        lblApprove.Visible = true;
        admin.Id = txtId.Text;
        admin.Status = "Approved";
        admin.approveEmp();
        string message = "Doctor Approved.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        LoadEmpData();
    }
    
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (txtId.Text.Trim() == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please choose Doctor!');", true);
            return;
        }
        lblRemove.Visible = true;
        admin.Id = txtId.Text;
        admin.Status = "Removed";
        admin.removeEmp();
        string message = "Doctor Removed.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        LoadEmpData();
    }
}

