using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class webusercontroller_Iletisim : System.Web.UI.UserControl
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "İletişim";
        Page.MetaDescription = "İletişim || Kişisel Web Sitesi";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GuvenlikKodu();

        if (txtAdSoyad.Text == "")
        {
            ltMesaj.Text = "Adınızı Soyadınızı Yazınız";
            ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtAdSoyad.Focus();
        }
        else if (txtEposta.Text == "")
        {
            ltMesaj.Text = "E-Posta Adresinizi Yazınız";
            ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtAdSoyad.Focus();
        }
        else if (txtMesaj.Text == "")
        {
            ltMesaj.Text = "Mesajınızı Yazınız";
            ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtAdSoyad.Focus();
        }
        else
        {
            MailGonder();
        }


    }

    private void MailGonder()
    {
        GuvenlikKodu();

        if (Session["gkodu"] == null)
        {
             ltMesaj.Text = "Güvenlik Kodunu Yanlış Girdiniz.";
            ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
       
        }

        else
        {

     
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();
        string adsoyad = "";
        string eposta = "";
        string resim = "";
        string web = "";
        while (DataOkuyucu.Read())
        {
            adsoyad = DataOkuyucu["AdSoyad"].ToString().Trim();
            eposta = DataOkuyucu["Eposta"].ToString().Trim();
            resim = DataOkuyucu["Resim"].ToString().Trim();
            web = DataOkuyucu["Web"].ToString().Trim();

        }


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


        string gondereneposta = "bilgi@mavikavun.com";
        string parola = "mailsifresi";
        string MesajKonusu = "Site İletişim";


        StringBuilder mesaj = new StringBuilder();
        mesaj.Append("<html><head><style>body {font-family:verdana;letter-spacing:-1px;font-size:13px;}a {color:#498366;text-decoration:none;}</style></head><body bgcolor='#efefef'><table width='800px' height='400px' cellpadding='0' cellspacing='0' border='0'><tr><td width='600' bgcolor='#ffffff' style='padding:10px;'><table width='780px' cellpadding='0' cellspacing='0' border='0'><tr><td width='160px' bgcolor='#ffffff' style='padding:10px;font-weight:bold;font-size:13px;' valign='top'><a href='" + web + "'><img src='http://" + web + "/resimler/" + resim + "' border='0'></a><br /></td></tr><tr><td width='410px' style='padding:10px;font-size:13px;' valign='top'><p>");
        mesaj.Append("Sayın, <b>" + adsoyad + "</b><br /></p><p>Web Sitesinden gelen mesaj<br /> <br />Gönderen : " + txtAdSoyad.Text + " <br><br>E-Posta: " + txtEposta.Text + "<br><br>Mesajı: " + txtMesaj.Text + " </p> <table cellpadding='0' cellspacing='0' border='0' width='600'><tr height='37px'><td width='32px' bgcolor='#999999' align='center' style='font-size:30px;color:#fff;font-weight:bold;'>!</td> <td style='font-size:13px;padding:5px;color:#999;' valign='top'>" + adsoyad + " E-Posta bilgilendirme hizmetleri.<br />" + eposta + "</td></tr></table></td></tr></table></td><td width='3' bgcolor='#498366'></td></tr></table></body></html>");





        string MesajSabit = mesaj.ToString();

        string toposta = eposta; // gelecek olan mail adresi

        SmtpClient client = new SmtpClient();
        client.Credentials = new System.Net.NetworkCredential(gondereneposta, parola);
        client.Host = "webmail.mavikavun.com";
        client.EnableSsl = false;

        MailAddress from = new MailAddress(gondereneposta);
        MailAddress to = new MailAddress(toposta);
        MailMessage message = new MailMessage(from, to);


        message.Subject = MesajKonusu;
        message.Body = MesajSabit;
        message.IsBodyHtml = true;
        client.Send(message);


        ltMesaj.Text = "Mesajınız iletilmiştir. En Kısa Sürede Size Dönüş Yapılacaktır.";
        ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#32b41d; background-image: url(/images/okey.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
        Session.Remove("gkodu");
        txtAdSoyad.Text = "";
        txtEposta.Text = "";
        txtKarakter.Text = "";
        txtMesaj.Text = "";
        }

    }

    private void GuvenlikKodu()
    {
        if (txtKarakter.Text == Session["GuvenlikKelimesi"].ToString())
        {
            Session["gkodu"] = "dogru";
        }


        else
        {
            ltMesaj.Text = "Güvenlik Kodunu Yanlış Girdiniz.";
            ltMesaj.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
        }
    }

}