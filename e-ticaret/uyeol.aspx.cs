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
using System.Data.OleDb;

public partial class Sol_Menü_uyeol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

        // Veri Tabanı baglantısı
        OleDbConnection baglanti = new OleDbConnection
            ("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~\\App_Data\\Veriler.mdb"));
        baglanti.Open();
        //veri tablosunda islem yapma
        OleDbCommand sorgu = new OleDbCommand
            ("insert into uyeler (adsoy,cinsiyet,sehir,tel,adres,email,tc,turu,sifre,dtarihi) values(?,?,?,?,?,?,?,?,?,?)", baglanti);
        //paramatre atama
        sorgu.Parameters.Add("@adsoy", adsoy.Text);
        sorgu.Parameters.Add("@cinsiyet", cinsiyet.SelectedValue);
        sorgu.Parameters.Add("@sehir", sehir.SelectedValue);
        sorgu.Parameters.Add("@tel", tel.Text);
        sorgu.Parameters.Add("@adres", adres.Text);
        sorgu.Parameters.Add("@email", email.Text);
        sorgu.Parameters.Add("@tc", tc.Text);
        sorgu.Parameters.Add("@turu", turu.SelectedValue);
        sorgu.Parameters.Add("@sifre", sifre.Text);
        sorgu.Parameters.Add("@dtarihi", dtarihi.Text);
        //excute ıslemı
        sorgu.ExecuteNonQuery();
        baglanti.Close();
        Response.Redirect("Default.aspx");
        
        //Panel1.Visible = false;
        //ImageButton1.Visible = true;
        //GridView1.Visible = true;

        //Response.Redirect("uyeler.aspx");
    }
}
