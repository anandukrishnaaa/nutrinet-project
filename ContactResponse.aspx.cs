using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ContactResponse : System.Web.UI.Page
{
    clsWellness ce = new clsWellness();
    DataTable dt;
    public int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadRespData();
        }
    }

    protected void LoadRespData()
    {
        dt = ce.getCE();
        gvExpRsp.DataSource = dt;
        gvExpRsp.DataBind(); 
    }

    protected void gvExpRsp_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnMark.CssClass = "btn btn-outline-success fs-normal mx-2";
        btnUnmark.CssClass = "btn btn-outline-primary fs-normal mx-2";
        id =  Convert.ToInt32(gvExpRsp.SelectedRow.Cells[1].Text);
        txtId.Text = id.ToString();
    }

    protected void btnMark_Click(object sender, EventArgs e)
    {
        if (txtId.Text.ToString() != "")
        {
            id = Convert.ToInt32(txtId.Text);
            ce.cStat = "Resolved";
            ce.updateCE(id);
            btnUnmark.CssClass = "btn btn-outline-primary fs-normal mx-2";
            btnMark.CssClass = "btn btn-success fs-normal mx-2";
            LoadRespData();
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a ticket first!');", true);
        }
    }
    
    protected void btnUnmark_Click(object sender, EventArgs e)
    {
        if (txtId.Text.ToString() != "")
        {
            id = Convert.ToInt32(txtId.Text);
            ce.cStat = "Unresolved";
            ce.updateCE(id);
            btnMark.CssClass = "btn btn-outline-success fs-normal mx-2";
            btnUnmark.CssClass = "btn btn-primary fs-normal mx-2";
            LoadRespData();
        }
        else
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please select a ticket first!');", true);
        }
    }
}