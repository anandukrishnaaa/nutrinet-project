using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserManagement : System.Web.UI.Page
{
    clsReg reg = new clsReg();
    clsAdmin admin = new clsAdmin();
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUserData();
        }
    }

    protected void LoadUserData()
    {
        lblUsrCount.Text = Convert.ToString(reg.getUsrCount());
        dt = reg.displayUsers();
        grdUsr.DataSource = dt;
        grdUsr.DataBind();
    }

    protected void grdUsr_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblApprove.Visible = false;
        lblRemove.Visible = false;
        txtId.Text = grdUsr.SelectedRow.Cells[1].Text;
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        if (txtId.Text.Trim() == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a user first!!');", true);
            return;
        }
        lblApprove.Visible = false;
        lblRemove.Visible = true;
        admin.Id = txtId.Text;
        admin.Status = "Removed";
        admin.removeUser();
        string message = "User Removed.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        LoadUserData();
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        if (txtId.Text.Trim() == "")
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a user first!');", true);
            return;
        }
        lblRemove.Visible = false;
        lblApprove.Visible = true;
        admin.Id = txtId.Text;
        admin.Status = "Active";
        admin.approveUser();
        string message = "User Reinstated.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        LoadUserData();
    }
}
 