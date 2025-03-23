using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;

namespace TestMS
{
    public partial class defult : System.Web.UI.Page
    {
        UserBusinessLogic UBL = new UserBusinessLogic();
        UserBusinessObject UBO = new UserBusinessObject();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnLoginLP.Attributes.Add("onclick", "javascript:return checkUNisEmpty() && checkUPisEmpty()");
            }
        }

        protected void btnLoginLP_Click(object sender, EventArgs e)
        {
            if(txtUserNameLP.Text != "" && txtPassLP.Text != "")
            {
                UBO.LoginUsername = txtUserNameLP.Text;
                UBO.LoginPassword = txtPassLP.Text;
                if (UBL.UserLogin(UBO) == true)
                {
                    Response.Redirect("Student_INFO.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials')</script>");
                }
            }
        }
    }
}