<%@ Page Language="C#" AutoEventWireup="true" CodeFile="kur.aspx.cs" Inherits="kur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link href="StyleSheet.css" rel="stylesheet" />
       <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 181px;
        }
        </style>
</head>
<body>
     <form id="form1" runat="server">
         <div class="genelsag">
<div class="sagust">



       <div class="baslik">
         <asp:Label ID="ltMesaj" runat="server" Text="Site Kurulum"></asp:Label>
        
</div>
<div class="parca"></div>
<div class="cizgi"></div>
<div class="yazi">
  

    <table cellpadding="0" cellspacing="0" class="auto-style1">
        <tr>
            <td class="auto-style2">
                <span class="formyazi">Veri Tabanı Yolu</span></td>
            <td>
                <asp:TextBox ID="txtVeriyol" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><span class="formyazi">Veri Tabanı Adı</span></td>
            <td>
                <asp:TextBox ID="txtVeriTabani" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top"> <span class="formyazi">VT Kullanıcı Adı</span></td>
            <td>
                 <asp:TextBox ID="txtKadi" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>

             <tr>
            <td class="auto-style2" valign="top"> <span class="formyazi">VT Şifre</span></td>
            <td>
                 <asp:TextBox ID="txtSifre" runat="server" CssClass="formkutu" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>


             <tr>
            <td class="auto-style2" valign="top"> <span class="formyazi">Admin Kullanıcı Adı</span></td>
            <td>
                 <asp:TextBox ID="txtAdmin" runat="server" CssClass="formkutu" ></asp:TextBox>
            </td>
        </tr>


             <tr>
            <td class="auto-style2" valign="top"> <span class="formyazi">Admin Şifre</span></td>
            <td>
                 <asp:TextBox ID="txtAdminSifre" runat="server" CssClass="formkutu" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>
       
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnKur" runat="server" Text="Gönder" CssClass="formgonder" OnClick="btnKur_Click" />
            </td>
        </tr>
    </table>
  

    
    <span style="height:69px; overflow:hidden; display:block;" ></span>

</div>


    </div></div>
    </form>
</body>
</html>
