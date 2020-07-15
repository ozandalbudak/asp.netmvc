<%@ Page Language="C#" MasterPageFile="~/Ana Sayfa.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="NO Bilişim - Online Satış / Ana Sayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/coin-slider-styles.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/coin-slider.min.js" type="text/javascript"></script>
    <script src="js/coin-slider.js" type="text/javascript"></script>
    <style type="text/css">
        .style12
        {
            width: 770px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br/>

<div id='coin-slider'>

    <a href="kampanyalar.aspx" target="_blank">

       <img src="images/resımler/asusy/1.jpg"   style="width: 185px; height: 106px" />
        
        <span>

           Sık Sık Uğrayın Kampanyaları Kaçırmayın !!

        </span>

    </a>

<a href="kampanyalar.aspx" target="_blank">
 <img src="images/resımler/asusy/2.jpg"style="height: 184px; width: 186px" alt="" />
     
        <span>

           NO Bilişim - Online Satış !!

        </span>

    </a>
    <a href="kampanyalar.aspx" target="_blank">

        <img src="images/resımler/asusy/3.jpg"  height="158px" width="255px" alt="" />

        <span>

           FLAŞŞŞ Üyelerimiz % 10 İndirim !!

        </span>

    </a>
    <a href="kampanyalar.aspx" target="_blank">

        <img src="images/resımler/asusy/4.jpg"  style="height: 271px; width: 242px" alt="" />

        <span>

           Sizin Hala Bi ASUS'unuz Yokmu ??

        </span>

    </a>
    <a href="kampanyalar.aspx" target="_blank">

        <img src="images/resımler/asusy/5.jpg" style="height:290px; width: 318px;" alt=""  />

        <span>

           ASUS PC Ve LAPTOP'larda İnanılmaz Kampanya !!!

        </span>

    </a>
    <br />
    <table cellpadding="0" cellspacing="0" class="style12">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>
    

<script type="text/javascript">

	$(document).ready(function() {
		$('#coin-slider').coinslider({
		 width: 750,
		 navigation: false,
		 delay: 5000,
         height:500 , // height of slider panel
         spw: 7, // squares per width
         sph: 5, // squares per height
         delay: 3000, // delay between images in ms
         sDelay: 30, // delay beetwen squares in ms
         opacity: 0.7, // opacity of title and navigation
         titleSpeed: 500, // speed of title appereance in ms
         effect: '', // random, swirl, rain, straight
         navigation: true, // prev next and buttons
         links : true, // show images as links
         hoverPause: true // pause on hover

		  });
 });

</script>    
                        </asp:Content>

