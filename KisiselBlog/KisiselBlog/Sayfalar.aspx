<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sayfalar.aspx.cs" Inherits="Sayfalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta property="og:image" content='<asp:Literal ID="ltfbresim" runat="server"></asp:Literal>'>
    
<script type="text/jscript">



    function sayfayiImle(servis) {
        u = location.href;
        t = document.title;
        var servis, url;
      
        if (servis == 'twitter')
            url = window.open('http://twitter.com/home?status=' + encodeURIComponent(u) + ' ' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=626,height=436');
        else if (servis == 'facebook')
            url = window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(u) + '&t=' + encodeURIComponent(t), 'sharer', 'toolbar=0,status=0,width=626,height=436');
        else return false;


    }
</script>
<style type="text/css">
    #sosyal {
         float:right;
         width:100px;
    }

#sosyal ul {
	margin: 0px;
	padding: 0px;
}
#sosyal ul li {
	list-style-type: none;
}
#sosyal ul li a {
	float: left;
	display: block;
	margin-right: 10px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

    
<div class="baslikic">
   <asp:Label ID="ltMesaj" runat="server" Text="İletişim"></asp:Label>
</div>

<div class="oklar"><span class="sayfa">  <asp:Label ID="Label1" runat="server" Text="&nbsp;"></asp:Label></span>
<asp:HyperLink ID="HyperLink1" runat="server" class="solok"></asp:HyperLink>
    <asp:HyperLink ID="HyperLink2" runat="server" class="sagok"></asp:HyperLink>

    
	&nbsp;
</div>

  
<div class="parca"></div>
<div class="cizgi"></div>

    
    
    
  <div class="blogresim"><img src='/resimler/<asp:Literal ID="ltResim" runat="server"></asp:Literal>' width="678" height="312" /></div>
<div class="yazibaslik"><asp:Literal ID="ltBaslik" runat="server"></asp:Literal></div>
<div class="blogbilgiler">

  <div class="tarih"><img src="/images/tarih.png" width="18" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/> <asp:Literal ID="ltTarih" runat="server"></asp:Literal></div>
  
  
    <div class="tarih"><img src="/images/user.png" width="16" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/> Admin</div>


  <div class="tarih"><img src="/images/yorum.png" width="23" height="18
  " style="margin-top:5px; margin-right:5px;" border="0" align="left"/><asp:Literal ID="ltYorumSayisi" runat="server"></asp:Literal> Yorum</div>




<div id="sosyal">
<ul>

    <li><a href="#" onClick="sayfayiImle('facebook');"><img src="/images/fbook.png" /></a></li>
  <li><a href="#" onClick="sayfayiImle('twitter');"><img src="/images/twitter.png" /></a></li>
</ul>
</div>

</div>



<div class="yaziblog">
  <p><asp:Literal ID="ltIcerik" runat="server"></asp:Literal></p>
 Etiketler :<div class="etiket"> <asp:Literal ID="ltetiket" runat="server"></asp:Literal></div>
</div>


    
<div class="yazibaslik2">
    <asp:Label ID="lbYorum" runat="server" Text="Yorumunu Gönder"></asp:Label>
</div>

<div class="yorumalan">
<div class="yorumsol">
    <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="yaz" value="Adınız Soyadınız..." onclick="if(this.value==&#39;Adınız Soyadınız...&#39;){this.value=&#39;&#39;}" onblur="if(this.value==&#39;&#39;){this.value=&#39;Adınız Soyadınız...&#39;}"></asp:TextBox>

    <asp:TextBox ID="txtMail" runat="server" CssClass="yaz" value="E-Posta Adresiniz..." onclick="if(this.value==&#39;E-Posta Adresiniz...&#39;){this.value=&#39;&#39;}" onblur="if(this.value==&#39;&#39;){this.value=&#39;E-Posta Adresiniz...&#39;}"></asp:TextBox>



<div class="guvenlikresim"><asp:Image ID="imgGuvenlikKelimesi" runat="server"
                      ImageUrl="/GuvenlikKodu.aspx" Height="30px" Width="40px" ImageAlign="AbsMiddle" /></div>
<asp:TextBox ID="txtKarakter" runat="server" CssClass="guvenlik" value="Güvenlik Kodu..." onclick="if(this.value==&#39;Güvenlik Kodu...&#39;){this.value=&#39;&#39;}" onblur="if(this.value==&#39;&#39;){this.value=&#39;Güvenlik Kodu...&#39;}"></asp:TextBox>

    <asp:Button ID="btnYorum" runat="server" Text="Yorumu Gönder" CssClass="buton" OnClick="btnYorum_Click" />

</div>




<div class="yorumsag">
    <asp:TextBox ID="txtYorum" runat="server" CssClass="yorumyaz" TextMode="MultiLine" value="Yorumunuz..." onclick="if(this.value==&#39;Yorumunuz...&#39;){this.value=&#39;&#39;}" onblur="if(this.value==&#39;&#39;){this.value=&#39;Yorumunuz...&#39;}"></asp:TextBox>
</div>

</div>
<!--yorumalanbitis-->



<div class="yazibaslik2">Yorum Yazanlar</div>
<div class="gelenyorumlar">

    <asp:Repeater ID="rptYorumlar" runat="server"><ItemTemplate>
<div class="yorumunbiri">
<div class="yorumresim"><img src="/images/yorumresim.png" alt="" width="125" height="108" border="0"/>
    

</div>
   
    
<div class="yorumicerik">
    <a href="#"><%#Eval("AdSoyad") %></a> - <%#Eval("Tarih") %> <br /><br /><%#Eval("Yorum") %> </div>

</div>

         </ItemTemplate></asp:Repeater>

    </div>
       

</asp:Content>

