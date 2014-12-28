<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_1ghklfiq" %>


<!DOCTYPE html>

<html>
	<head>
		<title>Tops Technology</title>
		<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.min.js"></script>
		 <!-- Custom Theme files -->
		<link href="css/style.css" rel='stylesheet' type='text/css' />
   		 <!-- Custom Theme files -->
		
		 <!---- start-smoth-scrolling---->
       
		<script>
		    $(function () {
		        var pull = $('#pull');
		        menu = $('nav ul');
		        menuHeight = menu.height();
		        $(pull).on('click', function (e) {
		            e.preventDefault();
		            menu.slideToggle();
		        });
		        $(window).resize(function () {
		            var w = $(window).width();
		            if (w > 320 && menu.is(':hidden')) {
		                menu.removeAttr('style');
		            }
		        });
		    });
		</script>



		 <style>
        body {
            
            padding: 0px;
            margin: 0px;
        }
        #mainDiv {
            width:80%;
            color:white;
            border:0px solid black;
            border-radius:10px 10px 10px 10px;
            box-shadow:0px 0px 20px black;
            background-color:gray;
            
        }
        .txt {
            width:300px;
            height:35px;
            border-radius:10px 0px 10px 0px;
            color:black;
        }
        input[type='submit'] {
            color:black;
            width:150px;
            height:35px;
            border-radius:0px 10px 0px 10px;
        }
            input[type='submit']:hover {
                 color:black;
            width:150px;
            height:35px;
            border-radius:0px 10px 0px 10px;
            }
        fieldset {
            padding:2%;
            border:0px;
        }
        legend {
            font-size:x-large;
            color:white;
            text-decoration:none;
            border:0px;
            margin-top:50px;
            text-align:left;
        }
    </style>
	</head>
	<body>
		<!----- start-header---->
			<div id="home" class="header">
					<div class="top-header">
						<div class="container">
						<div class="logo">
							<a href="#"><img src="images/logoTops.png" title="doctor" /></a>
						</div>
						<!----start-top-nav---->
						
						<div class="clearfix"> </div>
					</div>



            

                    
				</div>
			</div>
		            
			<div id="about" class="about">
				<div class="container">
                    <form id="Form1" runat="server">

   
    <div align="center">
        <div  id="mainDiv">
            <fieldset>
                <legend>Login Here...</legend>
                <table>
                    <tr><td colspan="2">
                        <asp:Label Text="text" ID="lblError" Visible="false" ForeColor="Red" runat="server" /></td></tr>
                    <tr>
                        <td>Center ID :</td>
                        <td>
                            <asp:TextBox ID="txtUserName" CssClass="txt" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td>
                            Password :
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" CssClass="txt" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr><td colspan="2">&nbsp;</td></tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="BtnLogin" runat="server" CssClass="btn" Text="Login Me.." OnClick="BtnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="right">
                            <asp:LinkButton ID="LinkButton1" runat="server">Forget password</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </fieldset>

        </div>
    </div>


 

                        </form>
                    </div>
                </div>
			
			    <div class="clearfix"> </div>
			
			<!---- contact ---->
			<div class="clearfix"> </div>
			<!--- copy-right ---->
			<div class="copy-right">
				<center>Copyright reserved by Tops &copy; 2014</center>
				<div class="clearfix"> </div>
			</div>
			<!--- copy-right ---->
	</body>
</html>




