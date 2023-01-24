using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserView : System.Web.UI.Page
{
    DataTable dt,dx = new DataTable();
    clsHealthInfo he = new clsHealthInfo();
    int flag=0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["UserId"] != null)
            {
                he.UserId = Session["UserId"].ToString();
                LoadgvUsrView();
                checkData();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
            }
        }
    }

    protected void LoadgvUsrView()
    {
        if (Session["UserId"] != null)
        {
            dt = he.showHealthUsr();
            gvUsrInv.DataSource = dt;
            gvUsrInv.DataBind();
            for (int i = 0; i < gvUsrInv.Columns.Count; i++)
            {
                dx.Columns.Add(gvUsrInv.HeaderRow.Cells[i].Text);
            }
            foreach (GridViewRow row in gvUsrInv.Rows)
            {
                DataRow dr = dx.NewRow();
                for (int j = 0; j < gvUsrInv.Columns.Count; j++)
                {
                    dr[gvUsrInv.HeaderRow.Cells[j].Text] = row.Cells[j].Text;
                }

                dx.Rows.Add(dr);
            }
            gvUSrView.DataSource = ConvertColumnsAsRows(dx);
            gvUSrView.DataBind();
            gvUSrView.HeaderRow.Visible = false;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Session Expired! Please login again.');window.location ='Login.aspx';", true);
        }
    }

    // This function is used to convert columns to rows
    public DataTable ConvertColumnsAsRows(DataTable dt)
    {
        DataTable dtnew = new DataTable();
        //Convert all the rows to columns
        for (int i = 0; i <= dt.Rows.Count; i++)
        {
            dtnew.Columns.Add(Convert.ToString(i));
        }
        DataRow dr;
        // Convert All the Columns to Rows
        for (int j = 0; j < dt.Columns.Count; j++)
        {
            dr = dtnew.NewRow();
            dr[0] = dt.Columns[j].ToString();
            for (int k = 1; k <= dt.Rows.Count; k++)
                dr[k] = dt.Rows[k - 1][j];
            dtnew.Rows.Add(dr);
        }
        return dtnew;
    }

    protected void checkData()
    {
        DataTable dh = new DataTable();
        dh = he.showHealthUsr();

        double _sgr_v = (Convert.ToDouble(dh.Rows[0]["HT_SugarLevel"].ToString()));
        double _plt_v = (Convert.ToDouble(dh.Rows[0]["HT_Platelet"].ToString()));
        double _chlstrl_v = (Convert.ToDouble(dh.Rows[0]["HT_Cholestrol"].ToString()));

        if (_sgr_v == 0)
        {
            lblSgr.Visible = false;
        }
        else if (_sgr_v < 70)
        {
            lblSgr.ForeColor = System.Drawing.Color.IndianRed;
            lblSgr.Text = "<h6>Sugar Level (" + _sgr_v + "mg/dL) falls below the normal (70 - 140 mg/dL) range! Possibility of Hypoglycemia.</h6>";
            flag++;
        }
        else if (_sgr_v > 140)
        {
            lblSgr.ForeColor = System.Drawing.Color.IndianRed;
            lblSgr.Text = "<h6>Sugar Level (" + _sgr_v + "mg/dL) exceeds normal (70 - 140 mg/dL) range! Possibility of Hyperglycemia.</h6>";
            flag++;
        }
        else
        {
            lblSgr.ForeColor = System.Drawing.Color.Green;
            lblSgr.Text = "<h6>Sugar Level (" + _sgr_v + "mg/dL) is within the normal (70 - 140 mg/dL) range. Well done.</h6>";
        }

        if (_plt_v == 0)
        {
            lblPlt.Visible = false;
        }
        else if (_plt_v < 1.5)
        {
            lblPlt.ForeColor = System.Drawing.Color.IndianRed;
            lblPlt.Text = "<h6>Platelet count (" + _plt_v + "lakh/microL) falls below the normal (1.5 - 4 lakh/microL) range! Possiblity of Thrombocytopenia.</h6>";
            flag++;
        }
        else if (_plt_v > 4)
        {
            lblPlt.ForeColor = System.Drawing.Color.IndianRed;
            lblPlt.Text = "<h6>Platelet count (" + _plt_v + "lakh/microL) exceeds normal (1.5 - 4 lakh/microL) range! Possiblity of Primary Thrombocytosis.</h6>";
            flag++;
        }
        else
        {
            lblPlt.ForeColor = System.Drawing.Color.Green;
            lblPlt.Text = "<h6>Platelet count (" + _plt_v + "lakh/microL) is within the normal (1.5 - 4 lakh/microL) range. Well done.</h6>";
        }

        if (_chlstrl_v == 0)
        {
            lblChols.Visible = false;
        }
        else if (_chlstrl_v < 190)
        {
            lblChols.ForeColor = System.Drawing.Color.IndianRed;
            lblChols.Text = "<h6>Cholestrol level (" + _chlstrl_v + "mg/dL) falls below the normal (200 mg/dL) range!</h6>";
            flag++;
        }
        else if (_chlstrl_v > 210)
        {
            lblChols.ForeColor = System.Drawing.Color.IndianRed;
            lblChols.Text = "<h6>Cholestrol level (" + _chlstrl_v + "mg/dL) exceeds the normal (200 mg/dL) range! Possibility of Hyperlipidemia/Hypercholestrolemia.</h6>";
            flag++;
        }
        else
        {
            lblChols.ForeColor = System.Drawing.Color.Green;
            lblChols.Text = "<h6>Cholestrol level (" + _chlstrl_v + "mg/dL) is within the normal (200 mg/dL) range. Well done.</h6>";
        }

        if (flag != 0)
        {
            lnkApp.Visible = true;
        }
    }
}