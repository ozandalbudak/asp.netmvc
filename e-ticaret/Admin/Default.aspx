<%@ Page Title="NOBilişim Yönetim Paneli !!!" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 641px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
        <table cellpadding="0" cellspacing="0" class="style2">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Admin Yönetim Kısmı"></asp:Label>
                </td>
            </tr>
        </table>
    <br />
</asp:Content>