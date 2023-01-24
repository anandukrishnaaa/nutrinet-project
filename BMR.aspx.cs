using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class BMR : System.Web.UI.Page
{
    double bmr, bmrmult;
    string gender, exercise;
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

    protected void btnCalculateBMR_Click(object sender, EventArgs e)
    {
        if (genderList.SelectedIndex != -1)
        {
            gender = genderList.SelectedItem.Value.ToString();
            switch (gender)
            {
                case "M":
                    bmr = (double.Parse(txtWt.Text) * 10 + double.Parse(txtHt.Text) * 6.25 - double.Parse(txtAge.Text) * 5 - 5);

                    break;
                case "F":
                    bmr = (double.Parse(txtWt.Text) * 10 + double.Parse(txtHt.Text) * 6.25 - double.Parse(txtAge.Text) * 5 - 161);

                    break;
            }
        }
        if (exerciseList.SelectedIndex != -1)
        {
            exercise = exerciseList.SelectedItem.Value.ToString();
            switch (exercise)
            {
                case "ex1":
                    bmrmult = 1.3 * bmr;
                    txtBMR.Text = "Your base metabolic rate burns : " + bmrmult + " calories";
                    break;
                case "ex2":
                    bmrmult = 1.5 * bmr;
                    txtBMR.Text = "Your base metabolic rate burns : " + bmrmult + " calories";
                    break;
                case "ex3":
                    bmrmult = 1.7 * bmr;
                    txtBMR.Text = "Your base metabolic rate burns : " + bmrmult + " calories";
                    break;
                case "ex4":
                    bmrmult = 1.9 * bmr;
                    txtBMR.Text = "Your base metabolic rate burns : " + bmrmult + " calories";
                    break;
            }
        }
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
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }
}