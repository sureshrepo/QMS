<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
<!-- 	<form name="grid"  action="" method="POST">
 -->    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu=='customer'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
      		</td>
      		</tr>
      		
      		<tr>
				<td valign="top" align="left" style="padding:5px 0 10px 0;">
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
				</td>
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Customers</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomer" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Id:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_id" class="input_txtbox" id="id"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="customer_name" class="input_txtbox" id="name"></td>
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Address:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="address" id="address" class="input_txtbox"></td>
							    <!-- <td align="center" valign="middle" width="38%"><input type="button" class="submit_btn" value="Find" name="find" onclick="findpart()"></td>
							     -->
							      <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Find" name="findcustomer" ></td>
							  	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Clear" name="welcome" ></td>
							  
							  </tr>
							</table>
							</form>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">Customer&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Customer Name</td>
					         	<td valign="top" align="left" width="10%">Website</td>
								<td valign="top" align="left" width="10%">Telephone</td>
          						<td valign="top" align="left" width="15%">Email Address</td>
          						<td valign="top" align="left" width="15%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${customerForm.customers}" var="customers" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%">${customers.customer_id}</td>
											<td valign="top" align="left" width="15%">${customers.customer_name}</td>
											<td valign="top" align="left" width="10%">${customers.website}</td>
											<td valign="top" align="left" width="10%">${customers.telephone}</td>
											<td valign="top" align="left" width="15%">${customers.email_address}</td>
											<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editcustomer?cid=${customers.customer_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletecustomer?cid=${customers.customer_id}"/>" onclick="return confirmation()">Remove</a>
											</td>
										</tr>
							    	</c:forEach>
						    	
						
						
						</table>
					</div>
				</td>
			</tr>
		</table> 

</div>

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
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
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&moblie="+document.getElementById("moblie").value+"&group="+document.getElementById("group").value+"&city="+document.getElementById("city").value;
}
</script>

<jsp:include page="footer.jsp"></jsp:include>