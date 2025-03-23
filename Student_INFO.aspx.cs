using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessObject;
using System.Data;

namespace TestMS
{
    public partial class Student_INFO : System.Web.UI.Page
    {
        UserBusinessLogic UBL = new UserBusinessLogic();
        UserBusinessObject UBO = new UserBusinessObject();
        string StudentPhoto;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dislay();
            }
        }

        protected void Dislay()
        {
            DataTable dtState = UBL.LoadDegree(); 
            ddlStuDegree.DataSource = dtState;
            ddlStuDegree.DataTextField = "DEGREENAME";

            ddlStuDegree.DataBind();
            ddlStuDegree.Items.Insert(0, "Select");
            displayGrid();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtStuName.Text = "";
            txtStuMoble.Text = "";
            txtStuEmail.Text = "";
            txtStuDOB.Text = "";
            ddlStuDegree.SelectedIndex = 0;
            ddlStuBranch.SelectedIndex = 0;
            rbStuGender = null;
            chkStatus = null;
            fuStuPhoto = null;
        }

        protected void btnStuSubmit_Click(object sender, EventArgs e)
        {
            UBO.StudentName = txtStuName.Text;
            UBO.StudentDOB = txtStuDOB.Text;
            UBO.StudentGender = rbStuGender.SelectedValue;
            UBO.StudentDegree = ddlStuDegree.SelectedValue;
            UBO.StudentBranch = ddlStuBranch.SelectedValue;
            UBO.StudentEmail = txtStuEmail.Text;
            UBO.StudentMobile = txtStuMoble.Text;
            UBO.StudentPhoto = valPhoto();
            UBO.StudentStatus = chkStatus.SelectedValue;

            UBL.submitStudent(UBO);
            Response.Write("<script>alert('Student Added')</script>");
            displayGrid();
        }

        protected void displayGrid()
        {
            grdStudentsData.DataSource = UBL.showStudent();
            grdStudentsData.DataBind();
        }

        protected string valPhoto()
        {
            string allowedExtensions = ".jpg,.jpeg,.jfif,.png,.gif";
            string fileExtension = System.IO.Path.GetExtension(fuStuPhoto.FileName).ToLower();
            if (allowedExtensions.Contains(fileExtension))
            {
                int maxFileSizeKB = 200;
                if (fuStuPhoto.PostedFile.ContentLength <= maxFileSizeKB * 1024)
                {
                    fuStuPhoto.SaveAs(Server.MapPath("~/Images/") + fuStuPhoto.FileName);
                    StudentPhoto = "~/Images/" + fuStuPhoto.FileName;
                }
                else
                {
                    Response.Write("<script>alert('Please upload an image under 200 KB')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Enter only JPG')</script>");
            }
            return StudentPhoto;
        }

        protected void btnStuReport_Click(object sender, EventArgs e)
        {

        }

        protected void btnStuDelete_Click(object sender, EventArgs e)
        {
            int i = 0;
            GridViewRow gr1 = ((Button)sender).NamingContainer as GridViewRow;
            TextBox txtGrdName = gr1.FindControl("txtGrdName") as TextBox;

            UBO.StudentName = txtGrdName.Text;
            i = UBL.removeStudent(UBO);
            displayGrid();
            Response.Write("<script>alert('Student Deletd')</script>");
        }

        protected void btnStuEdit_Click(object sender, EventArgs e)
        {
            int i = 0;
            GridViewRow gr1 = ((Button)sender).NamingContainer as GridViewRow;
            TextBox txtGrdName = gr1.FindControl("txtGrdName") as TextBox;
            TextBox txtGrdDOB = gr1.FindControl("txtGrdDOB") as TextBox;
            TextBox txtGrdGender = gr1.FindControl("txtGrdGender") as TextBox;
            TextBox txtGrdDegree = gr1.FindControl("txtGrdDegree") as TextBox;
            TextBox txtGrdBranch = gr1.FindControl("txtGrdBranch") as TextBox;
            TextBox txtGrdStatus = gr1.FindControl("txtGrdStatus") as TextBox;

            UBO.StudentName = txtGrdName.Text;
            UBO.StudentDOB = txtGrdDOB.Text;
            UBO.StudentGender = txtGrdGender.Text;
            UBO.StudentDegree = txtGrdDegree.Text;
            UBO.StudentBranch = txtGrdBranch.Text;
            UBO.StudentStatus = txtGrdStatus.Text;
            i = UBL.updateUser(UBO);
            displayGrid();
            Response.Write("<script>alert('Student Edited')</script>");
        }

        protected void ddlStuDegree_SelectedIndexChanged(object sender, EventArgs e)
        {
            UBO.StudentDegree = ddlStuDegree.SelectedValue;
            
            //Response.Write(UBO.StudentDegreeID);
            //int idb = UBO.StudentDegreeID;

            DataTable dtState = UBL.LoadBranch(UBL.searchDegreeID(UBO));
            ddlStuBranch.DataSource = dtState;
            ddlStuBranch.DataTextField = "BRANCHNAME";

            ddlStuBranch.DataBind();
            ddlStuBranch.Items.Insert(0, "Select");
        }
    }
}