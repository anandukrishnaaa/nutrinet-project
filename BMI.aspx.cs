using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    string _bmi;
    clsHealthInfo he = new clsHealthInfo();
    DataTable dl;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            loadFields();
        }
        else
        {
             ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }

    protected void btnCalculateBMI_Click(object sender, EventArgs e)
    {
        double _bmi_p = (Convert.ToDouble(txtWt.Text) * 100) / (Convert.ToDouble(txtHt.Text) * 2);
        if (_bmi_p < 16)
        {
            _bmi = "Severe Thinness";
        }
        else if (_bmi_p >= 16 && _bmi_p < 17)
        {
            _bmi = "Moderate Thinness";
        }
        else if (_bmi_p >= 17 && _bmi_p < 18.5)
        {
            _bmi = "Mild Thinness";
        }
        else if (_bmi_p >= 18.5 && _bmi_p < 25)
        {
            _bmi = "Normal";
        }
        else if (_bmi_p >= 25 && _bmi_p < 30)
        {
            _bmi = "Overweight";
        }
        else if (_bmi_p >= 30 && _bmi_p < 35)
        {
            _bmi = "Obese Class I";
        }
        else if (_bmi_p >= 35 && _bmi_p < 40)
        {
            _bmi = "Obese Class II";
        }
        else if (_bmi_p >= 40)
        {
            _bmi = "Obese Class III";
        }

        txtBMI.Text = "BMI is " + _bmi_p.ToString("0.00") + " kg/m2 - " + _bmi;
    }

    protected void loadFields()
    {
        if (Session["UserId"] != null)
        {
            he.UserId = Session["UserId"].ToString();
            dl = he.showHealthUsr();
            txtHt.Text = dl.Rows[0]["HT_Height"].ToString();
            txtWt.Text = dl.Rows[0]["HT_Weight"].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}
