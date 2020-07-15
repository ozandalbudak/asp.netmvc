using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Kategoriler : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        GridDoldur();
        if (!IsPostBack)
        {
             btnGuncelle.Visible = false;
        }
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;

        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategorilerKaydet");
        SqlKomutu.Parameters.AddWithValue("@K_KategoriAdi", txtKat.Text);
        SqlKomutu.Parameters.AddWithValue("@K_Link", Temizle.UrlCevir(txtKat.Text));
        SqlKomutu.Parameters.AddWithValue("@K_Sira", txtSira.Text);

        
        SqlKomutu.ExecuteNonQuery();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
        Response.Redirect("Kategoriler.aspx");
    }

    private void GridDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategorilerGetir");



        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        grdListe.DataSource = DataOkuyucu;
        grdListe.DataBind();

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }



    protected void grdListe_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            int sid = Convert.ToInt32(e.CommandArgument);

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;

            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategoriSil");

            SqlKomutu.Parameters.AddWithValue("@K_id", sid);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Kategoriler.aspx");



        }

        if (e.CommandName == "Duzelt")
        {
          
            int sid = Convert.ToInt32(e.CommandArgument);

            ltid.Text = sid.ToString();

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategorilerDuzenleGetir");

            SqlKomutu.Parameters.AddWithValue("@K_id", sid);

            SqlDataReader DataOkuyucu;
            DataOkuyucu = SqlKomutu.ExecuteReader();

            while (DataOkuyucu.Read())
            {
                txtKat.Text = DataOkuyucu["K_KategoriAdi"].ToString().Trim();
                txtSira.Text = DataOkuyucu["K_Sira"].ToString().Trim();
                
            }

            DataOkuyucu.Close();
            DataOkuyucu.Dispose();
            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            btnGuncelle.Visible = true;
            btnKaydet.Visible = false;

        }

    }


    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategoriDuzenle");
        SqlKomutu.Parameters.AddWithValue("@K_KategoriAdi", txtKat.Text);
        SqlKomutu.Parameters.AddWithValue("@K_Link", Temizle.UrlCevir(txtKat.Text));
        SqlKomutu.Parameters.AddWithValue("@K_Sira", txtSira.Text);
        SqlKomutu.Parameters.AddWithValue("@K_id", Convert.ToInt32(ltid.Text));
        SqlKomutu.ExecuteNonQuery();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
        Response.Redirect("Kategoriler.aspx");
    }
}