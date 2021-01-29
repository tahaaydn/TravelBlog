using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;//contain classes for accessing and managing data from diverse sources 
using System.Configuration;//contains the types that provide the programming model for handling configuration data
using System.Data.SqlClient; //Data Provider for SQL Server
using System.IO;

public partial class Gallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Unnamed2_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        string path = Server.MapPath("images/gallery/");

        if(FileUpload1.HasFile)
        {
            string ext = Path.GetExtension(FileUpload1.FileName);
            if (ext == ".jpg" || ext == ".png")
            {
                FileUpload1.SaveAs(path + FileUpload1.FileName);
                string name = "images/gallery/" + FileUpload1.FileName;
                string query = "insert into [Gallery] (gallery_image) values" +
                               "('" + name + "')";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();

                label1.Text = "Publishing done successfully...";
                label1.ForeColor = System.Drawing.Color.Green;                            
            }
            else
            {
            label1.Text = "You have to upload JPG or PNG File!";
            }
        }
        else
        {
            label1.Text = "Please select a file!";
        }
    }
}