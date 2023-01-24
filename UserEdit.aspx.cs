using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class UserEdit : System.Web.UI.Page
{
    clsProfiles usr = new clsProfiles();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadUser();
        }
    }

    public void loadUser()
    {
        if (Session["UserId"] != null)
        {
            usr.Id = Session["UserId"].ToString();
            dt = usr.getUser();
            txtName.Text = dt.Rows[0]["UDB_Name"].ToString();
            txtAddress.Text = dt.Rows[0]["UDB_Address"].ToString();
            txtdob.Text = dt.Rows[0]["UDB_DOB"].ToString();
            txtGender.Text = dt.Rows[0]["UDB_Gender"].ToString();
            txtEmail.Text = dt.Rows[0]["UDB_Email"].ToString();
            txtUser.Text = dt.Rows[0]["UDB_Username"].ToString();
            txtOldPassCVal.ValueToCompare = dt.Rows[0]["UDB_Password"].ToString();
            txtNewPassCOVal.ValueToCompare = dt.Rows[0]["UDB_Password"].ToString();
            txtPhone.Text = dt.Rows[0]["UDB_Phone"].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }

    protected void btnUserUpdate_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            usr.Id = Session["UserId"].ToString();
            usr.Name = txtName.Text.ToString();
            usr.Address = txtAddress.Text.ToString();
            usr.EmailId = txtEmail.Text.ToString();
            usr.Password = txtNewPass.Text;
            usr.Phone = txtPhone.Text;
            btnUserUpdate.CssClass = "btn btn-primary me-2";
            usr.editUser();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Profile Updated! Login again.');window.location ='Login.aspx';", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}