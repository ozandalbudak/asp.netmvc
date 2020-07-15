<%@ Page Title="" Language="VB" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="false" CodeFile="ayrinti.aspx.vb" Inherits="ayrinti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style12
        {
            width: 700px;
            height: 447px;
        }
        .style13
        {
            width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style12">
        <tr>
            <td align="center" valign="top">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" 
                    RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <table cellpadding="0" cellspacing="0" class="style13">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<% # "images/" & (DataBinder.Eval(Container, "DataItem.resim")) %>' Width="250" Height="250" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Font-Size="Large" 
                                        Text='<%# Eval("model") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="urundetay.aspx?id=<%#Eval("kategori_id")%>">
                    <img alt = "" src ="icons/detaya.jpg"/></a></td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>

