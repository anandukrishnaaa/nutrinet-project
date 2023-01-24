using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserRegistration : System.Web.UI.Page
{
    clsReg reg = new clsReg();
    clsWellness ve = new clsWellness();
    clsHealthInfo HeInfo = new clsHealthInfo();
    DataTable du,de = new DataTable();
    private int UserId;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUserReg_Click(object sender, EventArgs e)
    {
        reg.Username = txtUser.Text;
        du = reg.verifyUserReg();
        de = reg.verifyEmpReg();

        if (du.Rows.Count != 0 || de.Rows.Count !=0)
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Username already taken!');", true);
            txtUser.Focus();
            return;
        }

        UserId = reg.getUsrCount();
        UserId = UserId + 1;

        ve.Id = UserId.ToString();
        ve.A = "NA";
        ve.B = "NA";
        ve.C = "NA";
        ve.D = "NA";
        ve.E = "NA";
        ve.F = "NA";
        ve.G = "Not Completed";
        ve.setMealPlan();
        ve.Id = UserId.ToString();
        ve.A = 0.ToString();
        ve.B = 0.ToString();
        ve.C = 0.ToString();
        ve.D = 0.ToString();
        ve.E = 0.ToString();
        ve.F = 0.ToString();
        ve.G = 0.ToString();
        ve.H = 0.ToString();
        ve.I = "Not Completed";
        ve.setExcercisePlan();

        Session.Add("UserName", txtName.Text);

        HeInfo.UserId = UserId.ToString();
        HeInfo.Age = txtAge.Text.ToString();
        HeInfo.Height = 0.ToString();
        HeInfo.Weight = 0.ToString();
        HeInfo.HeartRate = 0.ToString();
        HeInfo.SugarLevel = 0.ToString();
        HeInfo.Cholestrol = 0.ToString();
        HeInfo.Platelet = 0.ToString();
        HeInfo.setHealth();

        ve.mUId = Convert.ToInt32(UserId.ToString());
        ve.mStat = "Active";
        ve.initApp();

        reg.Id = UserId.ToString();
        reg.Name = txtName.Text.ToString();
        reg.Address = txtAddress.Text.ToString();
        reg.Dob = Request.Form[txtdob.UniqueID];
        reg.Age = txtAge.Text.ToString();
        reg.Gender = rbGender.SelectedItem.Value.ToString();
        reg.EmailId = txtEmail.Text.ToString();
        reg.Username = txtUser.Text;
        reg.Password = txtPass.Text;
        reg.Phone = txtPhone.Text;
        reg.Status = "Active";
        reg.registerUser();
        string message = "You Have Registered Successfully.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        Session["UserId"] = UserId.ToString();
        Session["UserAge"] = txtAge.Text.ToString();
        Response.Redirect("HealthReg.aspx?pg=hr");
    }
}