using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class webusercontroller_Menuler : System.Web.UI.UserControl
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        //string url = Request.Url.AbsoluteUri;
        //if (url.IndexOf("Sayfalar.aspx") >= 0)
        //{

        //    HtmlGenericControl li = (HtmlGenericControl)(Page.Master.FindControl("Hakkinda.aspx"));

        //    li.Attributes.Add("CssClass", "background-color: #f6bb42;");

        //}



        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "MenuGetir");

        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        rptMenuler.DataSource = DataOkuyucu;
        rptMenuler.DataBind();


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
  
}