<%@ Page Title="İçerik Ekle !!!" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ekle.aspx.cs" Inherits="Admin_ekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
    }
        .style3
        {
            width: 8px;
        }
        .style4
        {
            width: 224px;
        }
    .style5
    {
        width: 109px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="style5">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Marka Seçiniz"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="210px">
                    <asp:ListItem Value="0">Birini Seçiniz</asp:ListItem>
                    <asp:ListItem Value="1">Acer</asp:ListItem>
                    <asp:ListItem Value="2">Casper</asp:ListItem>
                    <asp:ListItem Value="3">Asus</asp:ListItem>
                    <asp:ListItem Value="4">Toshiba</asp:ListItem>
                    <asp:ListItem Value="5">Samsung</asp:ListItem>
                    <asp:ListItem Value="6">PackerdBell</asp:ListItem>
                    <asp:ListItem Value="7">Exper</asp:ListItem>
                    <asp:ListItem Value="8">Lenovo</asp:ListItem>
                    <asp:ListItem Value="9">Sony</asp:ListItem>
                    <asp:ListItem Value="10">Msi</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Model Giriniz"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server" Width="209px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Ekran Kartı"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox2" runat="server" Width="209px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Ses Kartı"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox3" runat="server" Width="209px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="İşlemci"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="TextBox4" runat="server" Width="209px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Resim"></asp:Label>
            </td>
            <td class="style3">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td class="style4">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td align="right" class="style4">
                <asp:Button ID="Button1" runat="server" Font-Bold="True" Text="Ürün Ekle" 
                    Width="108px" onclick="Button1_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" align="center" colspan="3">
                <asp:Label ID="Label13" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>