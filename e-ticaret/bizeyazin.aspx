<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="bizeyazin.aspx.cs" Inherits="bizeyazin" Title="Bize Yazın" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style9
        {
            height: 27px;
        }
        .style10
        {
            height: 14px;
        }
        .style19
        {
            width: 91px;
            height: 116px;
        }
        .style21
        {
            height: 116px;
        }
        .style25
        {
            height: 116px;
            width: 338px;
        }
        .style29
        {
            height: 12px;
            width: 91px;
        }
        .style30
        {
            height: 12px;
        }
        .style31
        {
            height: 12px;
            width: 338px;
        }
        .style32
        {
            height: 9px;
            width: 91px;
        }
        .style33
        {
            height: 9px;
        }
        .style34
        {
            height: 9px;
            width: 338px;
        }
        .style39
        {
            width: 70%;
        }
        .style40
        {
            height: 12px;
            width: 592px;
        }
        .style41
        {
            height: 9px;
            width: 592px;
        }
        .style42
        {
            width: 592px;
            height: 116px;
        }
        .style43
        {
            width: 770px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Panel ID="Panel2" runat="server" Font-Bold="true" Height="324px" 
        Width="696px">
        <table align="center" border="3" class="style39">
            <tr>
                <td>
                    <table align="center" bgcolor="#CCCCCC" border="0" 
                        style="width: 470px; height: 315px">
                        <tr>
                            <td bgcolor="#CCCCCC" class="style40" align="right">
                                <asp:Label ID="Label1" runat="server" Text="Adı Soyadı"></asp:Label>
                            </td>
                            <td class="style29" bgcolor="#CCCCCC">
                                :</td>
                            <td class="style31">
                                <asp:TextBox ID="adsoy" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td class="style30">
                            </td>
                        </tr>
                        <tr>
                            <td class="style40" align="right">
                                <asp:Label ID="Label2" runat="server" Text="E-Mail"></asp:Label>
                            </td>
                            <td class="style29">
                                :</td>
                            <td class="style31">
                                <asp:TextBox ID="email" runat="server" Width="150px"></asp:TextBox>
                            </td>
                            <td class="style30">
                            </td>
                        </tr>
                        <tr>
                            <td class="style41" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Konu"></asp:Label>
                            </td>
                            <td class="style32">
                                :</td>
                            <td class="style34">
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="21px" Width="155px">
                                    <asp:ListItem>Mesaj</asp:ListItem>
                                    <asp:ListItem>İstek</asp:ListItem>
                                    <asp:ListItem>Siparis</asp:ListItem>
                                    <asp:ListItem>Şikayet</asp:ListItem>
                                    <asp:ListItem>Öneri</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style33">
                            </td>
                        </tr>
                        <tr>
                            <td class="style42" align="right">
                                <asp:Label ID="Label4" runat="server" Text="Mesaj"></asp:Label>
                            </td>
                            <td class="style19">
                                :</td>
                            <td class="style25">
                                <asp:TextBox ID="mesaj" runat="server" Height="140px" Width="331px" OnTextChanged="mesaj_TextChanged"></asp:TextBox>
                            </td>
                            <td class="style21">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="4">
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                                    onclientclick="confirm ('Mesajınız İletilmiştir Teşekur Ederiz !!!');" 
                                    Text="Gönder" Width="141px" Font-Bold="True" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/Veriler.mdb" 
            SelectCommand="SELECT [adsoy], [konu], [mesaj] FROM [bizeyazin] ORDER BY [adsoy]">
        </asp:AccessDataSource>
        <br />
        <br />
        <br />
        <br />
</asp:Panel>
    <br />
    <br />
    <table cellpadding="0" cellspacing="0" class="style43">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>

