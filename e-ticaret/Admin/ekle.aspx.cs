using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ekle : System.Web.UI.Page
{
    veritabani vt = new veritabani();
    OleDbCommand komut;
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            OleDbConnection baglanti = vt.baglan();
            baglanti.Open();
            komut =  new OleDbCommand("insert into icerikler(kategori_id,model,ekarti,skarti,islemci) Values(?,?,?,?,?)",baglanti);
            komut.Parameters.AddWithValue("?", DropDownList1.SelectedIndex);
            komut.Parameters.AddWithValue("?", TextBox1.Text);
            komut.Parameters.AddWithValue("?", TextBox2.Text);
            komut.Parameters.AddWithValue("?", TextBox3.Text);
            komut.Parameters.AddWithValue("?", TextBox4.Text);
            komut.ExecuteNonQuery();
            komut.Dispose();
            baglanti.Close();
            baglanti.Dispose();
            Label13.Text = "İçerik Yazınız Başarıyla Kaydedildi !!!";
        }
        catch(Exception ex)
        {
            Label13.Text = "Kaydedilirken hata oluştu" + " " + ex.Message;
        }
    } 
    protected void Page_Load(object sender, EventArgs e){    }
}