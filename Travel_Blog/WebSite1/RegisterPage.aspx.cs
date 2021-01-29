using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//contain classes for accessing and managing data from diverse sources 
using System.Configuration;//contains the types that provide the programming model for handling configuration data
using System.Data.SqlClient; //Data Provider for SQL Server
using myUser;

public partial class RegisterPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void RegisterSubmit_Click(object sender, EventArgs e)
    {
        string getUsername = username1.Value;
        string getPassword = password1.Value;
        string getConfirmPassword = password2.Value;
        string getEmail = email1.Value;
        
        //Console.WriteLine değiştir
        if (username1.Value == "") { Console.WriteLine("Enter an Username!"); }
        else if (password1.Value == "") { Console.WriteLine("Enter a Password!"); }
        else if (password2.Value == "") { Console.WriteLine("Enter a Confirm Password!"); }
        else if (email1.Value == "") { Console.WriteLine("Enter an Email!"); }
        else if (password1.Value != password2.Value) { Console.WriteLine("Passwords must match!"); }
        else if (!IsValidEmail(getEmail)) { Console.WriteLine("Email is not valid!"); }
        else
        {
            MyUserClass myUserObject = new MyUserClass(getUsername, getPassword, getEmail);

            int success = InsertUser(myUserObject);
            if (success > 0) { lblMessage.Text = "Register successfull.";
                               Response.Redirect("HomePage.aspx"); }
            else lblMessage.Text = "Register failed.Please try again!";
        }
    }

    private int InsertUser(MyUserClass tempuser)
    {
        int success = 0;
        string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        bool exists = false;

        // create a command to check if the username exists
        using (SqlCommand cmd = new SqlCommand("select count(*) from [User] where username = @username", connection))
        {
                cmd.Parameters.AddWithValue("username", tempuser.User_Name);
                exists = (int)cmd.ExecuteScalar() > 0;
        }

        if (connection.State == ConnectionState.Open && !exists)
        {
            SqlCommand command = new SqlCommand("INSERT INTO [User] (username, userpassword, usermail, permlevel) " +
                                                "VALUES ('"+ tempuser.UserName +"','"+ tempuser.User_Password +"','"+ tempuser.User_Email +"',0)", connection);
            success = command.ExecuteNonQuery();
            connection.Close();
        }
        else { Response.Write("<script>alert('This username already exists!')</script>"); } // Better Warning???

        return success;
    }

    bool IsValidEmail(string email)
    {
        try {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch {
            return false;
        }
    }
}