using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_hakkı : System.Web.UI.Page
{
    veritabani vt = new veritabani();
    OleDbCommand komut;
    OleDbDataReader dr;
    int id = 4;

    private void hakkımızda()
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


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            hakkımızda();
        } 

    }

    private void hakkı_guncel()
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
            Label5.Text = "Hakkınızda bilginiz başarıyla güncellenmiştir !!!";
        }
        catch(Exception ex)
        {
            Label5.Text = ex.Message.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        hakkı_guncel();
    }
}