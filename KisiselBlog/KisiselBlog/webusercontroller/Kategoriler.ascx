<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Kategoriler.ascx.cs" Inherits="webusercontroller_Kategoriler" %>

<ul>
   
    <li><a href='/Default.aspx'><img src='/images/anasayfa.png' style="float:right; margin-top:20px; margin-right:-45px"border="0"  />Ana Sayfa</a></li>

      <asp:Repeater ID="rptMenuler" runat="server">
    <ItemTemplate>
<li><a href='/Kat/<%#Eval("K_id") %>/<%#Eval("K_Link") %>'><img src='/images/ok.png' style="float:right; margin-top:20px; margin-right:-45px"border="0"  /><%#Eval("K_KategoriAdi") %></a></li>
         </ItemTemplate>
</asp:Repeater>
</ul>



   