using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Menuler : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        GridDoldur();
        if (!IsPostBack)
        {
            btnGuncelle.Visible = false;
            Image1.Visible = false;
        }
    }

    private void GridDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_Menuler");



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

                SqlConnection baglan = veriyol.baglanti();
                SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
                SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
                SqlKomutu.Parameters.AddWithValue("@Islem", "Y_MenuKaydet");
                SqlKomutu.Parameters.AddWithValue("@Menu", txtAdi.Text);
                SqlKomutu.Parameters.AddWithValue("@Link", txtLink.Text);
                SqlKomutu.Parameters.AddWithValue("@Sira", txtSira.Text);
                SqlKomutu.Parameters.AddWithValue("@icon", resimyolu);
                SqlKomutu.ExecuteNonQuery();
                SqlKomutu.Dispose();
                baglan.Close();
                baglan.Dispose();
                Response.Redirect("Menuler.aspx");

            }
            else
            {
                lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Uzantısı Desteklenmeyen Formatta</div>";
        
            }
            //}
        }
        else
        {
            lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Seçiniz.</div>";
        
        }

      

    }


    protected void grdListe_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            int sid = Convert.ToInt32(e.CommandArgument);

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;

            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_MenuSil");

            SqlKomutu.Parameters.AddWithValue("@M_id", sid);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Menuler.aspx");



        }

        if (e.CommandName == "Duzelt")
        {
            Image1.Visible = true;
            int sid = Convert.ToInt32(e.CommandArgument);

            ltid.Text = sid.ToString();

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_MenuDuzenle");

            SqlKomutu.Parameters.AddWithValue("@M_id", sid);

            SqlDataReader DataOkuyucu;
            DataOkuyucu = SqlKomutu.ExecuteReader();

            while (DataOkuyucu.Read())
            {
                txtAdi.Text = DataOkuyucu["Menu"].ToString().Trim();
                txtLink.Text = DataOkuyucu["Link"].ToString().Trim();
                txtSira.Text = DataOkuyucu["Sira"].ToString().Trim();
                Image1.ImageUrl = "/resimler/" + DataOkuyucu["icon"].ToString().Trim();
                
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
                lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Uzantısı Desteklenmeyen Formatta</div>";
        
            }
            //}
        }
        else
        {
            lblMesaj.Text = " <div class='hata'><div class='fa-exclamation fa'></div>&nbsp;&nbsp; Resim Seçiniz.</div>";
        
        }


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Menu", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_MenuGuncelle");
        SqlKomutu.Parameters.AddWithValue("@Menu", txtAdi.Text);
        SqlKomutu.Parameters.AddWithValue("@Link", txtLink.Text);
        SqlKomutu.Parameters.AddWithValue("@Sira", txtSira.Text);
        SqlKomutu.Parameters.AddWithValue("@icon", resimyolu);
        SqlKomutu.Parameters.AddWithValue("@M_id", ltid.Text);
        SqlKomutu.ExecuteNonQuery();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
        Response.Redirect("Menuler.aspx");
    }
}