using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_iletisim : System.Web.UI.Page
{
    veritabani vt = new veritabani();
    OleDbCommand komut = null;
    OleDbDataReader dr = null;
    int id = 3;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ilet();
        }
    }
    private void ilet()
    {
        OleDbConnection baglanti = vt.baglan();
        komut = new OleDbCommand("Select * From iletisim Where id=" + id, baglanti);
        baglanti.Open();
        dr = komut.ExecuteReader();
        if (dr.Read() == true)
        {
            CKEditorControl1.Text = dr["icerik"].ToString();
        }
        komut.Dispose();
        baglanti.Close();
        baglanti.Dispose();
    }
    private void ilet_guncel()
    {
        try
        {
            OleDbConnection baglanti = vt.baglan();
            komut = new OleDbCommand("Update iletisim Set icerik=? Where id=" + id, baglanti);
            komut.Parameters.AddWithValue("?", CKEditorControl1.Text);
            baglanti.Open();
            komut.ExecuteNonQuery();
            komut.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            Label5.Text = "İletişim bilgileriniz başarıyla güncellenmiştir !!!";
        }
        catch (Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ilet_guncel();
    }
}