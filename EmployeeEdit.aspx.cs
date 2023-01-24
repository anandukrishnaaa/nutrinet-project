using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Data.SqlClient;

public partial class EmployeeEdit : System.Web.UI.Page
{
    clsReg reg = new clsReg();
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        dt = reg.selEmpDB();

        if (!IsPostBack)
        {
        }
    }
}