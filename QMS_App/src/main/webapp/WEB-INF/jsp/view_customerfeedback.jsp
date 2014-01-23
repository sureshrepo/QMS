<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div id="right_content">
	<form name="grid" onSubmit="return validate(this)" action="" method="POST">
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      			 <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add Customers</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewcustomers" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View Customers</span>
				            	</a>
				            </li>
				            <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="addfeedback" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>Add feedback</span>
				            	</a>
				            </li>
				            <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewfeedback" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View feedback</span>
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
			          <h2>View Participants</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Mobile No:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="moblie" class="input_txtbx1" id="moblie"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Group Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="group_name" class="input_txtbx1" id="group_name"></td>
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;City:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="city" id="city" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="button" class="submit_btn" value="Find" name="find" onclick="findpart()"></td>
							  </tr>
							</table>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					         	<td valign="top" align="left" width="20%">Feedback recorded by</td>
								<td valign="top" align="left" width="20%">Feedback details</td>
          						<td valign="top" align="left" width="15%">Attachments</td>
          						<td valign="top" align="left" width="20%">Actions</td>
          						
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		 <tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");"> 
								           	<td valign="top" align="left"  width="10%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
											<td valign="top" align="left" width="10%">${customerFeedbacks.feedback_recorded_by}</td>
											<td valign="top" align="left" width="10%"><a href="download_attachment?fid=<c:out value="${customerFeedbacks.feedback_id}"/>">Download</a></td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.attachments}</td>
									    	<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editfeedback?fid=${customerFeedbacks.feedback_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletefeedbackr?fid=${customersFeedbacks.feedback_id}"/>" onclick="return confirmation()">Remove</a>
											
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