<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<jsp:include page="header.jsp"></jsp:include>
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>


<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Corrective and Preventive Actions</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Corrective and Preventive Actions</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
							</ul>
  </div>
      		</td>
      		</tr>
			<tr>
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="correctiveactions_list">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>
    </tr>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Corrective and Preventive Actions List</h2>
			        </div>
			        <div class="contentbox">
			     <form action="search_correctiveactions" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">CAPA Requester</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="capa_requestor" class="input_txtbx1" id="capa_requestor"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Request date</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="request_date" class="input_txtbx1" id="datepicker"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Actions</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="action" id="action" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  </tr>
							</table>
						</div>
</form>
			      <form action="correctiveactions_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
				     <td valign="top" align="left" width="20%">CAPA ID</td>
							<td valign="top" align="left" width="20%">NC ID</td>
							<td valign="top" align="left" width="20%">CAPA Requester</td>
							<td valign="top" align="left" width="20%">CAPA Due Date</td>
							<td valign="top" align="left" width="20%">File</td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) gt 0}">
        				  <c:forEach items="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions}" var="correctiveAndPreventiveActions" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> <a href="view_correctiveandpreventive?capa_id=${correctiveAndPreventiveActions.capa_id}">${correctiveAndPreventiveActions.capa_id}</a></td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.nc_id}</td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.capa_requestor}</td>
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.capa_due_date}</td>
        				       				<c:choose>
											<c:when test="${correctiveAndPreventiveActions.attachment_name!='null'}">
											<td valign="top" align="center" width="10%"><a href="<c:out value="downloadMaindoc1?capa_id=${correctiveAndPreventiveActions.capa_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
        				       				 <td valign="top" align="left" width="15%">${correctiveAndPreventiveActions.action}</td>

        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_correctiveAndPreventiveActions?capa_id=${correctiveAndPreventiveActions.capa_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_correctiveAndPreventiveActions?capa_id=${correctiveAndPreventiveActions.capa_id}"/>" onclick="return confirmation()">Remove</a>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				  <c:if test="${fn:length(correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Records Found!!!</b></center></td>
							    		
							    	</tr>
							    	</c:if>
        				       				 </table>
        				       				</form>
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				</table>
        				       				</div>
        				       				
        				  
<script language="javascript">

function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete this record?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script> 
 <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>   				       				