<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Calismalarim.ascx.cs" Inherits="webusercontroller_Calismalarim" %>
  <asp:Repeater ID="rptCalisma" runat="server"><ItemTemplate>

        
<div class="webiller"><img src='/resimler/<%#Eval("B_Resim") %>' width="320" height="156" /><a href='/<%#Eval("B_id") %>/<%#Eval("B_Link") %>' class="caption"> 
  <%#Eval("B_Tarih") %> <br/> <%#Eval("B_Baslik") %></a></div>


                                                 </ItemTemplate></asp:Repeater>