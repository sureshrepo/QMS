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
		  <li  style="background-color:#FFFFD6;"><h3 style="font-family:verdana;font-size:100px;text-align:center;"><font color="#993300">QMS LOGIN</font></h3>
		  </li>
		  </ul>
		    <ul class="login-list">
		   <li>
<BR/>
		        <p><font color="#993300">Enter Your Email-Id</font></p>
		     
		      </li>
		      
		      <li> 
		      <table cellpadding="0" cellspacing="0" border="0" width="200"%>
		       <td valign="top" align="center"> <input type="text" class="inputbx1" name="j_username" value=''>
				<p><font color="#993300"></font></p></td>
		      </table>
		      </li>
		      <li>
		        <p><font color="#993300">Enter Your Password</font></p>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="200">
		      <td valign="top" align="center"><input type="password" class="inputbx1" name="j_password">
					
		      </td>
		      </table>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="200">
		      <td valign="top" align="center">
		      <a href="#">
		        <input type="submit" class="submit_btn" value="submit" name="submit">
		        </a></td></table></li>
		      
		      
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="200">
		      <td valign="top" align="center">
		      <a href="forgot-password"><font color="#993300">forgot-password</font></a></li>
		      </td>
		      </table>
		    
		    <li>
		    <table cellpadding="0" cellspacing="0" border="0" width="200">
		    <td valign="top" align="center"><input type="reset" align="left" name="reset" width="150" ></td></table></li>
		    		
		      <li>
		      <table cellpadding="0" cellspacing="0" width="100%">
		      <td valign="top" align="middle"> <a href="createuser"><font color="#993300">Register</font></a></td></table></li>
		    </ul>
		  </div>
		  <div class="login-bottom"></div>
		</div>
	</form>
</body>
</html>