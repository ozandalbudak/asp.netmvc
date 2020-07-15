using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webusercontroller_Kategoriler : System.Web.UI.UserControl
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "KategorilerGetir");

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