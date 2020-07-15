<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Menuler.aspx.cs" Inherits="Admin_Menuler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  

    
    <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> MENÜLER <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>
   

    
<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MENÜ BAŞLIK </span>   
  <asp:TextBox ID="txtAdi" runat="server" CssClass="yazialanstil"></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->


<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MENÜ LİNK </span>   
   <asp:TextBox ID="txtLink" runat="server" CssClass="yazialanstil"></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MENÜ SIRA </span>   
   <asp:TextBox ID="txtSira" runat="server" CssClass="yazialanstil"></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



    <!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MENÜ RESİM </span>   
   <div style="float:right; margin-right:10px; margin-left:10px"> <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" /></div>
  <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fileUpload" />
</div>
<!-- formalan kısım bitiş -->



    <!-- formalan kısım başlangıç -->
<div class="formalan">
   
<asp:Button ID="btnKaydet" CssClass="kaydet" runat="server" onclick="btnKaydet_Click" 
            Text="Kaydet" /><asp:Button ID="btnGuncelle" CssClass="kaydet" runat="server" onclick="btnGuncelle_Click" 
            Text="Güncelle" />
</div>
<!-- formalan kısım bitiş -->


    <!-- formalan kısım başlangıç -->
<div class="formalan">
<span>MENÜLER </span>   
 <asp:GridView ID="grdListe" runat="server" OnRowCommand="grdListe_RowCommand"
                        AutoGenerateColumns="False">
                        
                      
                        <Columns>
                            <asp:BoundField DataField="Menu" HeaderText="Menu Adı" >

                                <HeaderStyle HorizontalAlign="Left" />
                           
                            </asp:BoundField>

                              <asp:BoundField DataField="Link" HeaderText="Menu Link" />
                            <asp:BoundField DataField="Sira" HeaderText="Sıra" />

                              <asp:TemplateField HeaderText="Duzenle" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Duzelt" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("M_id") %>' CommandName="Duzelt" 
                                        OnClientClick="return confirm('Düzenlemek istediğinizden emin misiniz?');" >
                                         <div class="fa fa-gear kicon"></div>

</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("M_id") %>' CommandName="Sil" 
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

   

      <table cellpadding="0" cellspacing="0" class="auto-style3">
          <tr>
              <td>
                   

              </td>

          </tr>

      </table>
  
</asp:Content>

