using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_YoneticiAyar : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FormDoldur();
        }




    }

    private void FormDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            txtAdSoyad.Text = DataOkuyucu["AdSoyad"].ToString().Trim();
            txtUnvan.Text = DataOkuyucu["Unvan"].ToString().Trim();
            txtGecmis.Text = DataOkuyucu["Gecmis"].ToString().Trim();
            txtEposta.Text = DataOkuyucu["Eposta"].ToString().Trim();
            txtFacebook.Text = DataOkuyucu["Facebook"].ToString().Trim();
            txtMemleket.Text = DataOkuyucu["Memleket"].ToString().Trim();
            txtSehir.Text = DataOkuyucu["Sehir"].ToString().Trim();
            txtTarih.Text = DataOkuyucu["DTarih"].ToString().Trim();
            txtTelefon.Text = DataOkuyucu["Telefon"].ToString().Trim();
            txtTwitter.Text = DataOkuyucu["Twitter"].ToString().Trim();
            txtWeb.Text = DataOkuyucu["Web"].ToString().Trim();
            txtAdmin.Text = DataOkuyucu["Kadi"].ToString().Trim();
            txtSifre.Text = DataOkuyucu["Sifre"].ToString().Trim();
            Image1.ImageUrl = "/resimler/" + DataOkuyucu["Resim"].ToString().Trim();
            ltid.Text = DataOkuyucu["K_id"].ToString().Trim();
        }


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        Image1.Visible = true;
        string resimyolu = Image1.ImageUrl.Replace("/resimler/", "");
        if (FileUpload1.HasFile)
        {   //Resim dosya kontrolü için burayı aktif yapabilirsiniz
            //string uzanti = FileUpload1.FileName.Split('.')[(FileUpload1.FileName.Split('.').Length - 1)];
            //if (uzanti == "jpg" || uzanti == "png" || uzanti == "bmp" || uzanti == "gif")
            //{
            Random rnd = new Random();
            string sonresimadi = rnd.Next(10000, 100000).ToString();

            string file = System.IO.Path.GetFileName(FileUpload1.FileName);
            string uzan = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

            if (uzan == ".jpg" | uzan == ".gif" | uzan == ".png" | uzan == ".jpeg")
            {

                FileUpload1.SaveAs(Server.MapPath("../resimler/" + sonresimadi + FileUpload1.FileName));

                resimyolu = sonresimadi + FileUpload1.FileName;




              



            }
            else
            {
                lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Uzantısı Desteklenmeyen Formatta</div>";
         
            }
            //}
        }
        else
        {
            lblMesaj.Text = "<div class='hata'><div class='fa-exclamation fa'></div>&nbsp; Resim Seçiniz</div>";
        }



          SqlConnection baglan = veriyol.baglanti();
                SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
                SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;


                SqlKomutu.Parameters.AddWithValue("@Resim", resimyolu);
                SqlKomutu.Parameters.AddWithValue("@AdSoyad", txtAdSoyad.Text);
                SqlKomutu.Parameters.AddWithValue("@Unvan", txtUnvan.Text);
                SqlKomutu.Parameters.AddWithValue("@Gecmis", txtGecmis.Text);
                SqlKomutu.Parameters.AddWithValue("@Dtarih", txtTarih.Text);
                SqlKomutu.Parameters.AddWithValue("@Eposta", txtEposta.Text);
                SqlKomutu.Parameters.AddWithValue("@Telefon", txtTelefon.Text);
                SqlKomutu.Parameters.AddWithValue("@Memleket", txtMemleket.Text);
                SqlKomutu.Parameters.AddWithValue("@Sehir", txtSehir.Text);
                SqlKomutu.Parameters.AddWithValue("@Facebook", txtFacebook.Text);
                SqlKomutu.Parameters.AddWithValue("@Twitter", txtTwitter.Text);
                SqlKomutu.Parameters.AddWithValue("@Web", txtWeb.Text);
                SqlKomutu.Parameters.AddWithValue("@Kadi", txtAdmin.Text);
                SqlKomutu.Parameters.AddWithValue("@Sifre", txtSifre.Text);


                if (ltid.Text == "")
                {
                    SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteKaydet");
                }
                else
                {
                    SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteGuncelle");
                    SqlKomutu.Parameters.AddWithValue("@K_id", Convert.ToInt32(ltid.Text));
                }

                SqlKomutu.ExecuteNonQuery();

                SqlKomutu.Dispose();
                baglan.Close();
                baglan.Dispose();
               // Response.Redirect("YoneticiAyar.aspx");

                lblMesaj.Text = " <div class='tamam'><div class='fa-check fa'></div>&nbsp;&nbsp; Bilgiler Güncellenmiştir.</div>";
  
    }
}