using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

//Wellness Queries

public class clsWellness
{
    String qry2 = "",qry3 = "";
    int count;
    ClsConnection objCon2 = new ClsConnection();
    DataTable dt = new DataTable();

    public string Id { get; set; }
    public string A { get; set; }
    public string B { get; set; }
    public string C { get; set; }
    public string D { get; set; }
    public string E { get; set; }
    public string F { get; set; }
    public string G { get; set; }
    public string H { get; set; }
    public string I { get; set; }

    public int mUId { get; set; }
    public string mUser { get; set; }
    public string mDate { get; set; }
    public string mTime { get; set; }
    public string mMsg { get; set; }
    public string mExpert { get; set; }
    public string mStat { get; set; }

    public int cId { get; set; }
    public string cUser { get; set; }
    public string cSub { get; set; }
    public string cCon { get; set; }
    public string cMsg { get; set; }
    public string cStat { get; set; }

    public string cal { get; set; }
    public string cdate { get; set; }

    public string fTable { get; set; }
    public string fCol { get; set; }
    public string fDay { get; set; }

    public void setMealPlan()
    {
        qry2 = "INSERT INTO MealPlanDB(User_Id, MP_Monday, MP_Tuesday, MP_Wednesday, MP_Thursday, MP_Friday, MP_Saturday, MP_Flag) VALUES ('" + Id + "','" + A + "','" + B + "','" + C + "','" + D + "','" + E + "','" + F + "','" + G + "')";
        objCon2.insMealnEx_Qry(qry2);
    }

    public void updateMealPlan(int id)
    {
        qry2 = "UPDATE MealPlanDB SET MP_Monday='" + A + "',MP_Tuesday='" + B + "',MP_Wednesday='" + C + "',MP_Thursday='" + D + "',MP_Friday='" + E + "',MP_Saturday='" + F + "' WHERE User_Id = '" + id + "'";
        objCon2.insMealnEx_Qry(qry2);
    }

    public void setExcercisePlan()
    {
        qry2 = "INSERT INTO ExcerciseDB(User_Id, Ex_Pushups, Ex_JumpJacks, Ex_DeclPushups, Ex_DiamondPushups, Ex_WideArmPushups, Ex_CobraStrech, Ex_ChestStrech, Ex_Yoga, Ex_Flag) VALUES ('" + Id + "','" + A + "','" + B + "','" + C + "','" + D + "','" + E + "','" + F + "','" + G + "','" + H + "','" + I + "')";
        objCon2.insMealnEx_Qry(qry2);
    }

    public void updateExcercisePlan(int id)
    {
        qry2 = "UPDATE ExcerciseDB SET Ex_Pushups='" + A + "',Ex_JumpJacks='" + B + "',Ex_DeclPushups='" + C + "',Ex_DiamondPushups='" + D + "',Ex_WideArmPushups='" + E + "',Ex_CobraStrech='" + F + "',Ex_ChestStrech='" + G + "',Ex_Yoga='" + H + "' WHERE User_Id = '" + id + "'";
        objCon2.insMealnEx_Qry(qry2);
    }

