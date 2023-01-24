using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class EmployeeRegistration : System.Web.UI.Page
{
    clsReg reg = new clsReg();
    DataTable de,du = new DataTable();
    private int EmpId;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnEmpReg_Click(object sender, EventArgs e)
    {
        reg.Username = txtUser.Text;
        de = reg.verifyEmpReg();
        du = reg.verifyUserReg();

        if (de.Rows.Count != 0 || du.Rows.Count != 0)
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Username already taken!');", true);
            txtUser.Focus();
            return;
        }

        string doB = Request.Form[txtdob.UniqueID];

        EmpId = reg.getEmpCount();
        EmpId = EmpId + 1;

        reg.Id = EmpId.ToString();
        reg.Name = txtName.Text.ToString(); ;
        reg.Address = txtAddress.Text.ToString();
        reg.Dob = txtdob.Text;
        reg.Age = txtAge.Text;
        reg.Gender = rbGender.SelectedItem.Value.ToString();
        reg.EmailId = txtEmail.Text;
        reg.Qualification = txtQual.Text;
        reg.Username = txtUser.Text;
        reg.Password = txtPass.Text;
        reg.Phone = txtPhone.Text;
        reg.Status = "Registered";
        reg.registerEmp();
        string message = "You Have Registered Successfully as an Employee.";
        string script = "window.onload = function(){ alert('";
        script += message;
        script += "')};";
        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        Session["EmpId"] = EmpId.ToString();
        Session.Add("EmpName", txtName.Text);
        Response.Redirect("EmployeeManagement.aspx?pg=emp");
    }
}