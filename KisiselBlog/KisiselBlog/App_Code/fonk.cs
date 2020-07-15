using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for fonk
/// </summary>
public class fonk
{
	public fonk()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection baglanti()
    {

	 
        
        SqlConnection Sqlbaglantisi = new SqlConnection("data source=.\\SQLEXPRESS;initial catalog=deneme;integrated security=true");


        Sqlbaglantisi.Open();
        if (Sqlbaglantisi.State == ConnectionState.Closed)
        {
            Sqlbaglantisi.Open();
        }

        return (Sqlbaglantisi);
    }


  

}