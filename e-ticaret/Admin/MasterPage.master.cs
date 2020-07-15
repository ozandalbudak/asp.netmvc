using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{
    veritabani vt = new veritabani();
    OleDbCommand komut = null;
    OleDbDataReader dr = null;

    private void son_giris()
    {
        OleDbConnection baglanti = vt.baglan();
        baglanti.Open();
        komut = new OleDbCommand("Select son_giris From uyeler Where email= '" + Session["e_mail"].ToString() + "'", baglanti);
        dr = komut.ExecuteReader();
        if (dr.Read() == true)
        {
            //((Label)((MasterPage)Page.Master).FindControl("Label2")).Text = dr["son_giris"].ToString();
            //Label pnl = (Label)this.Master.FindControl("Label2");
            Label2.Text = dr["son_giris"].ToString();
        }
        else
        {
            ((Label)((MasterPage)Page.Master).FindControl("Label2")).Text = "Hata";
        }
        komut.Dispose();
        baglanti.Close();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      
        Label1.Text = Session["kullanici"].ToString();
        DataTable doldur = vt.GetDataTable("Select * From yon_menu");
        DataList1.DataSource = doldur;
        DataList1.DataBind();
        son_giris();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}
