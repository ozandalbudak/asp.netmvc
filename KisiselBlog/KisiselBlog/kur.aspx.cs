using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;
using System.Text;


public partial class kur : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnKur_Click(object sender, EventArgs e)
    {
    

        string veriyol =  txtVeriyol.Text;
        string veri =  txtVeriTabani.Text;
        string kadi = txtKadi.Text;
        string sifre = txtSifre.Text;

        //String str;
        SqlConnection myConn = new SqlConnection("data source="+veriyol+";initial catalog="+veri+";user id="+kadi+";Password="+sifre+"");


      //  SqlCommand myCommand = new SqlCommand(str, myConn);

        myConn.Open();
        //myCommand.ExecuteNonQuery();

        string script = "USE [" + veri + "] " + Environment.NewLine + "GO" + Environment.NewLine;
        using (StreamReader dosya = new StreamReader(HttpContext.Current.Server.MapPath("/script.sql"), System.Text.Encoding.UTF8))
        {

            script += dosya.ReadToEnd();
            dosya.Close();
            SqlCommand com = new SqlCommand("", myConn);
            foreach (string s in script.Split(new string[] { "GO" + Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries))
            {
                com.CommandText = s;
                com.ExecuteNonQuery();
            }

            
         
         
    
        }
     
     
         

            SqlCommand SqlKomutu = new SqlCommand("dbo.sp_Yonetici", myConn);
            SqlKomutu.CommandType = System.Data.CommandType.StoredProcedure;
            SqlKomutu.Parameters.AddWithValue("@Islem", "Y_SiteSifre");
            SqlKomutu.Parameters.AddWithValue("@Kadi", txtAdmin.Text);
            SqlKomutu.Parameters.AddWithValue("@Sifre", txtAdminSifre.Text);
            SqlKomutu.ExecuteNonQuery();

            SqlKomutu.Dispose();
            myConn.Dispose();
            myConn.Close();

            Response.Redirect("/admin/");  
 


        }
      

      

    }

  
