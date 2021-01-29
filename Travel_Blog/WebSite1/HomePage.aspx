<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel Blog by Taha</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="MainStyles.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="back">

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
            

            <div class="row">
                <div class="leftcolumn">

                    <div>
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                            <EmptyDataTemplate>
                                <span>No data was returned.</span>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="card">
                                    <span style="">
                                        <asp:Label CssClass="postheader" ID="post_titleLabel" runat="server" Text='<%# Eval("post_title") %>' />
                                        <br />

                                        <div class="postimg">
                                            <asp:Image CssClass="postimage" ID="post_image" runat="server" ImageUrl='<%# Eval("post_image") %>' />
                                        </div>

                                        <asp:Label CssClass="postparagraph" ID="post_paragraphLabel" runat="server" Text='<%# Eval("post_paragraph") %>' />
                                        <br />

                                        <asp:Label CssClass="postdate" ID="post_dateLabel" runat="server" Text='<%# Eval("post_date", "{0:d}") %>' />
                                        <br />
                                        <br />                                        
                                    </span>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div id="itemPlaceholderContainer" runat="server" style="">
                                    <span runat="server" id="itemPlaceholder" />
                                </div>
                                <div style="">
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:1600002341ConnectionString %>" SelectCommand="SELECT [post_title], [post_image], [post_paragraph], [post_date] FROM [Post] ORDER BY [post_date] DESC"></asp:SqlDataSource>
                    </div>

                </div>
                <div class="rightcolumn">
                    <div class="card">
                        <h2>About Me</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                            Velit ut tortor pretium viverra suspendisse potenti nullam ac tortor. In aliquam sem fringilla ut morbi.
                        </p>
                    </div>

                    <div class="card">
                        <div class="social">
                            <h3>My Social Accounts</h3>
                            <a href="#" target="_blank">
                                <img src="/images/icons/twitter.png" alt="Twitter" /></a>
                            <a href="#" target="_blank">
                                <img src="/images/icons/instagram.png" alt="Instagram" /></a>
                            <a href="#" target="_blank">
                                <img src="/images/icons/youtube.png" alt="YouTube" /></a>
                            <a href="#" target="_blank">
                                <img src="/images/icons/reddit.png" alt="Reddit" /></a>
                            <a href="#" target="_blank">
                                <img src="/images/icons/linkedin.png" alt="LinkenIn" /></a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="/publishPost.aspx" class="addpost" target="_blank">Add Post</a>
            <a href="#" class="back-to-top">Back to Top</a>

            <div class="footer">
                <p><strong>Made by Taha Bilal Aydın. IKU STUID: 1600002341</strong></p>
            </div>

        </div>
    </form>
</body>
</html>
