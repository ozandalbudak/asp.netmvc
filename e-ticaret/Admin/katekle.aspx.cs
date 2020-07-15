using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_katekle : System.Web.UI.Page
{
    veritabani vt = new veritabani();
    OleDbCommand komut;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void kate_ekle()
    {
        try
        {
            OleDbConnection baglanti = vt.baglan();
            komut = new OleDbCommand("insert into kategori(urun_adi) Values(?)", baglanti);
            komut.Parameters.AddWithValue("?", TextBox1.Text);
            baglanti.Open();
            komut.ExecuteNonQuery();
            komut.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            Label5.Text = "Kategori Başarıyla Eklenmiştir...";
        }
        catch(Exception ex)
        {
            Label5.Text = ex.Message;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        kate_ekle();
    }
}