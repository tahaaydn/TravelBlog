<%@ Page Language="C#" AutoEventWireup="true" CodeFile="publishPost.aspx.cs" Inherits="publishPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Post</title>
    <link href="MainStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <section class="form" style="color: rgba(0, 0, 0, 0.5);">
                <ul class="registerInput">
                    <li><a>Post Title: </a>
                        <input id="title1" name="title" type="text" runat="server" /></li>
                    <asp:RequiredFieldValidator runat="server"
                        ControlToValidate="title1"
                        ErrorMessage="Title is required.">
                    </asp:RequiredFieldValidator>
                    <li><a>Post paragraph:  </a>
                        <br />
                        <asp:TextBox id="textbox1" runat="server" TextMode="multiline" rows="15" columns="50" /></li>
                    <li>Select Image: &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" /><br /></li>
                </ul>
                <asp:Button Text="Publish" runat="server" OnClick="Unnamed3_Click" />
                <asp:Label id="label1" Text="" runat="server" />
                <a class="back-to-top" href="/HomePage.aspx">Back to Home</a>
            </section>
        </div>
    </form>
</body>
</html>
