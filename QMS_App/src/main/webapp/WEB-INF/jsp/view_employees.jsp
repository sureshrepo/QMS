<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
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
			          <h2>View Employees</h2>
			        </div>
		        <div class="contentbox">
							<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findemployee" method="get">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="15%">Type:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="type_of_training" class="input_txtbox" id="type"></td>
							    <td align="left" valign="middle" width="8%">QualifiedBy:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="qualified_by" id="qualifiedby" class="input_txtbox"></td>
								<td align="left" valign="middle" width="10%">Trainer:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="trainer" class="input_txtbox" id="trainer"></td>
							  
	<!-- 						    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
	 -->						  
							    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
							     <td align="center" valign="middle"><input type="reset" class="submit_btn" value="Clear"></td>
							  </tr>
							  </table>
							  </form>
							  </div>
							  
	<!--  		         <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
								<form action="findemployee" method="GET">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="15%">Type:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="type_of_training" class="input_txtbox" ids="type"></td>
							    <td align="left" valign="middle" width="8%">QualifiedBy:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="qualified_by" id="qualifiedby" class="input_txtbox"></td>
							    <td align="left" valign="middle" width="10%">Trainer:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="trainer" class="input_txtbox" id="trainer"></td>
							    
							    <td align="center" valign="middle"><input type="submit" class="submit_btn" value="Find"></td>
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Clear" name="welcome" ></td>
							  	
							  </tr>
							</table>
							
							</form>
						</div>
	 -->			         <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<td valign="top" align="left" width="10%">Employee&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Name</td>
					         	<td valign="top" align="left" width="10%">Job Title</td>
								<td valign="top" align="left" width="10%">Date Hired</td>
          						<td valign="top" align="left" width="15%">Attachments</td>
          						<td valign="top" align="left" width="15%">Actions</td>
          					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${employeeForm.employees}" var="employees" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%"><a href="list_employee?id=${employees.employee_id}">${employees.employee_id}</td>
											<td valign="top" align="left" width="15%">${employees.name}</td>
											<td valign="top" align="left" width="10%">${employees.job_title}</td>
											<td valign="top" align="left" width="10%">${employees.date_hired}</td>
											<td valign="top" align="left" width="15%">${employees.attachments}</td>
												<td valign="top" align="left" width="15%">
												
												
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editemployee?empid=${employees.employee_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deleteemployee?empid=${employees.employee_id}"/>" onclick="return confirmation()">Remove</a>
											
											
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