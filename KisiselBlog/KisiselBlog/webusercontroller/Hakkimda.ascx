<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Hakkimda.ascx.cs" Inherits="webusercontroller_Hakkimda" %>
  <asp:Repeater ID="rptAnaSayfa" runat="server"><ItemTemplate>
    <div class="baslik">
Merhaba, Ben <strong><%#Eval("AdSoyad") %></strong><br />
<%#Eval("Unvan") %>
</div>
<div class="parca"></div>
<div class="cizgi"></div>
<div class="yazi"><%#Eval("Gecmis") %></div>



<div class="baslik">
Kişisel Bilgiler
</div>
<div class="parca2"></div>
<div class="cizgi2"></div>

<div class="kisibilgileri">

<div class="bilgialan">
<div class="sorualan">Adı Soyadı</div>
<div class="cevappalan"><%#Eval("AdSoyad") %></div>
</div>



<div class="bilgialan">
<div class="sorualan">Doğum Tarihi</div>
<div class="cevappalan"><%#Eval("Dtarih") %></div>
</div>

<div class="bilgialan">
<div class="sorualan">Yaşadığı Şehir</div>
<div class="cevappalan"><%#Eval("Sehir") %> </div>
</div>

<div class="bilgialan">
<div class="sorualan">e-mail</div>
<div class="cevappalan"><%#Eval("Eposta") %></div>
</div>

<div class="bilgialan">
<div class="sorualan">Memleketi</div>
<div class="cevappalan"><%#Eval("Memleket") %> </div>
</div>




<div class="bilgialan">
<div class="sorualan">Telefon</div>
<div class="cevappalan"><%#Eval("Telefon") %></div>
</div>

<div class="bilgialan">
<div class="sorualan">Web Site</div>
<div class="cevappalan"><%#Eval("Web") %></div>
</div>


</div>
        </ItemTemplate></asp:Repeater>