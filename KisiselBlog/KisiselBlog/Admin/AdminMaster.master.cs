using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Kontrol"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {

        }
    }
 
    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Session.Remove("Kontrol");
        Response.Redirect("Default.aspx");

    }
}
