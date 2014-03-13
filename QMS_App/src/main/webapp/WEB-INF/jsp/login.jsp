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

	

	<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
		<div id="login_div">
		  <div class="login-top">
		 
		  
		  </div>
		  <div class="login-center">
		  <ul class="login-list">
		  <li  style="background-color:#FFFFD6;"><h3 style="font-family:verdana;background-color:gainsboro;padding:10px;font-weight:bolder;text-align:center;border:solid 1px brown;"><font color="#993300">QMS LOGIN</font></h3>
		  </li>
		  </ul>
		   <c:if test="${not empty error}">
		<div style="color:red;text-align:center;">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			${blank.message}
		</div><br/>
		
	</c:if>
		    <ul class="login-list">
		   <li>
<BR/>
	 <table cellpadding="0" cellspacing="0" border="0" width="300"%>
	 <td>
	
		        <p><font color="#993300">Email-Id&nbsp;&nbsp;&nbsp;:</font></p>
		     </td>
		     
		       <td valign="top" align="left"> <input type="text" class="inputbx1" style="border:solid 1px brown;" name="j_username" value=''>
		       
				<p><font color="#993300"></font></p></td>
		      </table>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td>
		        <p><font color="#993300">Password :</font></p>
		        </td>
		      
		      
		      <td valign="top" align="left"><input type="password"  class="inputbx1" style="border:solid 1px brown;" name="j_password">
					
		      </td>
		      </table>
		      </li>
		      <li>
		      </li>
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td valign="top" align="left">
		      <a href="#">
		        <input type="submit" value="Submit" style="width:70px;height:30px;" name="submit">
		        </a>
		           <a href="reset" align="left"><font color="#993300">&nbsp;&nbsp;&nbsp;&nbsp;Reset</font></a></li>
		   </td></table></li>
		      
		      
		      <li>
		      <table cellpadding="0" cellspacing="0" border="0" width="300">
		      <td valign="top" align="center">
		      <a href="forgot-password"><font color="#993300">Forgot Password</font></a></li>
		      </td>
		      </table>
		    
		    <li>
		    	
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