<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="YoneticiAyar.aspx.cs" Inherits="Admin_YoneticiAyar" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> YÖNETİCİ AYARLARI <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>
   



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>PROFİL RESMİ </span>   
  <div style="float:right; margin-right:10px; margin-left:10px">  <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" /></div>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fileUpload" /> 
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>AD SOYAD </span>   
 <asp:TextBox ID="txtAdSoyad" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>ÜNVAN </span>   
<asp:TextBox ID="txtUnvan" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalaniki">
 <div class="yazi">ÖZGEÇMİŞ</div> 
<ckeditor:ckeditorcontrol ID="txtGecmis"  StartupOutlineBlocks="True" runat="server" Height="150px"></ckeditor:ckeditorcontrol>
              
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>DOĞUM TARİHİ </span>   
<asp:TextBox ID="txtTarih" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->

<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>E-POSTA ADRESİ </span>   
<asp:TextBox ID="txtEposta" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>TELEFON </span>   
<asp:TextBox ID="txtTelefon" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MEMLEKET </span>   
<asp:TextBox ID="txtMemleket" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>ŞEHİR </span>   
<asp:TextBox ID="txtSehir" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>FACEBOOK ADRESİ </span>   
<asp:TextBox ID="txtFacebook" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>TWİTTER ADRESİ</span>   
<asp:TextBox ID="txtTwitter" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>WEB SİTESİ ADRESİ </span>   
<asp:TextBox ID="txtWeb" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>ADMİN KULLANICI ADI </span>   
<asp:TextBox ID="txtAdmin" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>ADMİN ŞİFRESİ </span>   
<asp:TextBox ID="txtSifre" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
  
<asp:Button ID="btnKaydet" runat="server" onclick="btnKaydet_Click" Text="Kaydet" />
</div>
<!-- formalan kısım bitiş -->

     <asp:Label ID="ltid" runat="server" ForeColor="#f0f0f3"></asp:Label>

</asp:Content>

