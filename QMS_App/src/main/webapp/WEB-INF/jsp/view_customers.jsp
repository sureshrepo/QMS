<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<script type="text/javascript" src="js/ajaxpaging.js"></script>

<div id="right_content">
	<form name="grid"  action="" method="POST">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
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
			          <h2>View Participants</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Mobile No:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="moblie" class="input_txtbx1" id="moblie"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Group Name:</td>
							    <td align="left" valign="middle" width="10%"><AJDF:output>$group</AJDF:output></td>
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;City:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="city" id="city" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="button" class="submit_btn" value="Find" name="find" onclick="findpart()"></td>
							  </tr>
							</table>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td>
         						<td valign="top" align="left" width="10%">Customer&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Customer Name</td>
					         	<td valign="top" align="left" width="10%">Website</td>
								<td valign="top" align="left" width="10%">Telephone</td>
          						<td valign="top" align="left" width="15%">Fax</td>
          						<td valign="top" align="left" width="25%">Email Address</td>
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
											<td valign="top" align="left" width="15%">${customers.fax}</td>
											<td valign="top" align="left" width="15%">${customers.email_address}</td>
											<td valign="top" align="left" width="15%">
											<a href="editcustomer?cid=<c:out value="${customers.customer_id}"/>">Edit</a>
											<a href="deletecustomer?cid=<c:out value="${customers.customer_id}"/>">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	
						
						
						</table>
					</div>
				</td>
			</tr>
		</table> 
	</form>
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