<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="kampanyalar.aspx.cs" Inherits="kampanyalar" Title="Kampanyalarımız" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="id" DataSourceID="AccessDataSource1" 
        GridLines="Vertical" onselectedindexchanged="GridView1_SelectedIndexChanged1" 
        Width="770px" ForeColor="Black">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:BoundField DataField="kampanyalar" HeaderText="Kampanyalar" 
                SortExpression="kampanyalar" />
            <asp:BoundField DataField="indirim" HeaderText="indirim" 
                SortExpression="indirim" />
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/icons/detaya.jpg" 
                ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/Veriler.mdb" 
        SelectCommand="SELECT * FROM [kampanyalar] ORDER BY [id]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
        DataFile="~/App_Data/Veriler.mdb" 
        SelectCommand="SELECT * FROM [kampanyalar] WHERE ([id] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" CellPadding="4" 
        CellSpacing="2" DataKeyNames="id" DataSourceID="AccessDataSource2" 
        ForeColor="Black" GridLines="Both" 
        onpageindexchanging="FormView1_PageIndexChanging" Width="381px">
        <FooterStyle BackColor="#CCCCCC" />
        <RowStyle BackColor="White" />
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            kampanyalar:
            <asp:TextBox ID="kampanyalarTextBox" runat="server" 
                Text='<%# Bind("kampanyalar") %>' />
            <br />
            ktarih:
            <asp:TextBox ID="ktarihTextBox" runat="server" Text='<%# Bind("ktarih") %>' />
            <br />
            btarih:
            <asp:TextBox ID="btarihTextBox" runat="server" Text='<%# Bind("btarih") %>' />
            <br />
            indirim:
            <asp:TextBox ID="indirimTextBox" runat="server" Text='<%# Bind("indirim") %>' />
            <br />
            icerik:
            <asp:TextBox ID="icerikTextBox" runat="server" Text='<%# Bind("icerik") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            kampanyalar:
            <asp:TextBox ID="kampanyalarTextBox0" runat="server" 
                Text='<%# Bind("kampanyalar") %>' />
            <br />
            ktarih:
            <asp:TextBox ID="ktarihTextBox0" runat="server" Text='<%# Bind("ktarih") %>' />
            <br />
            btarih:
            <asp:TextBox ID="btarihTextBox0" runat="server" Text='<%# Bind("btarih") %>' />
            <br />
            indirim:
            <asp:TextBox ID="indirimTextBox0" runat="server" 
                Text='<%# Bind("indirim") %>' />
            <br />
            icerik:
            <asp:TextBox ID="icerikTextBox0" runat="server" Text='<%# Bind("icerik") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="style5">
                <tr>
                    <td bgcolor="#FF9933">
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        .</td>
                    <td>
                        =</td>
                    <td>
                        Kampanya !!</td>
                </tr>
                <tr>
                    <td bgcolor="#FF9999">
                        Marka
                    </td>
                    <td>
                        =</td>
                    <td>
                        <asp:Label ID="kampanyalarLabel" runat="server" 
                            Text='<%# Bind("kampanyalar") %>' />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FF9933">
                        K. Başlangıç Tarihi</td>
                    <td>
                        =</td>
                    <td>
                        <asp:Label ID="ktarihLabel" runat="server" Text='<%# Bind("ktarih") %>' />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FF9999">
                        K. Bitiş Tarihi</td>
                    <td>
                        =</td>
                    <td>
                        <asp:Label ID="btarihLabel" runat="server" Text='<%# Bind("btarih") %>' />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FF9933">
                        İndirim oranı</td>
                    <td>
                        =</td>
                    <td>
                        <asp:Label ID="indirimLabel" runat="server" Text='<%# Bind("indirim") %>' />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="White" colspan="3">
                        <asp:Label ID="icerikLabel" runat="server" Text='<%# Bind("icerik") %>' />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            KAMPANYA DETAYI
        </HeaderTemplate>
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    </asp:FormView>
    <asp:ImageButton ID="ImageButton9" runat="server" Height="28px" 
        ImageUrl="~/icons/geri.png" onclick="ImageButton9_Click1" Visible="False" 
        Width="79px" />
    </asp:Content>