using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class HealthTracking : System.Web.UI.Page
{
    clsHealthInfo HeInfo = new clsHealthInfo();
    clsHealthInfo he = new clsHealthInfo();
    DataTable dl;

    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
        {
            loadFields();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Session["UserId"]);
        HeInfo.Age = txtAge.Text;
        string _bmi = "",_sgr = "",_plt = "",_chlstrl = "";
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

        double _sgr_v = (Convert.ToDouble(txtSgrLvl.Text));
        double _plt_v = (Convert.ToDouble(txtPlt.Text));
        double _chlstrl_v = (Convert.ToDouble(txtChLvl.Text));

        if(_sgr_v < 70)
        {
            _sgr = "Sugar Level (" + _sgr_v + "mg/dL) falls below the normal (70 - 140 mg/dL) range! Possibile Hypoglycemia.";
        }
        else if (_sgr_v > 140 )
        {
            _sgr = "Sugar Level (" + _sgr_v + "mg/dL) exceeds normal (70 - 140 mg/dL) range! Possibile Hyperglycemia.";
        }
        else
        {
            _sgr = "Sugar Level (" + _sgr_v + "mg/dL) is within the normal (70 - 140 mg/dL) range.";
        }

        if (_plt_v < 1.5)
        {
            _plt = "Platelet count (" + _plt_v + "lakh/microL) falls below the normal (1.5 - 4 lakh/microL) range! Possible Thrombocytopenia.";
        }
        else if (_plt_v > 4)
        {
            _plt = "Platelet count (" + _plt_v + "lakh/microL) exceeds normal (1.5 - 4 lakh/microL) range! Possible Thrombocytosis.";
        }
        else
        {
            _plt = "Platelet count (" + _plt_v + "lakh/microL) is within the normal (1.5 - 4 lakh/microL) range.";
        }

        if(_chlstrl_v < 190)
        {
            _chlstrl = "Cholestrol level (" + _chlstrl_v + "mg/dL) falls below the normal (200 mg/dL) range!";
        }
        else if(_chlstrl_v > 210)
        {
            _chlstrl = "Cholestrol level (" + _chlstrl_v + "mg/dL) exceeds the normal (200 mg/dL) range! Possibility of Hyperlipidemia/Hypercholestrolemia.";
        }
        else
        {
            _chlstrl = "Cholestrol level (" + _chlstrl_v + "mg/dL) is within the normal (200 mg/dL) range.";
        }


        txtGo.Text = "Records Updated!";

        txtGo.Text = txtGo.Text + Environment.NewLine + "BMI is " + _bmi_p.ToString("0.00") + " kg/m2 - " + _bmi + Environment.NewLine + "Sugar Level is " + _sgr_v.ToString("0.00") + " mg/dL - " + _sgr + Environment.NewLine + "Platelet is " + _plt_v.ToString("0.00") + " lakh/microL of blood - " + _plt + Environment.NewLine + "Cholestrol is " + _chlstrl_v.ToString("0.00") + " mg/dL - " + _chlstrl;

        HeInfo.Age = txtAge.Text;
        HeInfo.Height = txtHt.Text;
        HeInfo.Weight = txtWt.Text;
        HeInfo.HeartRate = txtHrtRt.Text;
        HeInfo.SugarLevel = txtSgrLvl.Text;
        HeInfo.Cholestrol = txtChLvl.Text;
        HeInfo.Platelet = txtPlt.Text;
        HeInfo.trackHealth(id);
        loadFields();

    }

    protected void loadFields()
    {
        if (Session["UserId"] != null)
        {
            he.UserId = Session["UserId"].ToString();
            dl = he.showHealthUsr();
            txtHt.Text = dl.Rows[0]["HT_Height"].ToString();
            txtWt.Text = dl.Rows[0]["HT_Weight"].ToString();
            txtAge.Text = dl.Rows[0]["HT_Age"].ToString();
            txtChLvl.Text = dl.Rows[0]["HT_Cholestrol"].ToString();
            txtHrtRt.Text = dl.Rows[0]["HT_HeartRate"].ToString();
            txtPlt.Text = dl.Rows[0]["HT_Platelet"].ToString();
            txtSgrLvl.Text = dl.Rows[0]["HT_SugarLevel"].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}