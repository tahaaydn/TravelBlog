<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MainStyles.css" rel="stylesheet" />
    <script src="galleryslide.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="header">
                <img id="logo" src="images/logo.png" />
            </div>

            <section style="color: rgba(0, 0, 0, 0.5);">
                <nav>
                    <ul>
                        <li><a href="/HomePage.aspx">Home</a></li>
                        <li>|</li>
                        <li><a href="/Gallery.aspx">Gallery</a></li>
                    </ul>
                    <ul class="last">
                        <li><a href="/LoginPage.aspx">Login</a></li>
                        <li>|</li>
                        <li><a href="/RegisterPage.aspx">Register</a></li>
                    </ul>
                </nav>
            </section>

            <section style="color: rgba(0, 0, 0, 0.5);">
                <div class="container">
                    <asp:Repeater runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div class="postimg" align="middle">
                                <asp:Image CssClass="postimage" runat="server" ImageUrl='<%# Eval("gallery_image") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1600002341ConnectionString %>" SelectCommand="SELECT [gallery_image] FROM [Gallery]"></asp:SqlDataSource>
                </div>
                <div class="container">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <br />
                    <br />
                    <asp:Button Text="Add Image" runat="server" OnClick="Unnamed2_Click" />
                    <asp:Label ID="label1" Text="" runat="server" />
                </div>
            </section>
            <a href="#" class="back-to-top">Back to Top</a>
        </div>
    </form>
</body>
</html>
