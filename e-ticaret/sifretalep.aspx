<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="sifretalep.aspx.cs" Inherits="sifretalep" Title="Sifre Talep" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style7
    {
        height: 33px;
    }
    .style6
    {
        height: 23px;
    }
        .style11
        {
            height: 33px;
        }
        .style12
        {
            width: 223px;
        }
        .style13
        {
            height: 23px;
            width: 223px;
        }
        .style14
        {
            height: 33px;
            width: 16px;
        }
        .style15
        {
            width: 16px;
        }
        .style16
        {
            height: 23px;
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel2" runat="server" Font-Names="Brush Script MT" 
    Font-Size="X-Large" Height="196px" Width="748px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;<table align="center" style="width: 334px">
            <tr>
                <td align="center" colspan="3">
                    SIFRE TALEP FORMU</td>
            </tr>
            <tr>
                <td align="right" class="style12">
                    Ad Soyad</td>
                <td class="style15">
                    :</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px" 
                        Width="172px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style12">
                    E-Mail</td>
                <td class="style15">
                    :</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="176px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style13">
                </td>
                <td class="style16">
                </td>
                <td class="style6">
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        onclientclick="confirm (' Şifre Talep İşleminiz Gerçekleşmistir TEŞEKKÜRLER..');" 
                        Text="Gönder" Width="99px" />
                </td>
            </tr>
        </table>
</asp:Panel>
</asp:Content>

