using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    clsReg reg = new clsReg();
    DataTable de, du;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        reg.Username = txtUsername.Text;
        reg.Password = txtPass.Text;
        de = reg.selEmpDB();
        du = reg.selUserDB();
        if (de.Rows.Count != 0)
        {
            Session["EmpId"] = de.Rows[0]["EDB_Id"].ToString();
            Session["EmpName"] = de.Rows[0]["EDB_Name"].ToString();
            Response.Redirect("UserManagement.aspx?pg=u");
        }
        else if (txtUsername.Text == "admin" && txtPass.Text == "admin")
        {
            Session["admin"] = "superuser".ToString();
            Response.Redirect("EmployeeManagement.aspx?pg=emp");
        }
        else if (du.Rows.Count != 0)
        {
            Session["UserId"] = du.Rows[0]["UDB_Id"].ToString();
            Session["UserName"] = du.Rows[0]["UDB_Name"].ToString();
            Response.Redirect("UserView.aspx?pg=uv");
        }
        else
        {
            string message = "Invalid Username or Password! Try Again.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        }
    }
}