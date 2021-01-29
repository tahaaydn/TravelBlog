using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//contain classes for accessing and managing data from diverse sources 
using System.Configuration;//contains the types that provide the programming model for handling configuration data
using System.Data.SqlClient; //Data Provider for SQL Server


public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginSubmit_Click(object sender, EventArgs e)
    {
        if (username1.Value == "") { Console.WriteLine("Enter an Username!"); }
        else if (password1.Value == "") { Console.WriteLine("Enter a Password!"); }
        else
        {
            int success = LoginUser(username1.Value, password1.Value);
            if (success > 0) {  Response.Write("<script>alert('Login Successful!')</script>");
                                Response.Redirect("HomePage.aspx"); }
        }
    }

    private int LoginUser(string username, string password)
    {
        int success = 0;
        string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        string queryString = "SELECT count(*) FROM [User] WHERE username = @UserName AND userpassword = @UserPassword";
        SqlConnection connection = new SqlConnection(connectionString);
        bool exists;
        connection.Open();
        if (connection.State == ConnectionState.Open)
        {
            using (SqlCommand cmd = new SqlCommand(queryString, connection))
            {
                cmd.Parameters.AddWithValue("userName", username);
                cmd.Parameters.AddWithValue("userPassword", password);
                exists = (int)cmd.ExecuteScalar() > 0;
            }
            if (exists)
            {
                success++;
                // Then redirect!
            }
            else { Response.Write("<script>alert('Wrong Username or Password!')</script>"); } // Better Warning???
        }
        else { Response.Write("<script>alert('Database Error')</script>"); } // Better Warning???

        return success;
    }
}