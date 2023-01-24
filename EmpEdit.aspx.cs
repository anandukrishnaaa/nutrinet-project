using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class EmpEdit : System.Web.UI.Page
{
    clsProfiles emp = new clsProfiles();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadEmp();
        }
    }

    public void loadEmp()
    {
        if (Session["EmpId"] != null)
        {
            emp.Id = Session["EmpId"].ToString();
            dt = emp.getEmp();
            txtName.Text = dt.Rows[0]["EDB_Name"].ToString();
            txtAddress.Text = dt.Rows[0]["EDB_Address"].ToString();
            txtdob.Text = dt.Rows[0]["EDB_DOB"].ToString();
            txtGender.Text = dt.Rows[0]["EDB_Gender"].ToString();
            txtEmail.Text = dt.Rows[0]["EDB_Email"].ToString();
            txtUser.Text = dt.Rows[0]["EDB_Username"].ToString();
            txtOldPassCVal.ValueToCompare = dt.Rows[0]["EDB_Password"].ToString();
            txtNewPassCOVal.ValueToCompare = dt.Rows[0]["EDB_Password"].ToString();
            txtPhone.Text = dt.Rows[0]["EDB_Phone"].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
    protected void btnUserUpdate_Click(object sender, EventArgs e)
    {
        if (Session["EmpId"] != null)
        {
            emp.Id = Session["EmpId"].ToString();
            emp.Name = txtName.Text.ToString();
            emp.Address = txtAddress.Text.ToString();
            emp.EmailId = txtEmail.Text.ToString();
            emp.Password = txtNewPass.Text;
            emp.Phone = txtPhone.Text;
            btnUserUpdate.CssClass = "btn btn-primary me-2";
            emp.editEmp();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Updated! Login again.');window.location ='Login.aspx';", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}