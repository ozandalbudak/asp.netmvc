<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="casper.aspx.cs" Inherits="casper" Title="Casper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
        DataSourceID="AccessDataSource1" GroupItemCount="3">
        <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                 <img style="max-width:250px;max-height:250px;" src="<%#Eval("resim").ToString() %>" />
                    <br />
                   
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                    <br />
                   <a href="urundetay.aspx?id=<%#Eval("id")%>">
                    <img alt = "" src ="icons/detaya.jpg"/> </a>
                    <br />
                </td>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FAFAD2;color: #284775;">
                  
                    <img style="max-width:250px;max-height:250px;" src="<%#Eval("resim").ToString() %>" />
                    <br />
                   
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                    <br />
                  
                   <a href="urundetay.aspx?id=<%#Eval("id")%>">
                    <img alt = "" src ="icons/detaya.jpg"/> </a>
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                
                    <img style="max-width:250px;max-height:250px;" src="<%#Eval("resim").ToString() %>" />
                    <br />
                
                    <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66;color: #000080;">
              
                 <img style="max-width:250px;max-height:250px;" src="<%#Eval("resim").ToString() %>" />
                    <br />
                 
                    <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                   <a href="urundetay.aspx?id=<%#Eval("id")%>">
                    <img alt = "" src ="icons/detaya.jpg"/> </a>
                   <%-- detaya gonderen kod--%>
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <SelectedItemTemplate>
                <td runat="server" 
                    style="background-color: #FFCC66;font-weight: bold;color: #000080;">
            
                  <img style="max-width:250px;max-height:250px;" src="<%#Eval("resim").ToString() %>" /> 
                 <%-- Resim Getiren kod--%>
                    <br />
                
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                    <br />
                   <a href="urundetay.aspx?id=<%#Eval("id")%>">
                    <img alt = "" src ="icons/detaya.jpg"/> </a>
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~/App_Data/Veriler.mdb" 
            SelectCommand="SELECT [resim], [model], [id] FROM [casper]">
        </asp:AccessDataSource>
</asp:Content>

