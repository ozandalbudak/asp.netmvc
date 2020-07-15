<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hakkinda.aspx.cs" Inherits="_Hakkinda" %>

<%@ Register Src="~/webusercontroller/Hakkimda.ascx" TagPrefix="uc1" TagName="Hakkimda" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:Hakkimda runat="server" ID="Hakkimda" />
        
    <span style="height:47px; overflow:hidden; display:block;" ></span>

</asp:Content>

