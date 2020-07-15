using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_SiteAyar : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FormDoldur();
        }




    }

    private void FormDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_SiteAyar", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteAyarYukle");


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            txtDesc.Text = DataOkuyucu["A_Description"].ToString().Trim();
            txtKeywords.Text = DataOkuyucu["Keywords"].ToString().Trim();
            txtGoogle.Text = DataOkuyucu["GoogleKod"].ToString().Trim();

        
            Image2.ImageUrl = "/resimler/" + DataOkuyucu["Arkaplan"].ToString().Trim();
            ltid.Text = DataOkuyucu["A_id"].ToString().Trim();
        }


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
     
        Image2.Visible = true;
        string resimyolu2 = Image2.ImageUrl.Replace("/resimler/", "");
        if (FileUpload2.HasFile)
        {   //Resim dosya kontrolü için burayı aktif yapabilirsiniz
            //string uzanti = FileUpload1.FileName.Split('.')[(FileUpload1.FileName.Split('.').Length - 1)];
            //if (uzanti == "jpg" || uzanti == "png" || uzanti == "bmp" || uzanti == "gif")
            //{
            Random rnd = new Random();
            string sonresimadi = rnd.Next(10000, 100000).ToString();

            string file = System.IO.Path.GetFileName(FileUpload2.FileName);
            string uzan = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();

            if (uzan == ".jpg" | uzan == ".gif" | uzan == ".png" | uzan == ".jpeg")
            {

                FileUpload2.SaveAs(Server.MapPath("../resimler/" + sonresimadi + FileUpload2.FileName));

                resimyolu2 = sonresimadi + FileUpload2.FileName;
                // lblMesaj.Text = "../" + resimyolu;

            }
            else
            {
                lblMesaj.Text = "Uzantı yanlış";
            }
            //}
        }
        else
        {
            lblMesaj.Text = "Resim Seçmediniz";
        }





        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_SiteAyar", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;


        SqlKomutu.Parameters.AddWithValue("@A_Description", txtDesc.Text);
        SqlKomutu.Parameters.AddWithValue("@Keywords", txtKeywords.Text);
        SqlKomutu.Parameters.AddWithValue("@GoogleKod", txtGoogle.Text);
        SqlKomutu.Parameters.AddWithValue("@Arkaplan", resimyolu2);

        if (ltid.Text == "")
        {
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteAyarKaydet");
        }
        else
        {
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteAyarGuncelle");
            SqlKomutu.Parameters.AddWithValue("@A_id", ltid.Text);
        }

        SqlKomutu.ExecuteNonQuery();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
        lblMesaj.Text = " <div class='tamam'><div class='fa-check fa'></div>&nbsp;&nbsp; Ayarlar Güncellenmiştir.</div>";
    }
}