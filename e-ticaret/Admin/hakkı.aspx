<%@ Page Title="Hakkımızda Güncelle" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="hakkı.aspx.cs" Inherits="Admin_hakkı" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 600px;
        }
        .style3
        {
        }
        .style4
        {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td align="center" class="style3">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Hakkımızda"></asp:Label>
            </td>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" 
                    BasePath="ckeditor/" Width="500px">
                </CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td align="right">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Güncelle" Font-Bold="True" ForeColor="Maroon" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style3" colspan="3">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>