using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

public partial class Admin_login : System.Web.UI.Page
{
    veritabani vt = new veritabani();
    OleDbCommand komut;
    OleDbDataReader dr;
    
    public void giris_guncelle()
    {
       OleDbConnection baglanti = vt.baglan();
       baglanti.Open();
       komut = new OleDbCommand("Update uyeler set son_giris=@songiris where email= '" + url1.Text + "'", baglanti);
       komut.Parameters.AddWithValue("@songiris", DateTime.Now.ToString());
       komut.ExecuteNonQuery();
       komut.Dispose();
       baglanti.Close();
    }
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        OleDbConnection baglanti = vt.baglan();
        baglanti.Open();
        komut = new OleDbCommand("Select email from uyeler Where email=?",baglanti);
        komut.Parameters.AddWithValue("?", url1.Text);
        dr = komut.ExecuteReader();
        if (dr.Read() == true)
        {
             komut = new OleDbCommand("Select * from uyeler Where email=? And Sifre=? And admin=true", baglanti);
             komut.Parameters.AddWithValue("?", url1.Text);
             komut.Parameters.AddWithValue("?", url.Text);
             dr = komut.ExecuteReader();
             if (dr.Read() == true)
             {
                 Session.Add("kullanici", dr["adsoy"].ToString());
                 Session.Add("e_mail", dr["email"].ToString());
                 giris_guncelle();
                 Response.Redirect("Default.aspx");
                 komut = new OleDbCommand("Update uyeler Set son_giris=?", baglanti);
             }
             else
             {
                 Label1.Text = "Hatalı Şifre Girişi !!!";
             }
        }
        else
        {
            Label1.Text = "Geçersiz Kullanici Adi veya Şifre !!!";
        }
        komut.Dispose();
        dr.Close();
        baglanti.Close();
        baglanti.Dispose();
    }
}