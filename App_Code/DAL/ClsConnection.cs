using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

//Basic Connection Data

public class ClsConnection
{
 string strCon;

    public string stringConnection()
    {
        strCon = "Data Source=USER-PC\\USERPC;Initial Catalog=NutriNetDB;Integrated Security=True";
        return strCon;
    }
        
    public DataTable sel_Qry(string Qry)
    {
        DataTable dt = new DataTable();
        string selectQuery = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        selectQuery = Qry;
        SqlDataAdapter adptrSql = new SqlDataAdapter(selectQuery, SqlCon);
        adptrSql.Fill(dt);
        SqlCon.Close();
        return dt;
    }

    public void ins_upt_del_Qry(string Qry)
    {
        DataTable dt = new DataTable();
        string delQuery = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        delQuery = Qry;
        SqlCommand cmdSql = new SqlCommand(delQuery, SqlCon);
        cmdSql.ExecuteNonQuery();
        SqlCon.Close();
    }

    public int countQry(string Qry)
    {
        string countQuery = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        countQuery = Qry;
        SqlCommand cmd = new SqlCommand(countQuery, SqlCon);
        Int32 count = (Int32)cmd.ExecuteScalar();
        SqlCon.Close();
        return count;
    }

    public void insMealnEx_Qry(string Qry)
    {
        string insMealnEx = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        insMealnEx = Qry;
        SqlCommand cmd = new SqlCommand(insMealnEx, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();
    }

    public DataTable showMealnEx_Qry(string Qry)
    {
        DataTable dt = new DataTable();
        string showMealnEx = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        showMealnEx = Qry;
        SqlDataAdapter adptrSql = new SqlDataAdapter(showMealnEx, SqlCon);
        adptrSql.Fill(dt);
        SqlCon.Close();
        return dt;
    }


    public void insMed_Qry(string Qry)
    {
        string insMed = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        insMed = Qry;
        SqlCommand cmd = new SqlCommand(insMed, SqlCon);
        cmd.ExecuteNonQuery();
        SqlCon.Close();
    }

    public DataTable showMed_Qry(string Qry)
    {
        DataTable dt = new DataTable();
        string showMed = null;
        SqlConnection SqlCon = new SqlConnection(stringConnection());
        SqlCon.Open();
        //Query building
        showMed = Qry;
        SqlDataAdapter adptrSql = new SqlDataAdapter(showMed, SqlCon);
        adptrSql.Fill(dt);
        SqlCon.Close();
        return dt;
    }
}