using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.OleDb;
using System.Web;

/// <summary>
/// Summary description for veritabani
/// </summary>
public class veritabani
{
	public veritabani()
	{
        
        
    }

     public OleDbConnection baglan()
     {
        OleDbConnection baglanti = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/Veriler.mdb"));
        return (baglanti);
     }

    public int cmd(string sqlcumle)
    {
        OleDbConnection baglan = this.baglan();
        OleDbCommand sorgu = new OleDbCommand(sqlcumle, baglan);
        int sonuc = 0;
        try
        {
            sonuc = sorgu.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            throw new Exception(ex.Message);
        }
        sorgu.Dispose();
        baglan.Close();
        baglan.Dispose();
        return (sonuc);
    }

    public DataTable GetDataTable(string sql)
    {
        OleDbConnection baglan = this.baglan();
        OleDbDataAdapter adapter = new OleDbDataAdapter(sql, baglan);
        DataTable dt = new DataTable();
        try
        {
            baglan.Open();
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        adapter.Dispose();
        baglan.Close();
        baglan.Dispose();
        return dt;
    }

    public OleDbCommand OledbCommand(string Sqlcumle)
    {
        //OledbCommand Nesnemizi tanımlıyoruz...
        OleDbConnection baglanti = this.baglan();
        OleDbCommand sorgu = new OleDbCommand(Sqlcumle, baglanti);
        sorgu.Connection = baglanti;
        int sonuc = 0;
        try
        {
            baglanti.Open();
            sorgu.ExecuteNonQuery();
            return sorgu;
        }
        catch (OleDbException ex)
        {
            throw new Exception(ex.Message);
        }
        sorgu.Dispose();
        baglanti.Close();
        baglanti.Dispose();
    }

    public DataSet GetDataSet(string sql)
    {
        OleDbConnection baglan = this.baglan();
        OleDbDataAdapter adapter = new OleDbDataAdapter(sql, baglan);
        DataSet ds = new DataSet();
        try
        {
            adapter.Fill(ds);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
        adapter.Dispose();
        baglan.Close();
        baglan.Dispose();
        return ds;
    }

    public DataRow GetDataRow(string sql)
    {
        DataTable table = GetDataTable(sql);
        if (table.Rows.Count == 0) return null;
        return table.Rows[0];
    }

    public string GetDataCell(string sql)
    {
        DataTable table = GetDataTable(sql);
        if (table.Rows.Count == 0) return null;
        return table.Rows[0][0].ToString();
    }
}