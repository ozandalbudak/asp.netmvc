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

public partial class bizeyazin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        // Veri Tabanı baglantısı
        OleDbConnection bizeyaz = new OleDbConnection
            ("Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~\\App_Data\\Veriler.mdb"));
        bizeyaz.Open();
        //veri tablosunda islem yapma
        OleDbCommand sorgu = new OleDbCommand
            ("insert into bizeyazin (adsoy,email,konu,mesaj)values (?,?,?,?)", bizeyaz);
        //paramatre atama
        sorgu.Parameters.Add("@adsoy", adsoy.Text);
        sorgu.Parameters.Add("@email", email.Text);
        sorgu.Parameters.Add("@konu", DropDownList1.Text);
        sorgu.Parameters.Add("@mesaj", mesaj.Text);
     
        //excute ıslemı
        sorgu.ExecuteNonQuery();
        bizeyaz.Close();
        Response.Redirect("bizeyazin.aspx");
    }

    protected void mesaj_TextChanged(object sender, EventArgs e)
    {

    }
}
