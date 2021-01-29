<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link href="MainStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="form" style="color: rgba(0, 0, 0, 0.5);">
                <ul class="registerInput">
                    <li><a>Username: </a>
                        <input id="username1" name="username" type="text" runat="server" /></li>
                    <asp:RegularExpressionValidator runat="server" Display="dynamic"
                        ControlToValidate="username1"
                        ErrorMessage="ID must be 6-10 letters."
                        ValidationExpression="[a-zA-Z]{6,10}" />
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="username1"
                        ErrorMessage="Username is required.">
                    </asp:RequiredFieldValidator>
                    <li><a>Password:  </a>
                        <input id="password1" name="password" type="password" runat="server" /></li>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="password1"
                        ErrorMessage="Password is required.">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" Display="dynamic"
                        ControlToValidate="password1"
                        ErrorMessage="Password must be 4-12 nonblank characters."
                        ValidationExpression="[^\s]{4,12}" />
                    <li><a>Confirm Password:  </a>
                        <input id="password2" name="confirmpassword" type="password" runat="server" /></li>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="password2"
                        ErrorMessage="Confirming password is required.">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" Display="dynamic"
                        ControlToValidate="password2"
                        ErrorMessage="Password must be 4-12 nonblank characters."
                        ValidationExpression="[^\s]{4,12}" />
                    <li><a>Email: </a>
                        <input id="email1" name="email" type="text" runat="server" /></li>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="email1"
                        ErrorMessage="Email is required.">
                    </asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server"
                        ControlToValidate="password1"
                        ControlToCompare="password2"
                        ErrorMessage="Passwords do not match." />
                </ul>
                <asp:Button ID="RegisterSubmit" class="registerButton" Text="Register" runat="server" OnClick="RegisterSubmit_Click" />
                <asp:TextBox ID="lblMessage" runat="server"></asp:TextBox>
                <a class="back-to-top" href="/HomePage.aspx">Back to Home</a>







            </section>
        </div>
    </form>
</body>
</html>
