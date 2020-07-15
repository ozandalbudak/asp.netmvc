<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
    <title>Blogum</title>
<head id="Head1" runat="server">
<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>





<script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>

<script src="js/jquery.fullscreenr.js" type="text/javascript"></script>   
<script src="js/scripts.js" type="text/javascript"></script> 
    
<script type="text/javascript">
<!--
    // You need to specify the size of your background image here (could be done automatically by some PHP code)
    var FullscreenrOptions = { width: 1920, height: 1080, bgID: '#bgimg' };
    // This will activate the full screen background!
    jQuery.fn.fullscreenr(FullscreenrOptions);

    function MM_preloadImages() { //v3.0
        var d = document; if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i, j = d.MM_p.length, a = MM_preloadImages.arguments; for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) { d.MM_p[j] = new Image; d.MM_p[j++].src = a[i]; }
        }
    }
    function MM_swapImgRestore() { //v3.0
        var i, x, a = document.MM_sr; for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }
    function MM_findObj(n, d) { //v4.01
        var p, i, x; if (!d) d = document; if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document; n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n]; for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i, j = 0, x, a = MM_swapImage.arguments; document.MM_sr = new Array; for (i = 0; i < (a.length - 2) ; i += 3)
            if ((x = MM_findObj(a[i])) != null) { document.MM_sr[j++] = x; if (!x.oSrc) x.oSrc = x.src; x.src = a[i + 2]; }
    }
    //-->
</script>

    
    

<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: 'Open Sans', sans-serif;
}

@font-face {
    font-family: 'OpenSansLight';
    src: url('font/opensans-light_0.eot');
    src: url('font/opensans-light_0.eot') format('embedded-opentype'),
         url('font/opensans-light_0.woff') format('woff'),
         url('font/opensans-light_0.ttf') format('truetype'),
         url('font/opensans-light_0.svg#OpenSansLight') format('svg');
    font-weight: normal;
    font-style: normal;

}
#bgimg {
	position: fixed;
	z-index: -1;
        top: 0px;
        left: 0px;
    }

#alt {
	height: 550px;
	width: 550px;
	margin-right: auto;
	margin-left: auto;
	background-image: url(images/arka.png);
	background-repeat: no-repeat;
	margin-top: 5%;
	overflow: hidden;
}
#alt #icon {
	height: 175px;
	width: 400px;
	margin-left: 32px;
	margin-top: 30px;
}
#alt #icon a {
	text-decoration: none;
	color: #FFF;
	text-align: center;
	font-size: 35px;
	line-height: 60px;
	display: block;
}


#alt #girisler {
	height: 190px;
	width: 400px;
	margin-left: 32px;
	margin-top: 5px;
	overflow: hidden;
}
#alt #girisler #girisalan {
	width: 350px;
	margin-right: auto;
	margin-left: auto;
	height: 66px;
	margin-top: 0px;
	overflow: hidden;
}
#alt #girisler #girisalan .yaziyaz {
	background-image: url(images/yazilaralt.png);
	height: 28px;
	width: 251px;
	margin-top: 10px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	color: #DA403E;
	padding-right: 10px;
	padding-left: 10px;
	background-repeat: no-repeat;
	float: left;
	background-color: transparent;
	font-size: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	font-family: 'Open Sans', sans-serif;
}

#alt #girisler #girisalan .girisyap {
	background-image: url(images/girisalta.png);
	height: 48px;
	width: 272px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	color: #FFFFFF;
	background-repeat: no-repeat;
	float: left;
	background-color: transparent;
	font-size: 20px;
	font-family: 'Open Sans', sans-serif;
	padding: 10px;
	margin-top: 7px;
}

#alt #girisler #girisalan .girisyap:hover {
	background-image: url(images/yazilaralt.png);
	cursor: pointer;
	color: #DA403E;
}
</style>
</head>
<body>
    <form id="form1" runat="server">


        <img id="bgimg" src="images/a_bg.png">
<p>&nbsp; </p>
<div id="alt">
  
  <div id="icon">
  <img src="images/icon.png"  width="85" height="122" border="0" style="display:block;   margin-right: auto;
	margin-left: auto" /> <a>YÖNETİCİ PANELİ </a></div>
    
  <div id="girisler">
  <div id="girisalan">
  
    <img src="images/usericon.png" width="66" height="66"  style="float:left; display:block" border="0"/>
       <asp:TextBox ID="txtKadi" runat="server" placeholder="Kullanıcı Adı" CssClass="yaziyaz"> </asp:TextBox>
       </div>
     
    <div id="girisalan">
  
    <img src="images/parolaicon.png" width="66" height="66"  style="float:left; display:block" border="0"/>
        <asp:TextBox ID="txtSifre" runat="server" placeholder="Şifre" TextMode="Password" CssClass="yaziyaz"> </asp:TextBox> </div>
    
      <div id="girisalan">
  
    <img src="images/oke.png" width="66" height="66"  style="float:left; display:block" border="0"/>  
    
     <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" onclick="btnGiris_Click" CssClass="girisyap" />
    
    </div>
     
     
     
     
     
  </div>





</div>



  
    </form>
</body>
</html>
