<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="MainStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="form" style="color: rgba(0, 0, 0, 0.5);">
                <ul class="registerInput">
                    <li><a>Username: </a>
                        <input id="username1" name="username" type="text" runat="server" /></li>
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
                </ul>
                <asp:Button ID="LoginSubmit" class="registerButton" Text="Login" runat="server" OnClick="LoginSubmit_Click" />
                <a class="back-to-top" href="/HomePage.aspx">Back to Home</a>
            </section>
        </div>
    </form>
</body>
</html>
