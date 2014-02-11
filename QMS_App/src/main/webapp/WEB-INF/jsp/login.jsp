<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Login Page</title> 
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"  type="text/css" />
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"  type="text/css" />
<style>
.errorblock {
	color: #eaeaea;
	background-color: #eaeaea;
	border: 3px solid #eaeaea;
	padding: 8px;
	margin: 16px;
}
</style>
</head>
<body onload='document.f.j_username.focus();'>
	<h3>Login with Username and Password (Custom Page)</h3>

	<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			${blank.message}
		</div><br/>
		
	</c:if>

	<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
		<div id="login_div">
		  <div class="login-top"></div>
		  <div class="login-center">
		  <ul class="login-list">
		  <li  style="background-color:black;"><h1 style="font-family:verdana;font-size:30 px;text-align:center;">QMS LOGIN</h1>
		  </li>
		  </ul>
		    <ul class="login-list">
		   <li>
<BR/>
		        <p>Enter Your Email-Id</p>
		     
		      </li>
		      
		      <li> 
		      <table cellpadding="0" cellspacing="0" border="0" width="350"%>
		       <td valign="top" align="center"> <input type="text" class="inputbx1" name="j_username" value=''>
				<p><font color="Red"></font></p></td>
		      </table>
		      </li>
		      <li>
		        <p>Enter Your Password</p>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="350"%>
		      <td valign="top" align="center"><input type="password" class="inputbx1" name="j_password">
					
		      </td>
		      </table>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="350"%>
		      <td valign="top" align="center">
		      <a href="#">
		        <input type="submit" class="submit_btn" value="submit" name="submit">
		        </a></td></table></li>
		      <li><a href="#" class="forgot-password"></a></li>
		    
		    <li>
		    <table cellpadding="0" cellspacing="0" border="0" width="350"%>
		    <td valign="top" align="center"><input type="reset" align="left" name="reset" width="30%" ></td></table></li>
		    
		      <li>
		      <table cellpadding="0" cellspacing="0" width="100%">
		      <td valign="top" align="middle"> <a href="createuser"><font color="Black"></font>Register</a></td></table></li>
		    </ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>
	</form>
</body>
</html>