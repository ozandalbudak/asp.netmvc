<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="uyeol.aspx.cs" Inherits="Sol_Menü_uyeol" Title="Üye Ol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style7
    {
            width: 17px;
        }
    .style9
    {
        width: 11px;
    }
    .style10
    {
        height: 30px;
        width: 11px;
    }
    .style11
    {
        width: 117px;
    }
    .style12
    {
        height: 30px;
        width: 117px;
    }
    .style13
    {
        width: 336px;
    }
        .style14
        {
            width: 117px;
            height: 26px;
        }
        .style15
        {
            width: 20px;
            height: 26px;
        }
        .style16
        {
            width: 11px;
            height: 26px;
        }
        .style17
        {
            width: 336px;
            height: 26px;
        }
    .style18
    {
        width: 20px;
    }
    .style19
    {
        height: 30px;
        width: 20px;
    }
    .style20
    {
        height: 30px;
        width: 336px;
    }
        .style21
        {
            width: 770px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" 
        Font-Names="Bernard MT Condensed" Height="463px" 
        BorderColor="Black">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <table class="style3" align="center" style="width: 551px; height: 363px;">
        <tr>
            <td class="style11" align="left">
                    Ad Soyad</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    *</td>
            <td class="style13">
                <asp:TextBox ID="adsoy" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="adsoy" ErrorMessage="* lı Alanlar Bos Geçilemez !!" 
                        Font-Names="Bodoni MT" Font-Size="Medium" ValidationGroup="Kaydet"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style11" align="left">
                    Cinsiyet</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:DropDownList ID="cinsiyet" runat="server" ValidationGroup="Kaydet">
                    <asp:ListItem>Bay</asp:ListItem>
                    <asp:ListItem>Bayan</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style14" align="left">
                    Sehir</td>
            <td class="style15">
                    :</td>
            <td class="style16">
                    </td>
            <td class="style17">
                <asp:DropDownList ID="sehir" runat="server" DataSourceID="iller" 
                        DataTextField="sehiradiUpper" DataValueField="sehiradiUpper" 
                        ValidationGroup="Kaydet">
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    Telefon</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:TextBox ID="tel" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    Adres</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:TextBox ID="adres" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    E-Mail</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    *</td>
            <td class="style13">
                <asp:TextBox ID="email" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="email" ErrorMessage="* lı Alanlar Bos Geçilemez !!" 
                        Font-Names="Bodoni MT" Font-Size="Medium" ValidationGroup="Kaydet"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="email" 
                        ErrorMessage="Lütfen Geçerli E-Mail Giriniz Örnek ( mgbilisim@bilisim.com ) Gibi" 
                        Font-Names="Arial Rounded MT Bold" Font-Size="X-Small" ForeColor="Black" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="Kaydet"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    Üyelik Türü</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:DropDownList ID="turu" runat="server" Height="19px" 
                        ValidationGroup="Kaydet" Width="127px">
                    <asp:ListItem>Kullanıcı</asp:ListItem>
                    <asp:ListItem>Standart Üye</asp:ListItem>
                    <asp:ListItem>Moderator</asp:ListItem>
                    <asp:ListItem>Bayi</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style12" align="left">
                    Sifre</td>
            <td class="style19">
                    :</td>
            <td class="style10">
                    *</td>
            <td class="style20">
                <asp:TextBox ID="sifre" runat="server" TextMode="Password" 
                        ValidationGroup="Kaydet"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="sifre" ErrorMessage="* lı Alanlar Bos Geçilemez !!" 
                        Font-Names="Bodoni MT" Font-Size="Medium" ValidationGroup="Kaydet"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    Sifre (Tekrarı)</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:TextBox ID="sifretekrar" runat="server" TextMode="Password" 
                        ValidationGroup="Kaydet"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="sifretekrar" ControlToValidate="sifre" 
                        ErrorMessage="Sifreler Aynı Degil Lütfen Geçerli Sifre Giriniz !!" 
                        Font-Names="Bodoni MT" Font-Size="Medium"></asp:CompareValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    T.C No</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    &nbsp;</td>
            <td class="style13">
                <asp:TextBox ID="tc" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style11">
                    Dogum Tarihi</td>
            <td class="style18">
                    :</td>
            <td class="style9">
                    *</td>
            <td class="style13">
                <asp:TextBox ID="dtarihi" runat="server" ValidationGroup="Kaydet"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="dtarihi" ErrorMessage="* lı Alanlar Bos Geçilemez !!" 
                        Font-Names="Bodoni MT" Font-Size="Medium" ValidationGroup="Kaydet"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                    &nbsp;</td>
            <td class="style13">
                <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/icons/Kaydet.gif" onclick="ImageButton2_Click" 
                        ValidationGroup="Kaydet" Height="74px" Width="133px" 
                    onclientclick="confirm (' Üyeliğiniz Gerçekleşmiştir Keyifli Alış Verişler Dileriz ');" />
            </td>
        </tr>
    </table>
    <br />
        <table cellpadding="0" cellspacing="0" class="style21">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    <asp:AccessDataSource ID="iller" runat="server" 
        DataFile="~/App_Data/il_ilce_semt_access.mdb" 
        SelectCommand="SELECT [sehiradiUpper] FROM [sehir] ORDER BY [sehiradiUpper]">
    </asp:AccessDataSource>
</asp:Panel>
</asp:Content>