using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// Summary description for clsProfiles

public class clsProfiles
{
        DataTable dt = new DataTable();
        string qry = "";
        ClsConnection objCon3 = new ClsConnection(); 
        
        public string Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string EmailId { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }

        public DataTable getUser()
        {
            qry = "SELECT * FROM UserDB WHERE UDB_Id ='" + Id + "'"; 
            dt = objCon3.sel_Qry(qry);
            return dt;
        }

        public DataTable getEmp()
        {
            qry = "SELECT * FROM EmployeeDB WHERE EDB_Id ='" + Id + "'";
            dt = objCon3.sel_Qry(qry);
            return dt;
        }
    
        public void editUser()
        {
            qry = "UPDATE UserDB SET UDB_Name='" + Name + "',UDB_Address='" + Address + "',UDB_Email='" + EmailId + "',UDB_Password='" + Password + "',UDB_Phone='" + Phone + "' WHERE UDB_Id = '" + Id + "'";
            objCon3.ins_upt_del_Qry(qry);
            qry = "UPDATE AppointmentDB SET M_Username='" + Name + "' WHERE M_Id = '" + Id + "'";
            objCon3.ins_upt_del_Qry(qry);
        }

        public void editEmp()
        {
            qry = "UPDATE EmployeeDB SET EDB_Name='" + Name + "',EDB_Address,='" + Address + "',EDB_Email='" + EmailId + "',EDB_Password='" + Password + "',EDB_Phone='" + Phone + "' WHERE EDB_Id = '" + Id + "'";
            objCon3.ins_upt_del_Qry(qry);
        }

}