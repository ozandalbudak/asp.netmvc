using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void btnGiris_Click(object sender, EventArgs e)
    {

        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            string kadi = DataOkuyucu["Kadi"].ToString().Trim();
            string sifre = DataOkuyucu["Sifre"].ToString().Trim();

            if (txtKadi.Text == kadi & txtSifre.Text == sifre)
            {

                Session["Kontrol"] = "ok";
                Response.Redirect("Giris.aspx");
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();

     
    }
}