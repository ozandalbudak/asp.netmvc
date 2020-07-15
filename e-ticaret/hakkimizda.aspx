<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="hakkimizda.aspx.cs" Inherits="hakkimizda" Title="Hakkımızda" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView2" runat="server" DataSourceID="AccessDataSource1" 
        Width="770px">
        <EditItemTemplate>
            icerik:
            <asp:TextBox ID="icerikTextBox" runat="server" Text='<%# Bind("icerik") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            icerik:
            <asp:TextBox ID="icerikTextBox" runat="server" Text='<%# Bind("icerik") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="icerikLabel" runat="server" Text='<%# Bind("icerik") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/Veriler.mdb" 
        SelectCommand="SELECT [icerik] FROM [iletisim] WHERE ([turu] = ?)">
        <SelectParameters>
            <asp:Parameter DefaultValue="hakkimizda" Name="turu" Type="String" />
        </SelectParameters>
    </asp:AccessDataSource>
</asp:Content>

