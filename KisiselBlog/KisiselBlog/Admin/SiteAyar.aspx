<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="SiteAyar.aspx.cs" Inherits="Admin_SiteAyar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> SİTE AYARLARI <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>
   

<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>DESCRİPTİON </span>   
 <asp:TextBox ID="txtDesc" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->

<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>KEYWORDS </span>   
 <asp:TextBox ID="txtKeywords" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>GOOGLE ANALYTİCS KODU </span>   
 <asp:TextBox ID="txtGoogle" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



    
<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>SİTE ARKAPLAN RESMİ </span>   
  <div style="float:right; margin-right:10px; margin-left:10px"> <asp:Image ID="Image2" runat="server" Height="50px" Width="50px" /></div>
                <asp:FileUpload ID="FileUpload2" runat="server" CssClass="fileUpload" />
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
  
<asp:Button ID="btnKaydet" runat="server" onclick="btnKaydet_Click" Text="Kaydet" />
</div>
<!-- formalan kısım bitiş -->

     <asp:Label ID="ltid" runat="server" ForeColor="#f0f0f3"></asp:Label>
</asp:Content>

