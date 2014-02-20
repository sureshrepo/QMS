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
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Document</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Document</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Document report</span>
									
								</a>
							</li>
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
      		</td>
      		</tr>
      		<c:if test="${success=='true' }">
      		<tr>
	        	<td valign="top" align="left">
					<div class="status success">
			            <p class="closestatus"><a title="Close" href="viewdocuments">x</a></p>
			            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span><c:out value="${success_message}"/></span></p>
			          </div>
				</td>
      		</tr>
      		</c:if>
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
			          <h2>View Documents</h2>
			        </div>
			        <div class="contentbox">
						<form action="findDocument" method="get">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Document ID:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="search_document_id" class="input_txtbx1" id="moblie"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;&nbsp;&nbsp;Document Title:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="search_document_title" class="input_txtbx1" id="moblie"></td>
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Process:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="search_process" id="search_process" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%"><input type="submit" value="Find" class="submit_btn"  onclick="findpart()"></td>
							    <td align="center" valign="middle" width="38%"><input type="button" value="Clear" class="submit_btn"></td>
							  </tr>
							</table>
							
						</div></form>
						<form name="grid"  action="" method="POST">
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">Document&nbsp;ID</td>
					         	<td valign="top" align="left" width="15%">Document Title</td>
					         	<td valign="top" align="left" width="15%">Document Type</td>
								<td valign="top" align="left" width="10%">Location</td>
          						<td valign="top" align="left" width="10%">Process</td>
          						<td valign="top" align="center" width="10%">Document</td>
          						<td valign="top" align="center" width="15%">External Documents</td>
          						<td valign="top" align="center" width="15%">Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${documentMainForm.documentMains}" var="documentMains" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="10%"><a href="list_document?id=${documentMains.document_id}">${documentMains.document_id}</a></td>
											<td valign="top" align="left" width="15%">${documentMains.document_title}</td>
											<td valign="top" align="left" width="15%">${documentMains.document_type}</td>
											<td valign="top" align="left" width="10%">${documentMains.location}</td>
											<td valign="top" align="left" width="10%">${documentMains.process}</td>
											
											<c:choose>
											<c:when test="${documentMains.location=='Nil'}">
											<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc?id=${documentMains.document_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
											<td valign="top" align="center" width="15%">
											<c:choose>
											<c:when test="${documentMains.external=='1'}">
											<c:out value="Yes"></c:out>
											</c:when>	
											<c:otherwise>
											<c:out value="No"></c:out>
											</c:otherwise>							
											</c:choose>
											</td>
											<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_document?doc_id=${documentMains.document_id}"></c:out>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletedocument?doc_id=${documentMains.document_id}"></c:out>">Remove</a>
											</td>
										</tr>
							    	</c:forEach>
						    	
						
						
						</table></form>
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