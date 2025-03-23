using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace DataAccess
{
    public class UserDataAccess
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["testDB"]);
        SqlCommand com;
        SqlDataReader dr;
        SqlDataAdapter sda;

        public bool validateUser(UserBusinessObject objBO)
        {
            com = new SqlCommand("GetUserByCredentials", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("USERNAME", objBO.LoginUsername);
            com.Parameters.AddWithValue("PASSWORD", objBO.LoginPassword);
            con.Open();
            dr = com.ExecuteReader();
            return dr.Read();
        }        public DataTable DropDegree()
        {
            com = new SqlCommand("GetDegree", con);
            com.CommandType = CommandType.StoredProcedure;
            con.Open();
            com.CommandType = CommandType.Text;
            dr = com.ExecuteReader();
            DataTable dt = null;
            dt = new DataTable("DEGREE");
            dt.Load(dr);
            return dt;
        }
        public int  findDegreeID(UserBusinessObject objBO)
        {
            int id = 0;
            com = new SqlCommand("GetDegreeID", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("DEGREENAME", objBO.StudentDegree);
            con.Open();
            dr = com.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr["DEGREEID"].ToString());
            }
            return id;
        }
        public DataTable DropBranch(int did)
        {
            com = new SqlCommand("SELECT BRANCHNAME FROM BRANCH WHERE DEGREEID=@DEGREEID;", con);
            //com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("DEGREEID", did);
            con.Open();
            com.CommandType = CommandType.Text;
            dr = com.ExecuteReader();
            DataTable dt = null;
            dt = new DataTable("BRANCH");
            dt.Load(dr);
            return dt;
        }        public int addStudent(UserBusinessObject objBO)
        {
            int result = 0;
            com = new SqlCommand("InsertStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("STU_NAME", objBO.StudentName);
            com.Parameters.AddWithValue("STU_DOB", objBO.StudentDOB);
            com.Parameters.AddWithValue("STU_GENDER", objBO.StudentGender);
            com.Parameters.AddWithValue("STU_DEGREE", objBO.StudentDegree);
            com.Parameters.AddWithValue("STU_BRANCH", objBO.StudentBranch);
            com.Parameters.AddWithValue("STU_EMAIL", objBO.StudentEmail);
            com.Parameters.AddWithValue("STU_MOBILE", objBO.StudentMobile);
            com.Parameters.AddWithValue("STU_PHOTO", objBO.StudentPhoto);
            com.Parameters.AddWithValue("STU_STATUS", objBO.StudentStatus);
            con.Open();
            result = com.ExecuteNonQuery();
            return result;
        }        public object bindStudent()
        {
            con.Open();
            DataSet ds = new DataSet();
            com = new SqlCommand("Gettudent", con);
            com.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(com);
            sda.Fill(ds);
            return ds;
        }

        public int DeleteStudent(UserBusinessObject objBO)
        {
            int result = 0;
            com = new SqlCommand("DeleteStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("STU_NAME",objBO.StudentName);
            con.Open();
            result = com.ExecuteNonQuery();
            return result;
        }

        public int EditStudent(UserBusinessObject objBO)
        {
            int result = 0;
            com = new SqlCommand("EditStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("STU_NAME", objBO.StudentName);
            com.Parameters.AddWithValue("STU_DOB", objBO.StudentDOB);
            com.Parameters.AddWithValue("STU_GENDER", objBO.StudentGender);
            com.Parameters.AddWithValue("STU_DEGREE", objBO.StudentDegree);
            com.Parameters.AddWithValue("STU_BRANCH", objBO.StudentBranch);
            com.Parameters.AddWithValue("STU_STATUS", objBO.StudentStatus);
            con.Open();
            result = com.ExecuteNonQuery();
            return result;
        }


    }
}
