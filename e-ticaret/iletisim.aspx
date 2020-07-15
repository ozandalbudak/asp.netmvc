<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="iletisim.aspx.cs" Inherits="iletisim" Title="İletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p align="center">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="AccessDataSource1" 
            Height="53px" Width="770px">
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
                <asp:TextBox ID="icerikTextBox0" runat="server" Text='<%# Bind("icerik") %>' />
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
            SelectCommand="SELECT [icerik] FROM [iletisim] WHERE ([turu] = ?) ORDER BY [icerik]">
            <SelectParameters>
                <asp:Parameter DefaultValue="iletisim" Name="turu2" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
    </p>
</asp:Content>