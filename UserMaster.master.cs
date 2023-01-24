using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserMaster : System.Web.UI.MasterPage
{
    public static string _bmi="",_bmr="",_ht="",_uv="",_mp="",_ep="",_ct="",_a="",_c = "",_ue="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            lblUsr.Text = Session["UserName"].ToString();
            if (!IsPostBack)
            {
                _bmi = ""; _bmr = ""; _ht = ""; _uv = ""; _mp = ""; _ep = ""; _ct = ""; _a = ""; _c = ""; _ue = "";
                if (Request.QueryString["pg"] != null)
                {
                    if (Request.QueryString["pg"].ToString() != null)
                    {
                        if (Request.QueryString["pg"].ToString() == "bmi")
                        {
                            _bmi = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "bmr")
                        {
                            _bmr = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "ht")
                        {
                            _ht = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "uv")
                        {
                            _uv = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "mp")
                        {
                            _mp = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "ep")
                        {
                            _ep = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "ct")
                        {
                            _ct = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "a")
                        {
                            _a = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "c")
                        {
                            _c = "style='border-bottom: 2px solid #469feb;'";
                        }
                        else if (Request.QueryString["pg"].ToString() == "ue")
                        {
                            _ue = "style='border-bottom: 2px solid #469feb;'";
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
