<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="baslikic">
Blog
</div>

<div class="oklar"><span class="sayfa">  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
<asp:HyperLink ID="HyperLink1" runat="server" class="solok"></asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" class="sagok"></asp:HyperLink>


</div>



<div class="parca"></div>
<div class="cizgi">
    
    </div>
    

   <asp:Repeater ID="rptBlog" runat="server"><ItemTemplate>


        <div class="biblog"><a href='/<%#Eval("B_id") %>/<%#Eval("B_Link") %>'>
<div class="blogresimdis"><img src='/resimler/<%#Eval("B_Resim") %>' width="339" height="156" border="0"/></div>
<div class="yazibaslik"> <%#Eval("B_Baslik") %></div>

<div class="blogbilgiler">

  <div class="tarih"><img src="images/tarih.png" width="18" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/> <%#Eval("B_Tarih") %></div>
  
  
    <div class="tarih"><img src="images/user.png" width="16" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/> Admin</div>


  <div class="tarih"><img src="images/yorum.png" width="23" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/> <%#Eval("yor") %> Yorum</div>


<div class="yaziblogdis">
   <%#Eval("B_Icerik") %>
</div>


</div>

</a>

</div>


   

        </ItemTemplate></asp:Repeater>

</asp:Content>

