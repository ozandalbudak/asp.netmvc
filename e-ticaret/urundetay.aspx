<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="urundetay.aspx.cs" Inherits="urundetay" Title="Ürün Detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style12
        {
            width: 300px;
        }
        .style13
        {
            width: 700px;
        }
        .style19
        {
            width: 94px;
        }
        .style20
        {
            width: 14px;
        }
        .style21
        {
            width: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table cellpadding="0" cellspacing="0" class="style13">
        <tr>
            <td align="center">
            <asp:DetailsView ID="DetailsView2" runat="server" BackColor="White" 
    BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" 
    CellSpacing="1" DataSourceID="Acces" GridLines="None" Height="50px" 
    Width="125px" AutoGenerateRows="False" DataKeyNames="icerik_id">
    <Fields >
    <asp:TemplateField >
        <ItemTemplate>
            <table cellpadding="0" cellspacing="0" class="style12" align="center">
                <tr>
                    <td align="center">
                        <asp:Image ID="Image1" runat="server" ImageUrl ='<%# Eval("resim", "images/{0}") %>'  Width ="250" Height ="250"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Ürün Özellikleri"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" class="style12">
                            <tr>
                                <td class="style19" align="right">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Model"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=":"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:Label ID="model" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style19">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style19" align="right">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Ekran Kartı"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text=":"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:Label ID="ekarti" runat="server" Text='<%# Eval("ekarti") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style19">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style19" align="right">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="İşlemci"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text=":"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:Label ID="islemci" runat="server" Text='<%# Eval("islemci") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style19">
                                    &nbsp;</td>
                                <td class="style21">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style19" align="right">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Ses Kartı"></asp:Label>
                                </td>
                                <td class="style21">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text=":"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:Label ID="ses_kart" runat="server" Text ='<%# Eval("skarti") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:TemplateField>
    </Fields>
    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
    <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
</asp:DetailsView>
<asp:AccessDataSource ID="Acces" runat ="server" DataFile="~/App_Data/Veriler.mdb" SelectCommand="Select * From icerikler where kategori_id=@kategori_id">

<SelectParameters>
        <asp:QueryStringParameter Name="@kategori_id" QueryStringField="id" />
    </SelectParameters>
</asp:AccessDataSource>
    <br />
    <br />
</td>
        </tr>
    </table>
</asp:Content>