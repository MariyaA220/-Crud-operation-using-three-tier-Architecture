<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_INFO.aspx.cs" Inherits="TestMS.Student_INFO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Information</title>
    <!-- Bootstrap CSS link -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        /* Custom CSS */
        body {
            padding: 20px;
        }

        .row {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        /* Add more custom styles as needed */
    </style>
</head>
<body>
    <!-- Bootstrap container class -->
    <div class="container">
        <form id="form1" runat="server">
            <div>
                <h2>STUDENT INFORMATION</h2>
                <div class="row">
                    <label for="txtStuName">Student Name</label>
                    <div>
                        <asp:TextBox ID="txtStuName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Student Name" ControlToValidate="txtStuName" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="txtStuDOB">Date of Birth</label>
                    <div>
                        <asp:TextBox ID="txtStuDOB" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter DOB" ControlToValidate="txtStuDOB" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="rbStuGender">Gender</label>
                    <div>
                        <asp:RadioButtonList ID="rbStuGender" runat="server" AutoPostBack="True" CssClass="form-check">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select Gender" ControlToValidate="rbStuGender" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="ddlStuDegree">Select Degree</label>
                    <div>
                        <asp:DropDownList ID="ddlStuDegree" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlStuDegree_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <label for="ddlStuBranch">Select Branch</label>
                    <div>
                        <asp:DropDownList ID="ddlStuBranch" runat="server" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="row">
                    <label for="txtStuEmail">Enter Email</label>
                    <div>
                        <asp:TextBox ID="txtStuEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="errEmail" runat="server" ControlToValidate="txtStuEmail" ErrorMessage="Please Enter Mail" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="txtStuMoble">Enter Mobile</label>
                    <div>
                        <asp:TextBox ID="txtStuMoble" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="errMobile" runat="server" ControlToValidate="txtStuMoble" ErrorMessage="Please Enter Mobile" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="fuStuPhoto">Upload Photo</label>
                    <div>
                        <asp:FileUpload ID="fuStuPhoto" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="errPhoto" runat="server" ControlToValidate="fuStuPhoto" ErrorMessage="Please Upload Photo" CssClass="text-danger">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row">
                    <label for="chkStatus">Active Status</label>
                    <div>
                        <asp:CheckBoxList ID="chkStatus" runat="server" AutoPostBack="True" CssClass="form-check">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Not Active</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>

                <div class="row">
                    <asp:Button ID="btnStuSubmit" runat="server" Text="Submit" OnClick="btnStuSubmit_Click" CssClass="btn btn-primary" />
                    <asp:Button ID="btnStuReport" runat="server" Text="Report" OnClick="btnStuReport_Click" CausesValidation="false" CssClass="btn btn-secondary" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" CssClass="btn btn-danger" />
                    <br />
                    <br />
                    <asp:ValidationSummary ID="errSummary" runat="server" CssClass="alert alert-danger" />
                </div>

                <div>
                    <asp:GridView ID="grdStudentsData" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr. No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:Button ID="btnStuEdit" runat="server" Text="Edit" OnClick="btnStuEdit_Click" CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="btnStuDelete" runat="server" Text="Delete" OnClick="btnStuDelete_Click" CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="StudentName">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdName" runat="server" Text='<%#Eval("STU_NAME") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdDOB" runat="server" Text='<%#Eval("STU_DOB") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdGender" runat="server" Text='<%#Eval("STU_GENDER") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Degree">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdDegree" runat="server" Text='<%#Eval("STU_DEGREE") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Branch">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdBranch" runat="server" Text='<%#Eval("STU_BRANCH") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="grdImage" runat="server" ImageUrl='<%#Eval("STU_PHOTO") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Active Status">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtGrdStatus" runat="server" Text='<%#Eval("STU_STATUS") %>' CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS scripts (place at the end of the body for better performance) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
