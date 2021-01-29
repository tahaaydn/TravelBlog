using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;//contain classes for accessing and managing data from diverse sources 
using System.Configuration;//contains the types that provide the programming model for handling configuration data
using System.Data.SqlClient; //Data Provider for SQL Server

/// <summary>
/// Summary description for User
/// </summary>
namespace myUser
{
    public class MyUserClass
    {
        public static int UserId;
        public string UserName;
        public string UserEmail;
        private readonly int UserPerm;
        private string UserPassword;

        public MyUserClass(string username, string password, string email)
        {
            UserId = UserId + 1;
            UserName = username;
            UserPassword = password;
            UserEmail = email;
            UserPerm = 0;
        }

        public MyUserClass(string username, string password)
        {
            UserName = username;
            UserPassword = password;
        }

        public string User_Name { get { return UserName; } set { UserName = value; } }
        public string User_Email { get { return UserEmail; } set { UserEmail = value; } }
        public string User_Password { get { return UserPassword; } set { UserPassword = value; } }
        public int User_Perm { get { return UserPerm; } }
        public static int User_Id { get { return UserId; } set { UserId = value; } }

    }
}