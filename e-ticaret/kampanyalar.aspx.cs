using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class kampanyalar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        //ImageButton9.Visible = true;
        //FormView1.Visible = false;
        //GridView1.Visible = true;

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        ImageButton9.Visible = true;
    }
    protected void ImageButton9_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("kampanyalar.aspx");
    }
}
