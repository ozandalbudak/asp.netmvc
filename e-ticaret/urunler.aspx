<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="urunler.aspx.cs" Inherits="urunler" Title="Ürünler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style12
        {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table align="center" border="3" width="770">
        <tr>
            <td align="center">
                <asp:ImageButton ID="ImageButton9" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/acer/acer-logo.jpg" Width="200px" 
                    onclick="ImageButton9_Click" />
            </td>
            <td align="center">
                <asp:ImageButton ID="ImageButton10" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/asus/asus_logo1.jpg" Width="200px" 
                    onclick="ImageButton10_Click" />
            </td>
            <td align="center" class="style12">
                <asp:ImageButton ID="ImageButton11" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/casper/casper_logo.jpg" Width="200px" 
                    onclick="ImageButton11_Click" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:ImageButton ID="ImageButton12" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/exper/exper_logo.jpg" Width="200px" 
                    onclick="ImageButton12_Click" />
            </td>
            <td align="center">
                <asp:ImageButton ID="ImageButton13" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/samsung/samsung-logo.jpg" Width="200px" 
                    onclick="ImageButton13_Click" />
            </td>
            <td align="center" class="style12">
                <asp:ImageButton ID="ImageButton14" runat="server" Height="200px" 
                    ImageUrl="~/images/resımler/toshıba/toshıba_logo.jpg" Width="200px" 
                    onclick="ImageButton14_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

