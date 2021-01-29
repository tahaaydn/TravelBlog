using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void MyListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            e.Item.Visible = false;
        }
    }
}