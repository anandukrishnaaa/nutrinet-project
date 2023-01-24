using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

//Manipulation Queries

public class clsAdmin
{
    string qry = "";
    ClsConnection objCon = new ClsConnection();
    DataTable dt = new DataTable();
    
    public string Name { get; set; }
    public string Id { get; set; }
    public string Status { get; set; }
    public string Dob { get; set; }

    public DataTable displayEmp()
    {
        qry = "SELECT EDB_Id,EDB_Name,EDB_Address,EDB_DOB,EDB_Age,EDB_Gender,EDB_Email,EDB_Qualification,EDB_Username,EDB_Phone,EDB_Status FROM EmployeeDB ";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
    public void approveEmp()
    {
        qry = "UPDATE EmployeeDB SET EDB_Status='Approved' WHERE EDB_Id='" + Id + "'";
        objCon.ins_upt_del_Qry(qry);
    }
    public void removeEmp()
    {
        qry = "UPDATE EmployeeDB SET EDB_Status='Removed' WHERE EDB_Id='" + Id + "'";
        objCon.ins_upt_del_Qry(qry);
    }
    public void approveUser()
    {
        qry = "UPDATE UserDB SET UDB_Status='Active' WHERE UDB_Id='" + Id + "'";
        objCon.ins_upt_del_Qry(qry);
    }

    public void removeUser()
    {
        qry = "UPDATE UserDB SET UDB_Status='Removed' WHERE UDB_Id='" + Id + "'";
        objCon.ins_upt_del_Qry(qry);
    }

}