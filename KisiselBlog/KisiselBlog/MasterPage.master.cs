using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

       
       

       
    

        bilgiler();
        siteayarlaryukle();
      
        ltTarih.Text =  DateTime.Now.ToString("yyyy");


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            Image1.ImageUrl = "/resimler/" + DataOkuyucu["Resim"].ToString().Trim();
           

            

        }


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();

    }

    private void siteayarlaryukle()
    {

        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_SiteAyar", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteAyarYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            ltArkaplan.Text = "/resimler/" + DataOkuyucu["Arkaplan"].ToString().Trim();
           ltgoogle.Text = DataOkuyucu["GoogleKod"].ToString().Trim();


            Page.MetaDescription = DataOkuyucu["A_Description"].ToString().Trim();
            Page.MetaKeywords = DataOkuyucu["Keywords"].ToString().Trim();

           
          
        }


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }

    private void bilgiler()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();


        rptFooter.DataSource = DataOkuyucu;
        rptFooter.DataBind();


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
}