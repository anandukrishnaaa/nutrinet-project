using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                if (Request.QueryString["pg"] != null)
                {
                    if (Request.QueryString["pg"].ToString() == "hr")
                    {
                        btnLogIn.Enabled = false;
                        btnLogIn.Visible = false;
                        btnHome.Enabled = false;
                    }
                }
            }
        
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("Landing.aspx");
    }
}
