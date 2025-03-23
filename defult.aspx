<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="defult.aspx.cs" Inherits="TestMS.defult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TestMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script lang="JavaScript" type="text/javascript">
        function checkUNisEmpty() {
            var id;
            var temp = document.getElementById("<%=txtUserNameLP.ClientID%>");
            id = temp.value;
            if (id == "") {
                alert("Please enter Username");
                return false;
            } else {
                return true;
            }
        }

        function checkUPisEmpty() {
            var id;
            var temp = document.getElementById("<%=txtPassLP.ClientID%>");
            id = temp.value;
            if (id == "") {
                alert("Please enter Password");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="card col-md-6 mx-auto p-4">
                <div class="form-group row">
                    <label for="txtUserNameLP" class="col-sm-3 col-form-label">Enter Username</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtUserNameLP" runat="server" class="form-control" onchange="checkUNisEmpty()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfValUsername" runat="server" ControlToValidate="txtUserNameLP" ErrorMessage="Enter Email" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtPassLP" class="col-sm-3 col-form-label">Enter Password</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtPassLP" runat="server" TextMode="Password" class="form-control" onchange="checkUPisEmpty()"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfValPass" runat="server" ControlToValidate="txtPassLP" ErrorMessage="Enter Password" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnLoginLP" runat="server" Text="Login" OnClick="btnLoginLP_Click" class="btn btn-primary" />
                    <br />
                    <br />
                    <asp:ValidationSummary ID="valSummary" runat="server" class="text-danger" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
