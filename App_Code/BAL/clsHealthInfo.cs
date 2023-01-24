using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

// Summary description for clsHealthInfo

public class clsHealthInfo
{
    string qry = "";
    ClsConnection objCon = new ClsConnection();
    DataTable dt = new DataTable();

    public string UserId { get; set; }
    public string Age { get; set; }
    public string Height { get; set; }
    public string Weight { get; set; }
    public string HeartRate { get; set; }
    public string SugarLevel { get; set; }
    public string Cholestrol { get; set; }
    public string Platelet { get; set; }

    public void setHealth()
    {
        qry = "INSERT INTO HealthTrackerDB(HT_UserId,HT_Age, HT_Height, HT_Weight, HT_HeartRate, HT_SugarLevel, HT_Cholestrol, HT_Platelet) VALUES ('" + UserId + "','" + Age + "','" + Height + "','" + Weight + "','" + HeartRate + "','" + SugarLevel + "','" + Cholestrol + "','" + Platelet + "')";
        objCon.insMealnEx_Qry(qry);
    }

    public void trackHealth(int id)
    {
        qry = "UPDATE HealthTrackerDB SET HT_Age='" + Age + "',HT_Height='" + Height + "',HT_Weight='" + Weight + "',HT_HeartRate='" + HeartRate + "',HT_SugarLevel='" + SugarLevel + "',HT_Cholestrol='" + Cholestrol + "',HT_Platelet='" + Platelet + "' WHERE HT_UserId = '" + HttpContext.Current.Session["UserId"].ToString() + "'";
        objCon.ins_upt_del_Qry(qry);
    }

    public DataTable showHealthTrack()
    {
        qry = "SELECT UserDB.UDB_Id, UserDB.UDB_Name, HealthTrackerDB.HT_Age, UserDB.UDB_Gender, HealthTrackerDB.HT_Height, HealthTrackerDB.HT_Weight, HealthTrackerDB.HT_HeartRate, HealthTrackerDB.HT_SugarLevel,     HealthTrackerDB.HT_Cholestrol, HealthTrackerDB.HT_Platelet From UserDB INNER JOIN HealthTrackerDB ON UserDB.UDB_Id = HealthTrackerDB.HT_UserId";
        dt = objCon.sel_Qry(qry);
        return dt;
    }

    public DataTable showHealth()
    {
        qry = "SELECT h.HT_UserId, u.UDB_Name, h.HT_Age, h.HT_Height, h.HT_Weight, h.HT_HeartRate, h.HT_SugarLevel, h.HT_Cholestrol, h.HT_Platelet FROM HealthTrackerDB h, UserDB u WHERE u.UDB_Id = h.HT_UserId AND u.UDB_Status='Active'";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
    public DataTable showHealthUsr()
    {
        qry = "SELECT h.HT_UserId, u.UDB_Name, h.HT_Age, h.HT_Height, h.HT_Weight, h.HT_HeartRate, h.HT_SugarLevel, h.HT_Cholestrol, h.HT_Platelet FROM HealthTrackerDB h, UserDB u WHERE u.UDB_Id = h.HT_UserId AND u.UDB_Id = '"+ UserId +"'";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
}