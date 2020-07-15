using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class Ana_Sayfa : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToString(Session["turu"]) != "Admin" )
        {
            hata.Text = "Sn. " + Convert.ToString(Session["adsoy"]) + " Hoş Geldiniz !!! ";
            ImageButton7.Visible = true;
        }
        else
        {
            hata.Text = null;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        OleDbConnection baglanti = new OleDbConnection
        ("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~//App_Data\\Veriler.mdb"));
        baglanti.Open();

        OleDbCommand sorgu = new OleDbCommand
       ("select * from uyeler where email='" + email.Text + "'and sifre='" + sifre.Text + "'", baglanti);


        OleDbDataReader dr = sorgu.ExecuteReader();
        if (dr.Read())
        {

            Session["turu"] = dr["turu"].ToString();
            Session["id"] = dr["id"].ToString();
            Session["adsoy"] = dr["adsoy"].ToString();
            hata.Text = "Sn. " + Session["adsoy"].ToString() + " <br>Hoş Geldiniz !!!<br> Üyeliğiniz= " + Session["turu"].ToString();
           
            ImageButton7.Visible = true;
            email.Text = null;
            sifre.Text = null;
        }
        else
        {
            hata.Text = "Kullanıcı Adı veya Şifre Hatalı";
        }
    }
    
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("sifretalep.aspx");
    }

    protected void AccessDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
