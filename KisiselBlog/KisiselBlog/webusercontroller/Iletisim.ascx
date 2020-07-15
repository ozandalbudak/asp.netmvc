<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Iletisim.ascx.cs" Inherits="webusercontroller_Iletisim" %>
 <div class="baslik">
         <asp:Label ID="ltMesaj" runat="server" Text="İletişim"></asp:Label>
        
</div>
<div class="parca"></div>
<div class="cizgi"></div>
<div class="yazi">
  

    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td class="auto-style2">
                <span class="formyazi">Adınız Soyadınız</span></td>
            <td>
                <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><span class="formyazi">E-Posta Adresiniz</span></td>
            <td>
                <asp:TextBox ID="txtEposta" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top"> <span class="formyazi">Mesajınız</span></td>
            <td>
                <asp:TextBox ID="txtMesaj" runat="server" CssClass="formkutu" TextMode="MultiLine" Height="100px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"> <span class="formyazi">Güvenlik Kodu <asp:Image ID="imgGuvenlikKelimesi" runat="server"
                      ImageUrl="../GuvenlikKodu.aspx" Height="30px" Width="40px" ImageAlign="AbsMiddle" /></span></td>
            <td class="auto-style4">
                <asp:TextBox ID="txtKarakter" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Gönder" CssClass="formgonder" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
  

    
    <span style="height:69px; overflow:hidden; display:block;" ></span>

</div>