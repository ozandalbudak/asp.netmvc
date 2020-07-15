<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="katekle.aspx.cs" Inherits="Admin_katekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style2
    {
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td align="center">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Kategori Ekle"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Kategori İsmi :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="validate[required]" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td align="center">
                        <asp:Button ID="Button1" runat="server" Text="Ekle" onclick="Button1_Click" 
                            Height="26px" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" align="center" colspan="2">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</asp:Content>

