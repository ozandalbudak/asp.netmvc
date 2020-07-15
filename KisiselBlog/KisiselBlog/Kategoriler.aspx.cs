using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kategoriler : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        BlogGetir();

        Page.Title = "Blog Sayfası";
        Page.MetaDescription = "Kişisel Web Sitesi Blog Yazıları";

        ((UserControl)this.Master.FindControl("Menuler1")).Visible = false;
        ((UserControl)this.Master.FindControl("Kategoriler1")).Visible = true;


        Kategoriadi();


    }

    private void Kategoriadi()
    {
        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["K_id"].ToString());

        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Kategoriler", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_KategorilerDuzenleGetir");

        SqlKomutu.Parameters.AddWithValue("@K_id", id);

        SqlDataReader DataOkuyucu;
        DataOkuyucu = SqlKomutu.ExecuteReader();

        while (DataOkuyucu.Read())
        {
            ltKategoriadi.Text = DataOkuyucu["K_KategoriAdi"].ToString().Trim();
            

        }

        DataOkuyucu.Close();
        DataOkuyucu.Dispose();
        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }

    private void BlogGetir()
    {
        
             
        int id = Convert.ToInt32(HttpContext.Current.Request.RequestContext.RouteData.Values["K_id"].ToString());


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "BlogYazilarKategori");
        SqlKomutu.Parameters.AddWithValue("@K_id", id);


        SqlDataAdapter da = new SqlDataAdapter(SqlKomutu);

        DataTable dt = new DataTable();
        da.Fill(dt);


        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = dt.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 10;
        int currentPage;

        if (Request.QueryString["Sayfa"] != null)
        {
            currentPage = Int32.Parse(Request.QueryString["Sayfa"]);
        }
        else
        {
            currentPage = 1;
        }

        pds.CurrentPageIndex = currentPage - 1;
        Label1.Text = "Sayfa: " + currentPage + " / " + pds.PageCount;

        if (!pds.IsFirstPage)
        {
            HyperLink1.NavigateUrl = "Blog.aspx?Sayfa=" + (currentPage - 1);
        }

        if (!pds.IsLastPage)
        {
            HyperLink2.NavigateUrl = "Blog.aspx?Sayfa=" + (currentPage + 1);
        }

        rptBlog.DataSource = pds;
        rptBlog.DataBind();

        da.Dispose();
        dt.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }
}