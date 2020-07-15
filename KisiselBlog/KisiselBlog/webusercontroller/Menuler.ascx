<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menuler.ascx.cs" Inherits="webusercontroller_Menuler" %>


<ul>
   
      <asp:Repeater ID="rptMenuler" runat="server">
    <ItemTemplate>
<li><a href='<%#Eval("Link") %>'><img src='/resimler/<%#Eval("icon") %>' style="float:right; margin-top:20px; margin-right:-45px"border="0"  /><%#Eval("Menu") %></a></li>
         </ItemTemplate>
</asp:Repeater>
</ul>



   