    public DataTable showAllMealPlan()
    {
        qry2 = "SELECT DISTINCT u.UDB_Id, u.UDB_Name, h.HT_Age, u.UDB_Gender, m.MP_Monday, m.MP_Tuesday, m.MP_Wednesday, m.MP_Thursday, m.MP_Friday, m.MP_Saturday, m.MP_Flag FROM UserDB u, HealthTrackerDB h, MealPlanDB m WHERE u.UDB_Id = h.HT_UserId AND u.UDB_Id = m.User_Id AND u.UDB_Status='Active'";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable showMealPlan(int id)
    {
        qry2 = "SELECT u.UDB_Id, u.UDB_Name, m.MP_Monday, m.MP_Tuesday, m.MP_Wednesday, m.MP_Thursday, m.MP_Friday, m.MP_Saturday FROM MealPlanDB m, UserDB u WHERE u.UDB_Id = '" + id + "' AND m.User_Id = '" + id + "' AND u.UDB_Status='Active'";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable showAllExcercisePlan()
    {
        qry2 = "SELECT DISTINCT u.UDB_Id, u.UDB_Name, h.HT_Age, u.UDB_Gender, e.Ex_Pushups, e.Ex_JumpJacks, e.Ex_DeclPushups, e.Ex_DiamondPushups, e.Ex_WideArmPushups, e.Ex_CobraStrech, e.Ex_ChestStrech, e.Ex_Yoga, e.Ex_Flag FROM ExcerciseDB e, UserDB u, HealthTrackerDB h WHERE u.UDB_Id = h.HT_UserId AND u.UDB_Id = e.User_Id AND u.UDB_Status='Active'";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable showExcercisePlan(int id)
    {
        qry2 = "SELECT u.UDB_Id, h.HT_Age, u.UDB_Gender, e.Ex_Pushups, e.Ex_JumpJacks, e.Ex_DeclPushups, e.Ex_DiamondPushups, e.Ex_WideArmPushups, e.Ex_CobraStrech, e.Ex_ChestStrech, e.Ex_Yoga FROM ExcerciseDB e, UserDB u, HealthTrackerDB h WHERE u.UDB_Id = '" + id + "' AND h.HT_UserId = '" + id + "' AND e.User_Id ='" + id + "'";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable showAllMed()
    {
        qry2 = "SELECT a.*,u.UDB_Status FROM AppointmentDB a,UserDB u WHERE u.UDB_Id=a.M_Id AND NOT a.M_Status='Active' AND u.UDB_Status='Active' ORDER BY u.UDB_Id";
        dt = objCon2.showMed_Qry(qry2);
        return dt;
    }

    public DataTable showMed(int id)
    {
        qry2 = "SELECT u.UDB_Id, u.UDB_Name, a.* FROM  UserDB u, AppointmentDB a WHERE a.M_Id ='" + id + "' AND u.UDB_Id = '" + id + "'";
        dt = objCon2.showMed_Qry(qry2);
        return dt;
    }

    public void initApp()
    {
        qry2 = "INSERT INTO AppointmentDB(M_Id, M_Username, M_Expert, M_Msg, M_Date, M_Time, M_Status) VALUES ('" + mUId + "','" + mUser + "','" + mExpert + "','" + mMsg + "','" + mDate + "','" + mTime + "','" + mStat + "')";
      objCon2.insMed_Qry(qry2);
    }

    public void reqApp(int id)
    {
        qry2 = "UPDATE AppointmentDB SET M_Username='" + mUser + "',M_Expert='" + mExpert + "',M_Msg='" + mMsg + "',M_Date='" + mDate + "',M_Time='" + mTime + "',M_Status='" + mStat + "' WHERE M_Id = '" + id + "'";
        objCon2.insMed_Qry(qry2);
    }

    public void setApp(int id)
    {
        qry2 = "UPDATE AppointmentDB SET M_Username='" + mUser + "',M_Expert='" + mExpert + "',M_Date='" + mDate + "',M_Time='" + mTime + "',M_Status='" + mStat + "' WHERE M_Id = '" + id + "'";
        objCon2.insMed_Qry(qry2);
    }

    public DataTable getCT(int id)
    {
        qry2 = "SELECT CT_Id,CT_Date,CT_Cals FROM CalorieTrackerDB WHERE CT_Id = '" + id + "'";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable getUsrCT(int id)
    {
        qry2 = "SELECT CT_Date,CT_Cals FROM CalorieTrackerDB WHERE CT_Id = '" + id + "' ORDER BY CT_Date DESC";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable getCTinfo(int id)
    {
        qry2 = "SELECT u.UDB_Id,u.UDB_Name,CAST(AVG(c.CT_Cals) AS DECIMAL(10,2)) AS CT_AVG,SUM(c.CT_Cals) AS CT_SUM FROM UserDB u,CalorieTrackerDB c WHERE u.UDB_Id='" + id + "' AND c.CT_Id ='" + id + "' GROUP BY u.UDB_Id,u.UDB_Name";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public DataTable getAllCT()
    {
        qry2 = "SELECT u.UDB_Id,u.UDB_Name,CAST(AVG(c.CT_Cals) AS DECIMAL(10,2)) AS CT_AVG,SUM(c.CT_Cals) AS CT_SUM FROM UserDB u, CalorieTrackerDB c WHERE u.UDB_Id = c.CT_Id AND u.UDB_Status='Active' GROUP BY u.UDB_Id,u.UDB_Name";
        dt = objCon2.showMealnEx_Qry(qry2);
        return dt;
    }

    public void setCT()
    {
        qry2 = "INSERT INTO CalorieTrackerDB(CT_Id,CT_Date,CT_Cals) VALUES ('" + Id + "','" + cdate + "','" + cal + "')";
        objCon2.insMealnEx_Qry(qry2);
    }

    public void updateCT()
    {
        qry2 = "UPDATE CalorieTrackerDB SET CT_Cals = '" + cal + "' WHERE CT_Id = '" + Id + "' AND CT_Date = '" + cdate + "' ";
        objCon2.insMealnEx_Qry(qry2);
    }

    public int countCE()
    {
        qry3 = "SELECT COUNT(CE_Id) FROM ContactExpertDB";
        count = objCon2.countQry(qry3);
        return count;
    }

    public void insertCE()
    {
        qry3 = "INSERT INTO ContactExpertDB(CE_Id,CE_Username,CE_Subject,CE_Contact,CE_Message,CE_Status) VALUES('" + cId + "','" + cUser + "','" + cSub + "','" + cCon + "','" + cMsg + "','" + cStat + "')";
        objCon2.insMealnEx_Qry(qry3);
    }

    public DataTable getCE()
    {
        qry3 = "SELECT * FROM ContactExpertDB";
        dt = objCon2.sel_Qry(qry3);
        return dt;
    }

    public void updateCE(int id)
    {
        qry3 = "UPDATE ContactExpertDB SET CE_Status='" + cStat + "' WHERE CE_Id = '" + id + "'";
        objCon2.insMealnEx_Qry(qry3);
    }

    public string getflag()
    {
        qry3 = "SELECT " + fCol + " FROM " + fTable + " WHERE User_Id = '" + Id + "'";
        dt = objCon2.sel_Qry(qry3);
        string col = fCol;
        string flag = dt.Rows[0][col].ToString();
        return flag;
    }

    public void updateflag()
    {
        qry3 = "UPDATE " + fTable + " SET " + fCol + " = '" + fDay + "' WHERE User_Id = '" + Id + "'";
        objCon2.ins_upt_del_Qry(qry3);
    }
}