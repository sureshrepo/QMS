<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
</head>
<body>
<div id="right_content">
	 	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
				<td>
				 <div>
  <ul class="horizmenu">
						
								<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Supplier</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
				            </ul>
  </div>
				</td>
				</tr>
				<tr>
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>

	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View SupplierPerformance</h2>
			        </div>
			        <div class="contentbox">
<!-- 			        <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findsupplierperformance" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Id:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="Supplier_id" class="input_txtbx1" id="supplier_id"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Name:</td>
								<td align="left" valign="middle" width="10%"><input type="text" name="supplier_name" id="supplier_name" class="input_txtbx1"></td>							    
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Category:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="category" id="category" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="submit" class="submit_btn" value="Find" name="findsupplierperformance" ></td>
							  </tr>
							  
							</table>
							</form>
						</div> -->

	<form action="?do=viewparticipants" name="dashboard" method="POST">
   				
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">&nbsp;Supplier ID</td>
					         	<td valign="top" align="left" width="10%">Supplier Name</td>
					         	<td valign="top" align="left" width="10%">Category</td>
								<!-- <td valign="top" align="left" width="15%">Address</td>
          						<td valign="top" align="left" width="5%">City</td>
          						<td valign="top" align="left" width="10%">State</td>
          						<td valign="top" align="left" width="20%">Postal Code</td>
          						<td valign="top" align="left" width="5%">Country</td> -->
          						<td valign="top" align="left" width="10%">Website</td>
          						<!-- <td valign="top" align="left" width="30%">Certified to</td> -->
          						<td valign="top" align="left" width="15%">Contact name</td>
          						<!-- <td valign="top" align="left" width="30%">Contact Title</td> -->
          						<td valign="top" align="left" width="15%">Phone</td>
          						<td valign="top" align="left" width="10%">Fax</td>
          						<td valign="top" align="left" width="10%">e_mail address</td>
          						<td valign="top" align="left" width="10%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${supplierPerformanceForm.supplierperformance}" var="supplierperformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="15%">${supplierperformance.supplier_id}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.supplier_name}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.category}</td>
											<%-- <td valign="top" align="left" width="10%">${supplierperformance.address}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.city}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.state}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.postalcode}</td>
											<td valign="top" align="left" width="10%">${supplierperformance.country}</td> --%>
											<td valign="top" align="left" width="15%">${supplierperformance.website}</td>
											<%-- <td valign="top" align="left" width="15%">${supplierperformance.certified_to}</td> --%>
											<td valign="top" align="left" width="15%">${supplierperformance.contact_name}</td>
											<%-- <td valign="top" align="left" width="15%">${supplierperformance.contact_title}</td> --%>
											<td valign="top" align="left" width="15%">${supplierperformance.phone}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.fax}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.email_address}</td>
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a>
											<a href="editsupplierperformance?sid=<c:out value="${supplierperformance.supplier_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a>
											<a href="deletesupplierperformance?sid=<c:out value="${supplierperformance.supplier_id}"/>" style="padding-right:10px;">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	
						
						
						</table>
						</form>
					</div>
				</td>
			</tr>
		</table> 
	
</div>

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?");
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

 function findpart()
{
 alert(document.getElementById("suppliername").value);
 alert(document.getElementById("phone").value);
 alert(document.getElementById("city").value);
window.location="?do=viewsupplierperformance&suppliername="+document.getElementById("suppliername").value+"&phone="+document.getElementById("phone").value+"&city="+document.getElementById("city").value;
}


</script>

<%-- <jsp:include page="footer.jsp"></jsp:include> --%>