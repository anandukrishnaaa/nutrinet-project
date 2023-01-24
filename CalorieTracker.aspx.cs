using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

public partial class CalorieTracker : System.Web.UI.Page
{
    clsWellness ct = new clsWellness();
    int id,flag=0;
    string date, today;
    DataTable dt,dc,di = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Session["UserId"]);
        lblDay.Text = DateTime.Today.ToString("dd/MM/yyyy");
        today = DateTime.Today.ToString("dd.MM.yyyy");
   
        if(!IsPostBack)
        {
            loadData();
        }
    }

    protected int loadData()
    {
        dt = ct.getCT(id);
        if (dt.Rows.Count > 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    protected void btnSubmitCal_Click(object sender, EventArgs e)
    {
        date = DateTime.Today.ToString("dd.MM.yyyy");
        loadData();
        if (loadData() != 0)
        {
            foreach (DataRow row in dt.Rows)
            {
                if (today == row["CT_Date"].ToString())
                {
                    ct.Id = id.ToString();
                    ct.cdate = today;
                    ct.cal = txtCal.Text;
                    ct.updateCT();
                    lblUpdate.Text = "<h5>Calorie updated succesfully!</h5>";
                    btnSubmitCal.CssClass = "form-control btn btn-primary";
                    flag = 1;
                    loadChart();
                }
            }
        }
        else
        {
            flag = 0;
        }
        if(flag == 0)
        {
             ct.Id = id.ToString();
             ct.cal = txtCal.Text;
             ct.cdate = date.ToString();
             ct.setCT();
             lblUpdate.Text = "<h5>Calorie inserted succesfully!</h5>";
             btnSubmitCal.CssClass = "form-control btn btn-primary";
             loadChart();
        }
    }

    protected void loadChart()
    {
        dc = ct.getUsrCT(id);
        chartCT.DataSource = dc;
        chartCT.DataBind();
        chartCT.Series[0].MarkerStyle = MarkerStyle.Circle;
        chartCT.Series[0].MarkerColor = Color.Black;
        chartCT.Series[0].MarkerSize = 10;
        di = ct.getCTinfo(id);
        gvCTinfo.DataSource = di;
        gvCTinfo.DataBind();
    }
}