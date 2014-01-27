<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
<tr>
<td>
 <div>
  <ul class="horizmenu">
  <li style=" float:left;margin-right:8px;text-transform:uppercase;">
	<a href="view_correctiveactions" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
	 <span>View Corrective Action </span>
</a>
</li>
</ul>
</div>
</td>
</tr>
<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>View Corrective Actions</h2>
						</div>
						
						<div class="contentbox">
						<form action="view_correctiveactions" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="20%">CAPA Requester</td>
							<td valign="top" align="left" width="20%">Request Date</td>
							<td valign="top" align="left" width="20%">CAPA Due Date</td>
							<td valign="top" align="left" width="10%">Due Date </td>
							<td valign="top" align="left" width="20%">Completion Date</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							 <c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) gt 0}">
        				  <c:forEach items="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions}" var="corrective" varStatus="status">
        				       				<tr class="row1">
        				       				<td valign="top" align="left"  width="10%">${corrective.capa_requestor}</td>
											<td valign="top" align="left" width="10%">${corrective.request_date}</td>
											<td valign="top" align="left" width="10%">${corrective.capa_due_date}</td>
											<td valign="top" align="left" width="15%">${corrective.due_date}</td>
											<td valign="top" align="left" width="10%">${corrective.completion_date}</td>
											<td valign="top" align="left" width="10%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_correctiveactions?nc_id=${corrective.nc_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_correctiveactions?id=${corrective.capa_id }"/>" onclick="return confirmation()">Remove</a>
											</td>
											</tr>
											</c:forEach>
											</c:if>
											<c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    	</tr>
							    	</c:if> 
							    	</table>
							    	</form>
							    	</div>
							    	</div>
							    	</td>
							    	</tr>
							    	</table>
							    	</div>
							    
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Corrective and Preventive Actions Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>  