Imports System.Data
Imports System.Data.OleDb
Partial Class ayrinti
    Inherits System.Web.UI.Page
    Dim baglanti As New OleDbConnection
    Dim sorgu As New OleDbCommand
    Dim adap As New OleDbDataAdapter
    Dim tablo As New DataTable
    Protected Sub ayrinti_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        baglanti.ConnectionString = ("provider=microsoft.jet.oledb.4.0; data source=" + Server.MapPath("App_Data/Veriler.mdb"))
        baglanti.Open()
        sorgu.Connection = baglanti
        sorgu.CommandText = "select * from icerikler where kategori_id=@kategori"
        sorgu.Parameters.AddWithValue("@kategori", Request.QueryString("kategori"))
        adap.SelectCommand = sorgu
        adap.Fill(tablo)
        DataList1.DataSource = tablo
        DataList1.DataBind()
        baglanti.Close()
    End Sub
End Class
