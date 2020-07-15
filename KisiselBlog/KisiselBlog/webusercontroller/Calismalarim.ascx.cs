using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webusercontroller_Calismalarim : System.Web.UI.UserControl
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        CalismalarYukle();

        Page.Title = "Çalışmalarım";
        Page.MetaDescription = "Çalışmalarım || Kişisel Web Sitesi";
    }

    private void CalismalarYukle()
    {

        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Calismalar");




        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        rptCalisma.DataSource = DataOkuyucu;
        rptCalisma.DataBind();

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
}