using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmployeeMaster : System.Web.UI.MasterPage
{
    public static string _u = "", _m = "", _e = "", _a = "", _c = "",_ee="";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["EmpId"] != null)
        {
            lblEmp.Text = Session["EmpName"].ToString();
            if (!IsPostBack)
            {
                _u = ""; _m = ""; _e = ""; _a = ""; _c = ""; _ee = "";
                if (Request.QueryString["pg"] != null)
                {
                    if (Request.QueryString["pg"].ToString() != null)
                    {
                        if (Request.QueryString["pg"].ToString() == "u")
                        {
                            _u = "style='border-bottom:2px solid #4F37D1;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "m")
                        {
                            _m = "style='border-bottom:2px solid #4F37D1;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "e")
                        {
                            _e = "style='border-bottom:2px solid #4F37D1;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "a")
                        {
                            _a = "style='border-bottom:2px solid #4F37D1;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "c")
                        {
                            _c = "style='border-bottom:2px solid #4F37D1;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "ee")
                        {
                            _ee = "style='border-bottom:2px solid #4F37D1;'";
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
