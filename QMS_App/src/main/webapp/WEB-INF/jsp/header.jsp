<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>:: QMS ::</title>
		<script type="text/javascript" src="<c:url value="/resources/js/ddlevelsmenu.js" />"></script> 
		<script type="text/javascript" src="<c:url value="/resources/js/clock.js" />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/inner-clr.css" />"
	rel="stylesheet" type="text/css" />


<style type="text/css">
.ddsubmenustyle,.ddsubmenustyle ul {
	margin: 0;
	padding: 0;
	position: absolute;
	left: 0;
	top: 0;
	list-style-type: none;
	border: 1px solid #444;
	border-bottom: 0;
	visibility: hidden;
	z-index: 100;
	font-size: 13px;
}

.ddsubmenustyle li {
	line-height: 28px;
	font-size: 13px;
}

.ddsubmenustyle li a {
	display: block;
	width: 160px;
	color: #fff;
	text-decoration: none;
	padding: 0 10px;
	background: #0a86af;
	border-bottom: 1px solid #fff;
	font-size: 13px;
}

* html .ddsubmenustyle li { /*IE6 CSS hack*/
	display: inline-block;
	width: 140px; /*width of menu (include side paddings of LI A*/
}

.ddsubmenustyle li a:hover {
	background-color: #eee;
	border-bottom: 1px solid #ccc;
	color: #333333;
}

.downarrowpointer {
	/*CSS for "down" arrow image added to top menu items*/
	padding: 0;
	border: 0;
}

.rightarrowpointer {
	/*CSS for "right" arrow image added to drop down menu items*/
	position: absolute;
	padding-top: 3px;
	left: 100px;
	border: 0;
}

.ddiframeshim {
	position: absolute;
	z-index: 500;
	background: transparent;
	border-width: 0;
	width: 0;
	height: 0;
	display: block;
}
</style>
</head>
<body onload="javascript:startTime();">



	<div id="main">
		<div id="header">
			<div class="logo">
				<a href="#"><img src="<c:url value="/resources/images/Qmslogo.png" />" alt="Company Logo" /></a>
			</div>
			<div class="top_link">
				<table border="0" cellspacing="0" cellpadding="0"
					style="padding: 0;">
					<tr>
						<td rowspan="2" align="right" valign="middle">&nbsp;</td>
						<td align="right" valign="middle"><div class="date">
								<span id="time" class="time"></span>
							</div></td>
					</tr>
					<tr>
						<td align="right" valign="middle"><span class="cart_txt">Welcome
								<sec:authentication property="principal.username" />&nbsp;&nbsp;|&nbsp;&nbsp;<a href="<c:url value="/j_spring_security_logout" />">Logout</a>
						</span></td>
					</tr>
				</table>
			</div>
			
			<div class="clear"></div>
			 <div id="ddtopmenubar">
				<div class="menu_container">
					<div class="menu_l"></div>
					<div class="menu_c">
						<!-- <AJDF:output>php</AJDF:output>
		$obj=new Bin_Query();
		$sql="SELECT previlages FROM admin_log_table WHERE admin_id = '".$_SESSION['admin']['id']."'";
		$obj->executeQuery($sql);
		$rec=$obj->records[0]['previlages'];
		$previ=explode(",",$rec);
	<AJDF:output>/php</AJDF:output>	 Suresh-->
						<!-- <ul class="menu"> -->
						<div>
						  <ul class="menu">
							<li >
							
								<a href="welcome" class="select">
									<span><img src="<c:url value="/resources/images/icon_01.png" />" alt="" style="padding:5px 5px 0 0;" />Dashboard</span>
								</a>
							</li>
							<hr width="90%"/>
				            <li >
				            	<a href="add_maintenance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />Maintenance & Calibration</span>
				            	</a>
				            </li>
				            <hr width="90%"/>
				            <li>
				            	<a href="add_nonconformance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/icon_03.png" />" alt="" style="padding:5px 5px 0 0;" />Non Conformance</span>
				            	</a>
				            </li>
				            <hr width="90%"/>
				            <li>
				            	<a href="addcustomer" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/customer.png" />" alt="" style="padding:5px 5px 0 0;" />Customers</span>
				            	</a>
				            </li>
				            <hr width="90%"/>
				             <li>
				            	<a href="addemployee" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/emploee.png" />" alt="" style="padding:5px 5px 0 0;" />Employees</span>
				            	</a>
				            </li>
				            <hr width="90%"/>
				            <li>
				            	<a href="adddocument" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/document.png" />" alt="" style="padding:5px 5px 0 0;" />Document Control</span>
				            	</a>
				            </li>
				            <hr width="90%"/>
				            <li>
				            	<a href="addinternalaudits" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
				            		<span><img src="<c:url value="/resources/images/document.png" />" alt="" style="padding:5px 5px 0 0;" />Internal Audits</span>
				            	</a>
				            </li>
				            
						</ul>  
						</div>
						<div>
						
						
				            
				          <%-- <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="#" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu2">
				            		<span><img src="<c:url value="/resources/images/icon_03.png" />" alt="" style="padding:5px 5px 0 0;" />Non Conformance</span>
				            	</a>
				            </li>
				            
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="#" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu3">
				            		<span><img src="<c:url value="/resources/images/icon_06.png" />" alt="" style="padding:5px 5px 0 0;" />Customers</span>
				            	</a>
				            </li>
				            
				             <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="#" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu5">
				            		<span><img src="<c:url value="/resources/images/icon_06.png" />" alt="" style="padding:5px 5px 0 0;" />Employees</span>
				            	</a>
				            </li>
				            
				            <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="#" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu4">
				            		<span><img src="<c:url value="/resources/images/icon_07.png" />" alt="" style="padding:5px 5px 0 0;" />Settings</span>
				            	</a>
				            </li> --%>
						</ul>
						</div>
						<div class="clear"></div>
						<script type="text/javascript">
							ddlevelsmenu.setup("ddtopmenubar", "topbar")
						</script>
						<ul id="ddsubmenu1" class="ddsubmenustyle">
							<li ><a href="add_maintenance">Add Maintenance</a></li>
							<li ><a href="maintenance_list">View Maintenance</a></li>
					</ul>
						<ul id="ddsubmenu2" class="ddsubmenustyle">
							<li ><a href="add_nonconformance">Add NonConformance</a></li>
				            <li ><a href="view_nonconformance">View Details</a></li>
				            <li><a href="showaddparticipantgroups">Add Participant Groups</a></li>
							<li><a href="viewparticipantgroups">View Participant Groups</a></li>
						</ul>
						<ul id="ddsubmenu3" class="ddsubmenustyle">
							<li><a href="addcustomer">Add Customer</a></li>        
				            <li><a href="viewcustomers">View Customers</a></li>
				            <li><a href="addfeedback">Add Feedback</a></li>
				             <li><a href="viewfeedback">View Feedbacks</a></li>
				         </ul>
				         <ul id="ddsubmenu5" class="ddsubmenustyle">
							<li><a href="addemployee">Add Employee</a></li>        
				            <li><a href="viewemployees">View Employees</a></li>
				            <li><a href="addfeedback">Add Feedback</a></li>
				             <li><a href="viewfeedback">View Feedbacks</a></li>
				         </ul>
						<ul id="ddsubmenu4" class="ddsubmenustyle">
							<li><a href="textmsgsettings">Text Message API settings</a></li>
							<li><a href="addmailtemplate">Mail Templates</a></li>
							<li><a href="changepassword">Change My Password</a></li>
						</ul>
					</div>
					<div class="menu_r"></div>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
