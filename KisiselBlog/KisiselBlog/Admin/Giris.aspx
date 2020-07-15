<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Giris.aspx.cs" Inherits="Admin_Giris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
<!-- formalan kısım başlangıç -->
<div class="formalanuc">
<span>BLOG YAZI SAYISI </span>
 <center><div style="font-size:24px;"> <asp:Literal ID="ltBlogSayi" runat="server"></asp:Literal> </div></center>
</div>
<!-- formalan kısım bitiş -->

<!-- formalan kısım başlangıç -->
<div class="formalanuc">
<span>ÇALIŞMA SAYISI </span>
 <center><div style="font-size:24px;"> <asp:Literal ID="ltCalisma" runat="server"></asp:Literal> </div></center>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalanuc">
<span>SAYFA SAYISI </span>
 <center><div style="font-size:24px;"> <asp:Literal ID="ltSayfa" runat="server"></asp:Literal> </div></center>
</div>
<!-- formalan kısım bitiş -->


</asp:Content>

