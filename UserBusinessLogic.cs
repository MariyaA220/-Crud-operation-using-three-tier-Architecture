using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessObject;
using DataAccess;
using System.Data;

namespace BusinessLogic
{
    public class UserBusinessLogic
    {
        public bool UserLogin(UserBusinessObject objBO1)
        {
            UserDataAccess da = new UserDataAccess();
            return da.validateUser(objBO1);
        }

        public DataTable LoadDegree()
        {
            UserDataAccess da = new UserDataAccess();
            return da.DropDegree();
        }

        public int searchDegreeID(UserBusinessObject objBO1)
        {
            UserDataAccess da = new UserDataAccess();
            return da.findDegreeID(objBO1);
        }

        public DataTable LoadBranch(int degreeid)
        {
            UserDataAccess da = new UserDataAccess();
            return da.DropBranch(degreeid);
        }

        public int submitStudent(UserBusinessObject objBO1)
        {
            UserDataAccess da = new UserDataAccess();
            return da.addStudent(objBO1);
        }

        public object showStudent()
        {
            UserDataAccess da = new UserDataAccess();
            return da.bindStudent();
        }

        public int removeStudent(UserBusinessObject objBO1)
        {
            UserDataAccess da = new UserDataAccess();
            return da.DeleteStudent(objBO1);
        }

        public int updateUser(UserBusinessObject objBO1)
        {
            UserDataAccess da = new UserDataAccess();
            return da.EditStudent(objBO1);
        }
    }
}
