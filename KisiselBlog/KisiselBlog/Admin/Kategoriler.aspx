<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Kategoriler.aspx.cs" Inherits="Admin_Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> KATEGORİLER <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>
   



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>KATEGORİ ADI </span>
 <asp:TextBox ID="txtKat" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>KATEGORİ SIRASI </span>
 <asp:TextBox ID="txtSira" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



    <!-- formalan kısım başlangıç -->
<div class="formalan">
       <asp:Button ID="btnKaydet" runat="server" onclick="btnKaydet_Click" Text="Kaydet" /> 
    <asp:Button ID="btnGuncelle" CssClass="kaydet" runat="server" onclick="btnGuncelle_Click" Text="Güncelle" />
</div>
<!-- formalan kısım bitiş -->





    <!-- formalan kısım başlangıç -->
<div class="formalan">
<span>KATEGORİLER </span>   
 <asp:GridView ID="grdListe" runat="server" OnRowCommand="grdListe_RowCommand"
                        AutoGenerateColumns="False">
                        
                      
                        <Columns>
                            <asp:BoundField DataField="K_KategoriAdi" HeaderText="Kategori Adı" >

                                
                           
                            </asp:BoundField>

                              
                            <asp:BoundField DataField="K_Sira" HeaderText="Sıra" />

                              <asp:TemplateField HeaderText="Duzenle" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Duzelt" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("K_id") %>' CommandName="Duzelt" >
                                         <div class="fa fa-gear kicon"></div>

</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("K_id") %>' CommandName="Sil" 
                                        OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');" >
                                         <div class="fa fa-trash-o kicon"></div> 
</asp:LinkButton>
                                </ItemTemplate>
                               <ItemStyle Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                </asp:GridView>
</div>
<!-- formalan kısım bitiş -->

    <asp:Label ID="ltid" runat="server" ForeColor="#f0f0f3"></asp:Label>
</asp:Content>

