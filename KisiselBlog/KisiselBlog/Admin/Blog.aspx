<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Admin_Blog" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="goster"><asp:LinkButton ID="btnDuzenle" runat="server" OnClick="btnDuzenle_Click"><i class="fa fa-th"></i> Sayfa Düzenle </asp:LinkButton></div>
    <div class="goster"><asp:LinkButton ID="btnOlustur" runat="server" OnClick="btnOlustur_Click"><i class="fa fa-pencil-square-o"></i> Sayfa Oluştur</asp:LinkButton></div>
    <div style="clear:both"></div>
    <asp:Panel ID="Panel1" runat="server">

    <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> SAYFA OLUŞTUR <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>
   
  

<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>Resim Ekle </span>
     <div style="float:right; margin-right:10px; margin-left:10px">  <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" /></div>
                <asp:FileUpload ID="FileUpload1" runat="server" />
</div>
<!-- formalan kısım bitiş -->



<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>Yazı Başlığı </span>
 <asp:TextBox ID="txtBaslik" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->



    <!-- formalan kısım başlangıç -->
<div class="formalaniki">
    <div class="yazi">Yazı İçeriği </div>
              <ckeditor:ckeditorcontrol ID="txtIcerik"  FilebrowserUploadUrl="/Upload.ashx" StartupOutlineBlocks="True" runat="server" ></ckeditor:ckeditorcontrol>
</div>
<!-- formalan kısım bitiş -->




<!-- formalan kısım başlangıç -->
<div class="formalan">
<span>Yazı Etiketleri </span>
 <asp:TextBox ID="txtEtiket" runat="server" ></asp:TextBox>
</div>
<!-- formalan kısım bitiş -->





    <!-- formalan kısım başlangıç -->
<div class="formalan">
<span>Yer Seçiniz </span>
               <asp:DropDownList ID="ddlYer" runat="server">
                   
                    <asp:ListItem>Blog</asp:ListItem>
                    <asp:ListItem>Sayfa</asp:ListItem>
                    <asp:ListItem>Calismalar</asp:ListItem>
                </asp:DropDownList>
</div>
<!-- formalan kısım bitiş -->

    
<div class="formalan">
<span>Kategori Seçiniz </span>
               <asp:DropDownList ID="ddlKategori" runat="server">
                  
                </asp:DropDownList>
</div>
<!-- formalan kısım bitiş -->
    



    <!-- formalan kısım başlangıç -->
<div class="formalan">

       <asp:Button ID="btnKaydet" runat="server" onclick="btnKaydet_Click" 
            Text="Kaydet" /><asp:Button ID="btnGuncelle" runat="server" onclick="btnGuncelle_Click" 
            Text="Güncelle" />   
</div>
<!-- formalan kısım bitiş -->
        </asp:Panel>

    <asp:Panel ID="Panel2" runat="server">
        <!-- formalan kısım başlangıç -->
<div class="formalan">
<span> Yayındakiler </span>
     <asp:GridView ID="grdListe" runat="server"  OnRowCommand="grdListe_RowCommand"
        CellPadding="3" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="grdListe_PageIndexChanging" 
              PageSize="20">
                        

                        <Columns>
                            <asp:ImageField DataImageUrlField="B_Resim" DataImageUrlFormatString="/Resimler/{0}" HeaderText="Resimm" ControlStyle-Height="80" ControlStyle-Width="120">
<ControlStyle Height="80px" Width="100px"></ControlStyle>
                                   <ItemStyle Height="90px" Width="130px" HorizontalAlign="Center" />
                            </asp:ImageField>

                              <asp:BoundField DataField="B_Baslik" HeaderText="Başlık" />


                              <asp:TemplateField HeaderText="Göster" ShowHeader="False">
                                <ItemTemplate>
                                 <a href='/<%#Eval("B_id") %>/<%#Eval("B_Link") %>' target="_blank">                             
                                      <div class="fa fa-eye kicon"></div>
</a>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>


                              <asp:TemplateField HeaderText="Duzenle" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Duzelt" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("B_id") %>' CommandName="Duzelt">
                                        <div class="fa fa-gear kicon"></div>
</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("B_id") %>' CommandName="Sil" 
                                        OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');" 
                                        >
                                          <div class="fa fa-trash-o kicon"></div> 
</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                        </Columns>
                        
                </asp:GridView>
</div>
<!-- formalan kısım bitiş -->
    </asp:Panel>

    <asp:Label ID="ltid" runat="server" ForeColor="#f0f0f3"></asp:Label>


</asp:Content>

