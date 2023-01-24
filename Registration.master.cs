using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.MasterPage
{
    public static string _u = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _u = "";
            if (Request.QueryString["pg"] != null)
            {
                if (Request.QueryString["pg"].ToString() != null)
                {
                    if (Request.QueryString["pg"].ToString() == "ur")
                    {
                        _u = "style='border-bottom:2px solid #294d96;'";
                    }
                }
            }
        }
    }
}
