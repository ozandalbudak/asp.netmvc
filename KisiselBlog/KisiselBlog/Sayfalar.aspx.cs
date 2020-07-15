using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sayfalar : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {

        ((UserControl)this.Master.FindControl("Kategoriler1")).Visible = false;

        BlogIcerik();
        Yorumlar();

        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["B_id"].ToString());

        SonrakiYazi(id);
        OncekiYazi(id);

    }

    private void SonrakiYazi(int id)
    {
        id = id + 1;
      
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "BlogSonraki");
        SqlKomutu.Parameters.AddWithValue("@B_id", id);

        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();
        string link = "";
        string yer = "";
        if (DataOkuyucu.HasRows == true)
        {
            while (DataOkuyucu.Read())
            {

                link = DataOkuyucu["B_Link"].ToString().Trim();
                yer = DataOkuyucu["B_Yer"].ToString().Trim();

                if (yer != "Blog" & yer != "Calismalar")
                {
                    id = Convert.ToInt32(DataOkuyucu["B_id"].ToString().Trim());
                    OncekiYazi(id);

                }
                else
                {
                    HyperLink2.NavigateUrl = ("/" + id + "/" + link);
                }
                   
               
            
            }
        }




        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


    }


    private void OncekiYazi(int id)
    {
        id = id - 1;
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "BlogSonraki");
        SqlKomutu.Parameters.AddWithValue("@B_id", id);

        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();
        string link = "";
        string yer = "";
        if (DataOkuyucu.HasRows == true)
        {
            while (DataOkuyucu.Read())
            {

                link = DataOkuyucu["B_Link"].ToString().Trim();
                yer = DataOkuyucu["B_Yer"].ToString().Trim();



                if (yer != "Blog" & yer != "Calismalar")
                {
                    id = Convert.ToInt32(DataOkuyucu["B_id"].ToString().Trim());
                    OncekiYazi(id);

                }
                else
                {
                    HyperLink1.NavigateUrl = ("/" + id + "/" + link);
                }



            }
        }




        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


    }


    private void Yorumlar()
    {
        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["B_id"].ToString());
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "YorumlarGetir");
        SqlKomutu.Parameters.AddWithValue("@B_id", id);
        


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        rptYorumlar.DataSource = DataOkuyucu;
        rptYorumlar.DataBind();

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }

    private void BlogIcerik()
    {
        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["B_id"].ToString());
        string link = HttpContext.Current.Request.RequestContext.RouteData.Values["B_Link"].ToString();


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "BlogIcerik");
        SqlKomutu.Parameters.AddWithValue("@B_id", id);
        SqlKomutu.Parameters.AddWithValue("@B_Link", link);


        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();
        if (DataOkuyucu.HasRows == true)
        {
            while (DataOkuyucu.Read())
            {
                ltBaslik.Text = DataOkuyucu["B_Baslik"].ToString().Trim();
                ltIcerik.Text = DataOkuyucu["B_Icerik"].ToString().Trim();
                ltMesaj.Text = DataOkuyucu["B_Baslik"].ToString().Trim();
                ltResim.Text = DataOkuyucu["B_Resim"].ToString().Trim();
                ltTarih.Text = DataOkuyucu["B_Tarih"].ToString().Trim();
                ltYorumSayisi.Text = DataOkuyucu["yor"].ToString().Trim();
				ltfbresim.Text = "/resimler/" + DataOkuyucu["B_Resim"].ToString().Trim();


                Page.Title = DataOkuyucu["B_Baslik"].ToString().Trim();
                Page.MetaDescription = DataOkuyucu["B_Baslik"].ToString().Trim();
				
				string baslik = DataOkuyucu["B_Etiket"].ToString().Trim();
				
				string[] etiket = baslik.Split(',');
				for(int i = 0; i < etiket.Length; i++)
				{
					ltetiket.Text +="<a href='/" + id + "/" + link + "'>" + etiket[i] + "</a> - ";
				}
				

            }
        }
        else
        {
            Response.Redirect("/Default.aspx");
        }
       


        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
    protected void btnYorum_Click(object sender, EventArgs e)
    {
        GuvenlikKodu();


        if (txtAdSoyad.Text == "Adınız Soyadınız...")
        {
            lbYorum.Text = "Adınızı Soyadınızı Yazınız";
            lbYorum.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtAdSoyad.Focus();
        }
        else if (txtMail.Text == "E-Posta Adresiniz...")
        {
            lbYorum.Text = "E-Posta Adresinizi Yazınız";
            lbYorum.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtMail.Focus();
        }
        else if (Session["gkodu"] == null)
        {
            lbYorum.Text = "Güvenlik Kodunu Yanlış Girdiniz.";
            lbYorum.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
            txtKarakter.Focus();
        }
    
        else
        {
           
            YorumGonder();
        }



    }

    private void YorumGonder()
    {
       
        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["B_id"].ToString());


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "YorumYaz");
        SqlKomutu.Parameters.AddWithValue("@B_id", id);
        SqlKomutu.Parameters.AddWithValue("@AdSoyad", txtAdSoyad.Text);
        SqlKomutu.Parameters.AddWithValue("@Yorum", txtYorum.Text);
        SqlKomutu.Parameters.AddWithValue("@Eposta", txtMail.Text);
        SqlKomutu.Parameters.AddWithValue("@Tarih", DateTime.Now.ToString("dd-mm-yyyy"));
        SqlKomutu.Parameters.AddWithValue("@Onay", "False");
        SqlKomutu.ExecuteNonQuery();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();

        lbYorum.Text = "Yorumunuz Onaylandıktan Sonra Yayınlanacaktır.";
        lbYorum.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#32b41d; background-image: url(/images/okey.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
        Session.Remove("gkodu");
        txtAdSoyad.Text = "";
        txtMail.Text = "";
        txtKarakter.Text = "";
        


    }


    private void GuvenlikKodu()
    {
        if (txtKarakter.Text == Session["GuvenlikKelimesi"].ToString())
        {
            Session["gkodu"] = "dogru";
        }


        else
        {
            lbYorum.Text = "Güvenlik Kodunu Yanlış Girdiniz.";
            lbYorum.Attributes.Add("style", "color:#fff; font-size:16px; display:block; height:45px; line-height:45px; background-color:#2d2d2d; background-image: url(/images/error5.png); background-repeat: no-repeat; background-position: 10px 5px; padding-left:50px;");
        }
    }
}