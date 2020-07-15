<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calismalarim.aspx.cs" Inherits="Calismalarim" %>

<%@ Register Src="~/webusercontroller/Calismalarim.ascx" TagPrefix="uc1" TagName="Calismalarim" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="baslik">
         <asp:Label ID="ltMesaj" runat="server" Text="Çalışmalarım"></asp:Label>
        
</div>
<div class="parca"></div>
<div class="cizgi"></div>

    
<script type="text/javascript">


    $(document).ready(function () {
        var thumbs = $(".webiller");

        for (var i = 0, ii = thumbs.length; i < ii; i++) {
            if (thumbs[i].title && thumbs[i].title.length > 0) {
                var imgtitle = thumbs[i].title;
                $(thumbs[i]).wrap('').
               after('<li class=\'caption\'>' + imgtitle + '</div>').
               removeAttr('title');

            }
        }

        $('.webiller').hover(
       function () {
           $(this).find('img').animate({ opacity: "1.0" }, 00);
           $(this).find('.caption').animate({ top: "-161px" }, 300);
       },
       function () {
           $(this).find('img').animate({ opacity: "1.0" }, 300);
           $(this).find('.caption').animate({ top: "161px" }, 300);
       }
       );
    });



</script>

    <div class="biblog">
  
  

        <uc1:Calismalarim ID="Calismalarim1" runat="server" />
  
  

        </div>

</asp:Content>

