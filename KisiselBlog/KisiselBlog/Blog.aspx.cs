using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Blog : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        BlogGetir();

        Page.Title = "Blog Sayfası";
        Page.MetaDescription = "Kişisel Web Sitesi Blog Yazıları";

        ((UserControl)this.Master.FindControl("Menuler1")).Visible = false;
        ((UserControl)this.Master.FindControl("Kategoriler1")).Visible = true;


    }

    private void BlogGetir()
    {

       
       

        
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Blog", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "BlogYazilar");


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