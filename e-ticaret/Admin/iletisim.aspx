<%@ Page Title="İletişim Güncelle !!!" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="Admin_iletisim" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style2
        {
            width: 600px;
        }
        * {
	margin: 0;
	padding: 0;
}
        .style4
        {
            width: 1px;
        }
    
h1, h2, h3, h4{
	font-family: Arial, sans-serif;
	color: #444444;
}

        .style12
        {
            border-collapse: collapse;
            margin: 15px;
        }
        .style13
        {
            color: #565656;
            border-bottom: 1px solid #ffffff;
            padding: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style12">
        <tr>
            <td align="center" class="style13">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="İletisim"></asp:Label>
            </td>
            <td class="style13">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text=":"></asp:Label>
            </td>
            <td>
                <CKEditor:CKEditorControl ID="CKEditorControl1" runat="server" 
                    BasePath="ckeditor/" Width="500px">
                </CKEditor:CKEditorControl>
            </td>
        </tr>
        <tr>
            <td align="center" class="style13">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
            <td align="right">
                <asp:Button ID="iletisim" runat="server" onclick="Button1_Click" 
                    Text="Güncelle" Font-Bold="True" ForeColor="Maroon" />
            </td>
        </tr>
        <tr>
            <td align="center" class="style13" colspan="3">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>