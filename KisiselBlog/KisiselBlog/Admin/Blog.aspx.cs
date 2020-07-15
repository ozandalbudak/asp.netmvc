using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_Blog : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        GridDoldur();
        
        if (!IsPostBack)
        {
            ddlKategoriDoldur();
            btnGuncelle.Visible = false;
            Image1.Visible = false;
            btnOlustur.Visible = false;
            Panel2.Visible = false;
        
        }

      

    }

    private void ddlKategoriDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "KategorilerGetir");

        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();






        ddlKategori.DataSource = DataOkuyucu;
        ddlKategori.DataTextField = "K_KategoriAdi";
        ddlKategori.DataValueField = "K_id";

        ddlKategori.DataBind();
        ddlKategori.Items.Insert(0, "Kategori Seçiniz");

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }

    private void GridDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogGetir");


        SqlDataAdapter da = new SqlDataAdapter(SqlKomutu);

        DataSet dt = new DataSet();
        da.Fill(dt);

        grdListe.DataSource = dt;
        grdListe.DataBind();

        //SqlDataReader DataOkuyucu;
        //DataOkuyucu = SqlKomutu.ExecuteReader();


        //grdListe.DataSource = DataOkuyucu;
        //grdListe.DataBind();

        //DataOkuyucu.Close();
        //DataOkuyucu.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        string resimyolu = "";
        if (FileUpload1.HasFile)
        {   //Resim dosya kontrolü için burayı aktif yapabilirsiniz
            //string uzanti = FileUpload1.FileName.Split('.')[(FileUpload1.FileName.Split('.').Length - 1)];
            //if (uzanti == "jpg" || uzanti == "png" || uzanti == "bmp" || uzanti == "gif")
            //{
            Random rnd = new Random();
            string sonresimadi = rnd.Next(10000, 100000).ToString();

            string file = System.IO.Path.GetFileName(FileUpload1.FileName);
            string uzan = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

            if (uzan == ".jpg" | uzan == ".gif" | uzan == ".png" | uzan == ".jpeg")
            {

                FileUpload1.SaveAs(Server.MapPath("../resimler/" + sonresimadi + FileUpload1.FileName));

                resimyolu = sonresimadi + FileUpload1.FileName;
                // lblMesaj.Text = "../" + resimyolu;

                if (txtBaslik.Text == "")
                {
                        lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Başık Kısmını Boş Geçmeyiniz.</div>";
         
                }
                else
                {

             

                SqlConnection baglan = veriyol.baglanti();
                SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
                SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
                SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogEkle");

                SqlKomutu.Parameters.AddWithValue("@B_Baslik", txtBaslik.Text);
                SqlKomutu.Parameters.AddWithValue("@B_Icerik", txtIcerik.Text);
                SqlKomutu.Parameters.AddWithValue("@B_Etiket", txtEtiket.Text);
                SqlKomutu.Parameters.AddWithValue("@B_Link", Temizle.UrlCevir(txtBaslik.Text));
                SqlKomutu.Parameters.AddWithValue("@B_Yer", ddlYer.SelectedValue);
                SqlKomutu.Parameters.AddWithValue("@B_Resim", resimyolu);
                SqlKomutu.Parameters.AddWithValue("@B_Tarih", DateTime.Now.ToString("dd-MM-yyyy"));

                if (ddlKategori.SelectedValue == "Kategori Seçiniz")
                {
                     SqlKomutu.Parameters.AddWithValue("@K_id", 0);
                }
                else
                {
                    SqlKomutu.Parameters.AddWithValue("@K_id", Convert.ToInt32(ddlKategori.SelectedValue));
             
                }
                   SqlKomutu.ExecuteNonQuery();


                SqlKomutu.Dispose();
                baglan.Close();
                baglan.Dispose();
         
                    lblMesaj.Text = " <div class='tamam'><div class='fa-check fa'></div>&nbsp;&nbsp; Kayıt Başarıyla Tamamlanmıştır.</div>";
                    txtBaslik.Text = "";
                    txtIcerik.Text = "";
                    resimyolu = "";


               // Response.Redirect("Blog.aspx");
                }

            }
            else
            {
              
              lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Uzantısı Desteklenmeyen Formatta</div>";
            }
          
        }
        else
        {
            lblMesaj.Text = "<div class='hata'><div class='fa-exclamation fa'></div>&nbsp; Resim Seçiniz</div>";
        }


      
    }
    protected void btnGuncelle_Click(object sender, EventArgs e)
    {
        Image1.Visible = true;
        string resimyolu = Image1.ImageUrl.Replace("/resimler/", "");
        if (FileUpload1.HasFile)
        {   //Resim dosya kontrolü için burayı aktif yapabilirsiniz
            //string uzanti = FileUpload1.FileName.Split('.')[(FileUpload1.FileName.Split('.').Length - 1)];
            //if (uzanti == "jpg" || uzanti == "png" || uzanti == "bmp" || uzanti == "gif")
            //{
            Random rnd = new Random();
            string sonresimadi = rnd.Next(10000, 100000).ToString();

            string file = System.IO.Path.GetFileName(FileUpload1.FileName);
            string uzan = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

            if (uzan == ".jpg" | uzan == ".gif" | uzan == ".png" | uzan == ".jpeg")
            {

                FileUpload1.SaveAs(Server.MapPath("../resimler/" + sonresimadi + FileUpload1.FileName));

                resimyolu = sonresimadi + FileUpload1.FileName;
                // lblMesaj.Text = "../" + resimyolu;

            }
            else
            {
                lblMesaj.Text = "<div class='hata'><div class='fa-exclamation fa'></div>&nbsp; Resim Uzantısı Desteklenmeyen Formatta</div>";
            }
            //}
        }
        else
        {
            lblMesaj.Text = "<div class='hata'><div class='fa-exclamation fa'></div>&nbsp; Resim Seçiniz</div>";
        }




        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogGuncelle");

        SqlKomutu.Parameters.AddWithValue("@B_Resim", resimyolu);
        SqlKomutu.Parameters.AddWithValue("@B_Baslik", txtBaslik.Text);
        SqlKomutu.Parameters.AddWithValue("@B_Icerik", txtIcerik.Text);
        SqlKomutu.Parameters.AddWithValue("@B_Etiket", txtEtiket.Text);
        SqlKomutu.Parameters.AddWithValue("@B_Link", Temizle.UrlCevir(txtBaslik.Text));
        SqlKomutu.Parameters.AddWithValue("@B_Yer", ddlYer.SelectedValue);
        SqlKomutu.Parameters.AddWithValue("@B_Tarih", DateTime.Now.ToString("dd-MM-yyyy"));
        SqlKomutu.Parameters.AddWithValue("@B_id", Convert.ToInt32(ltid.Text));

        if (ddlKategori.SelectedValue == "Kategori Seçiniz")
        {
            SqlKomutu.Parameters.AddWithValue("@K_id", 0);
        }
        else
        {
            SqlKomutu.Parameters.AddWithValue("@K_id", Convert.ToInt32(ddlKategori.SelectedValue));

        }


        SqlKomutu.ExecuteNonQuery();


        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();

        Response.Redirect("Blog.aspx");
      

    }


    protected void grdListe_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            int sid = Convert.ToInt32(e.CommandArgument);

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogSil");

            SqlKomutu.Parameters.AddWithValue("@B_id", sid);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Blog.aspx");



        }

        if (e.CommandName == "Duzelt")
        {
            Image1.Visible = true;
            int sid = Convert.ToInt32(e.CommandArgument);

            ltid.Text = sid.ToString();

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogDuzenleGetir");

            SqlKomutu.Parameters.AddWithValue("@B_id", sid);

            SqlDataReader DataOkuyucu;
            DataOkuyucu = SqlKomutu.ExecuteReader();

            while (DataOkuyucu.Read())
            {
                txtBaslik.Text = DataOkuyucu["B_Baslik"].ToString().Trim();
                txtIcerik.Text = DataOkuyucu["B_Icerik"].ToString().Trim();
                txtEtiket.Text = DataOkuyucu["B_Etiket"].ToString().Trim();
                Image1.ImageUrl = "/resimler/" + DataOkuyucu["B_Resim"].ToString().Trim();
                ddlYer.SelectedValue = DataOkuyucu["B_Yer"].ToString().Trim();



            }

            DataOkuyucu.Close();
            DataOkuyucu.Dispose();
            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            btnGuncelle.Visible = true;
            btnKaydet.Visible = false;

            btnOlustur.Visible = false;
            Panel2.Visible = false;
            Panel1.Visible = true;



        }

    }

    protected void grdListe_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grdListe.PageIndex = e.NewPageIndex;


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_BlogGetir");

        SqlDataAdapter da = new SqlDataAdapter(SqlKomutu);

        DataTable dt = new DataTable();
        da.Fill(dt);

        grdListe.DataSource = dt;
        grdListe.DataBind();

        //DataOkuyucu.Close();
        //DataOkuyucu.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


    }


    protected void btnDuzenle_Click(object sender, EventArgs e)
    {
        btnOlustur.Visible = true;
        Panel2.Visible = true;
        Panel1.Visible = false;
        

    }
    protected void btnOlustur_Click(object sender, EventArgs e)
    {
        btnOlustur.Visible = true;
        Panel2.Visible = false;
        Panel1.Visible = true;
    }


}