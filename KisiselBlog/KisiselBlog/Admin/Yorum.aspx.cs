using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Yorum : System.Web.UI.Page
{
    fonk veriyol = new fonk();
    protected void Page_Load(object sender, EventArgs e)
    {
        grdDoldur();
        GridYorumDoldur();
    }

    private void GridYorumDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_YorumlarTum");


        SqlDataAdapter da = new SqlDataAdapter(SqlKomutu);

        DataSet dt = new DataSet();
        da.Fill(dt);

        grdYorum.DataSource = dt;
        grdYorum.DataBind();


        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();
    }



    protected void grdYorum_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            int sid = Convert.ToInt32(e.CommandArgument);

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;

            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_YorumSil");

            SqlKomutu.Parameters.AddWithValue("@Y_id", sid);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Yorum.aspx");



        }

   
    }

    protected void grdYorum_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grdYorum.PageIndex = e.NewPageIndex;


        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_YorumlarTum");

        SqlDataAdapter da = new SqlDataAdapter(SqlKomutu);

        DataTable dt = new DataTable();
        da.Fill(dt);

        grdYorum.DataSource = dt;
        grdYorum.DataBind();

        //DataOkuyucu.Close();
        //DataOkuyucu.Dispose();

        SqlKomutu.Dispose();
        baglan.Close();
        baglan.Dispose();


    }





    private void grdDoldur()
    {
        SqlConnection baglan = veriyol.baglanti();
        SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
        SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
        SqlKomutu.Parameters.AddWithValue("@Islem", "Y_Yorumlar");


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
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;

            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_YorumSil");

            SqlKomutu.Parameters.AddWithValue("@Y_id", sid);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Yorum.aspx");



        }

        if (e.CommandName == "Duzelt")
        {
           
            int sid = Convert.ToInt32(e.CommandArgument);

            ltid.Text = sid.ToString();

            SqlConnection baglan = veriyol.baglanti();
            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yorum", baglan);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_YorumOnayla");

            SqlKomutu.Parameters.AddWithValue("@Y_id", sid);
            SqlKomutu.ExecuteNonQuery();
          
            SqlKomutu.Dispose();
            baglan.Close();
            baglan.Dispose();
            Response.Redirect("Yorum.aspx");
        

        }

    }


}