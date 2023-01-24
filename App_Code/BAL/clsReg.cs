using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

//Registration Data

public class clsReg
{
    string qry = "";
    ClsConnection objCon = new ClsConnection();
    DataTable dt = new DataTable();

    public string Name { get; set; }
    public string Dob { get; set; }
    public string Age { get; set; }
    public string Gender { get; set; }
    public string Address { get; set; }
    public string Qualification { get; set; }
    public string EmailId { get; set; }
    public string Phone { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public string Status { get; set; }
    public string Id { get; set; }
    public string Description { get; set; }
    public int id { get; set; }

    public void registerUser()
    {
        qry = "INSERT INTO UserDB(UDB_Id,UDB_Name,UDB_Address,UDB_DOB,UDB_Age,UDB_Gender,UDB_Email,UDB_Username,UDB_Password,UDB_Phone,UDB_Status) VALUES ('" + Id + "','"  + Name + "','" + Address + "','" + Dob + "','" + Age + "','" + Gender + "','" + EmailId + "','" + Username + "','" + Password + "','" + Phone + "','" + Status + "')";
        objCon.ins_upt_del_Qry(qry);
    }
    public void registerEmp()
    {
        qry = "INSERT INTO EmployeeDB(EDB_Id,EDB_Name,EDB_Address,EDB_DOB,EDB_Age,EDB_Gender,EDB_Email,EDB_Qualification,EDB_Username,EDB_Password,EDB_Phone,EDB_Status) VALUES ('" + Id + "','" + Name + "','" + Address + "','" + Dob + "','" + Age +  "','" + Gender + "','" + EmailId + "','" + Qualification + "','" + Username + "','" + Password + "','" + Phone + "','" + Status + "')";
        objCon.ins_upt_del_Qry(qry);
    }
    public DataTable selEmpDB()
    {
        qry = "SELECT * FROM EmployeeDB WHERE EDB_Username='" + Username + "' AND EDB_Password='" + Password + "' AND EDB_Status='Approved' ";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
    public DataTable selUserDB()
    {
        qry = "SELECT * FROM  UserDB WHERE UDB_Username='" + Username + "' and UDB_Password='" + Password + "' AND UDB_Status='Active'";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
    public DataTable verifyEmpReg()
    {
        qry = "SELECT EDB_Username FROM EmployeeDB WHERE EDB_Username='" + Username + "'";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
    public DataTable verifyUserReg()
    {
        qry = "SELECT UDB_Username FROM  UserDB WHERE UDB_Username='" + Username + "' ";
        dt = objCon.sel_Qry(qry);
        return dt;
    }
  
    public DataTable displayUsers()
    {
        qry = "SELECT * FROM  UserDB";
        dt = objCon.sel_Qry(qry);
        return dt;
    }

    public int getEmpCount()
    {
        qry = "SELECT COUNT(*) FROM EmployeeDB";
        id = objCon.countQry(qry);
        return id;
    }

    public int getUsrCount()
    {
        qry = "SELECT COUNT(*) FROM UserDB";
        id = objCon.countQry(qry);
        return id;
    }

    public DataTable showUserData(String Qry)
    {
        dt = objCon.sel_Qry(Qry);
        return dt;
    }

    public DataTable showEmpData(String Qry)
    {
        dt = objCon.sel_Qry(Qry);
        return dt;
    }
}
