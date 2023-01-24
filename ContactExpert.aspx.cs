using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Data;

public partial class ContactExpert : System.Web.UI.Page
{
    clsWellness ce = new clsWellness();
    clsReg usr = new clsReg();
    DataTable dt;
    int CEid;

    protected void dataLoad()
    {
            int id = Convert.ToInt32(Session["UserId"]);
            String qry = "SELECT UDB_Name,UDB_Email FROM UserDB WHERE UDB_Status='Active' AND UDB_Id='" + id + "'";
            dt = usr.showUserData(qry);
            gvCE.DataSource = dt;
            gvCE.DataBind();
            String name = dt.Rows[0]["UDB_Name"].ToString();
            String email = dt.Rows[0]["UDB_Email"].ToString();
            txtName.Text = name;
            txtEmail.Text = email;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        CEid = ce.countCE();
        CEid = CEid + 1;
        if (Session["UserId"] != null)
        {
            dataLoad();
        }
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        ce.cId = CEid;
        ce.cUser = txtName.Text.ToString();
        ce.cSub = txtSubject.Text.ToString();
        ce.cCon = txtEmail.Text;
        ce.cMsg= txtBody.Text.ToString();
        ce.cStat = "Unresolved";
        ce.insertCE();
        lblMessage.Text = "Thank you for your message! We'll be getting back to you soon!";
    }
    
}