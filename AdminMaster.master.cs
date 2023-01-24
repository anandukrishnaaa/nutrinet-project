using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    public static string _e = "",_u="",_r="",_a="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != null)
        {
            if (!IsPostBack)
            {
                _e = ""; _u = ""; _r = ""; _a = "";
                if (Request.QueryString["pg"] != null)
                {
                    if (Request.QueryString["pg"].ToString() != null)
                    {
                        if (Request.QueryString["pg"].ToString() == "emp")
                        {
                            _e = "style='border-bottom:2px solid #DD272A;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "usr")
                        {
                            _u = "style='border-bottom:2px solid #DD272A;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "r")
                        {
                            _r = "style='border-bottom:2px solid #DD272A;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "a")
                        {
                            _a = "style='border-bottom:2px solid #DD272A;'";
                        }
                    }
                }
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
