using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webusercontroller_Hakkimda : System.Web.UI.UserControl
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "Hakkımda";
        Page.MetaDescription = "Hakkımda || Kişisel Web Sitesi";

        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        rptAnaSayfa.DataSource = DataOkuyucu;
        rptAnaSayfa.DataBind();


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


    }
}