<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sisteme Giriş !!!</title>
    <!-- Load Javascript -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.query-2.1.7.js"></script>
	<script type="text/javascript" src="js/rainbows.js"></script>
    <script src="js/jquery.validationEngine-tr.js" type="text/javascript"></script>
    <script src="js/jquery.validationEngine.js" type="text/javascript"></script>
	<!-- // Load Javascipt -->

	<!-- Load stylesheets -->
	<link type="text/css" rel="stylesheet" href="css/style.css" media="screen" />
    <link href="css/jquery.validationEngine.css" rel="stylesheet" type="text/css" />
	<!-- // Load stylesheets -->

    <script type="text/javascript">
        $("document").ready(function () {
            $("#form1").validationEngine();
        })

   </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submit1").hover(
	function () {
	    $(this).animate({ "opacity": "0" }, "slow");
	},
	function () {
	    $(this).animate({ "opacity": "1" }, "slow");
	});
        });
    </script>
</head>
<body>
<form id="form1" runat="server">
  <div id="wrapper">
		<div id="wrappertop"></div>
		<div id="wrappermiddle">
			<h2>Hoşgeldiniz</h2>
			<div id="username_input">
				<div id="username_inputleft"></div>
				<div id="username_inputmiddle">
					<%--<input type="text" name="link" id="url" value="Kullanici adiniz" onclick="this.value = ''" />--%>
                    <asp:TextBox ID="url1" CssClass="validate[required]" runat="server"></asp:TextBox>
                    <img id="url_user" src="./images/mailicon.png" alt="" />
				</div>
				<div id="username_inputright"></div>
			</div>
			<div id="password_input">
				<div id="password_inputleft"></div>
				<div id="password_inputmiddle">
					<%--<input type="password" name="link" id="url" value="Password" onclick="this.value = ''" />--%>
                    <asp:TextBox ID="url" runat="server" CssClass="validate[required]" Height="45px" Width="276px" MaxLength="8" 
                        TextMode="Password"></asp:TextBox>
                    <img id="url_password" src="./images/passicon.png" alt="" />
				</div>
				<div id="password_inputright"></div>
			</div>
			<div id="submit">
                <asp:ImageButton ImageUrl="images/submit.png" ID="ImageButton1" runat="server" 
                    onclick="ImageButton1_Click" />
			</div>
			<div id="links_left">
			<a href="#">Şifrenizi mi unuttunuz?</a>
			</div>
		</div>
		<div id="wrapperbottom" align="center">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#CC0000"></asp:Label>
        </div>
	</div>
    </form>
</body>
</html>