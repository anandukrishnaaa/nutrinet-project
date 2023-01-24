using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HealthReg : System.Web.UI.Page
{
    clsHealthInfo HeInfo = new clsHealthInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Timed Out! Please update your health later from the console to help us serve you better.');window.location ='Login.aspx';", true);
        }
        else 
        {
            HeInfo.Age = Session["UserAge"].ToString();
        }
    }

    protected void btnUserSumbit_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
        int id = Convert.ToInt32(Session["UserId"].ToString());
        HeInfo.UserId = id.ToString();
        HeInfo.Height = txtHt.Text.ToString();
        HeInfo.Weight = txtWt.Text.ToString();
        HeInfo.HeartRate = txtHrtRt.Text.ToString();
        HeInfo.SugarLevel = txtSgrLvl.Text.ToString();
        HeInfo.Cholestrol = txtChLvl.Text.ToString();
        HeInfo.Platelet = txtPlt.Text.ToString();
        HeInfo.trackHealth(id);
        Response.Redirect("UserView.aspx?pg=uv");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}