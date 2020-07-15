<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Yorum.aspx.cs" Inherits="Admin_Yorum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Literal ID="lblMesaj" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> ONAYSIZ YORUMLAR <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>



<!-- formalan kısım başlangıç -->
<div class="formalan">
       <asp:GridView ID="grdListe" runat="server" OnRowCommand="grdListe_RowCommand"
                        AutoGenerateColumns="False">
                        
                     
                        <Columns>

                              <asp:BoundField DataField="AdSoyad" HeaderText="Ad Soyad" >

                              <HeaderStyle Width="150px" />
                              </asp:BoundField>

                              <asp:BoundField DataField="Yorum" HeaderText="Yorum" />
                            <asp:CheckBoxField DataField="Onay" HeaderText="Onay" >

                              <HeaderStyle Width="70px" />
                              </asp:CheckBoxField>

                              <asp:TemplateField HeaderText="Onayla" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Duzelt" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("Y_id") %>' CommandName="Duzelt" 
                                        OnClientClick="return confirm('Onaylamak istediğinizden emin misiniz?');" 
                                        Text="&lt;img src='images/edit1.png' style='float:left; margin-right:5px; padding-left:6px; border:0' /&gt;">
</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("Y_id") %>' CommandName="Sil" 
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



  <asp:Literal ID="Literal1" runat="server" Text="<div class='formalaniki'><center><i class='fa fa-angle-double-right'></i> ONAYLI YORUMLAR <i class='fa fa-angle-double-left'></i></center></div>"></asp:Literal>

    
<!-- formalan kısım başlangıç -->
<div class="formalan">
       <asp:GridView ID="grdYorum" runat="server"   OnRowCommand="grdYorum_RowCommand"
        CellPadding="3"  AutoGenerateColumns="False"  AllowPaging="True" OnPageIndexChanging="grdYorum_PageIndexChanging" 
              PageSize="20">
                     

                          <Columns>

                              <asp:BoundField DataField="AdSoyad" HeaderText="Ad Soyad" >

                              <HeaderStyle Width="150px" />
                              </asp:BoundField>

                              <asp:BoundField DataField="Yorum" HeaderText="Yorum" />
                            <asp:CheckBoxField DataField="Onay" HeaderText="Onay" >

                              <HeaderStyle Width="70px" />
                              </asp:CheckBoxField>

                            <asp:TemplateField HeaderText="Sil" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandArgument='<%#Eval("Y_id") %>' CommandName="Sil" 
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

