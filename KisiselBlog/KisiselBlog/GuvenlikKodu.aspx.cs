using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

public partial class GuvenlikKodu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        const int Uzunluk = 3;

        // Güvenlik kelimesinde kullanılacak karakterler dizesidir.
        string[] m_Karakterler = new string[] {
                                                "0" , "1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" };

        // Random olarak rakam oluşturabileceğimiz Random class'ının tanımlanmasıdır.
        Random m_Random = new Random();

        // Boş güvenlik kelimemizdir.
        string m_GuvenlikKelimesi = String.Empty;

        for (int i = 0; i < Uzunluk; i++)
        {
            // Random oluşturulan rakamın index olarak kabul edilip, m_Karakterler dizesinden ilgili karakterin alındığı satırdır.
            m_GuvenlikKelimesi += m_Karakterler[m_Random.Next(m_Karakterler.Length - 1)];
        }

        // Güvenlik kelimesinin Session'a eklendiği satırdır.
        Session.Add("GuvenlikKelimesi", m_GuvenlikKelimesi);

      //  Session["GuvenlikKelimesi"] = m_GuvenlikKelimesi.ToString();

        // Resim çizme işleminin yapıldığı bölümdür.
        Bitmap m_Resim = new Bitmap(Server.MapPath("GuvenlikBg1.jpg"));
        Graphics m_Grafik = Graphics.FromImage(m_Resim);
        Font m_Font = new Font("Tahoma", 12, FontStyle.Bold);
        Brush m_FircaMavi = new SolidBrush(Color.Black);
      

        
        m_Grafik.DrawString(m_GuvenlikKelimesi, m_Font, m_FircaMavi, new PointF(4, 1));

        // Resmin ekrana gönderildiği bölümdür.
        Response.ContentType = "image/jpg";
        m_Resim.Save(Response.OutputStream, ImageFormat.Jpeg);
       
    }


}