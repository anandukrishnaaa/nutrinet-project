using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

public partial class EmpCalTrack : System.Web.UI.Page
{
    DataTable dt,dc = new DataTable();
    clsWellness cs = new clsWellness();
    public int id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadgCTData();
        }
    }

    protected void gvCalTrk_SelectedIndexChanged(object sender, EventArgs e)
    {
        id = Convert.ToInt32(gvCalTrk.SelectedRow.Cells[1].Text);
        loadChart(id);
    }

    protected void loadgCTData()
    {
        dt = cs.getAllCT();
        gvCalTrk.DataSource = dt;
        gvCalTrk.DataBind();
    }

    protected void loadChart(int id)
    {
        dc = cs.getUsrCT(id);
        chartCT.DataSource = dc;
        chartCT.DataBind();
        chartCT.Series[0].MarkerStyle = MarkerStyle.Circle;
        chartCT.Series[0].MarkerColor = Color.Black;
        chartCT.Series[0].MarkerSize = 10;
    }
}