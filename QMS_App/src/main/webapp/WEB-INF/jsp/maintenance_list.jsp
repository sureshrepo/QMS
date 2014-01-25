<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="js/ajaxpaging.js"></script>
<script src="resources/js/jquery_checkbox.js" type="text/javascript"></script>
<div id="right_content">
	
    	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      		 <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add maintenance</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="maintenance_list" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View maintenance</span>
				            	</a>
				            </li>
				             <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="maintenance_report" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>Reports</span>
				            	</a>
				            </li>
  </div>
      		</td>
      		</tr>
			<tr>
			<c:if test="${success==true}">
        <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
            <div id="success_statusbar" class="status success">
            <p class="closestatus"><a title="Close" href="maintenance_list">x</a></p>
            <p><img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
    </c:if>
    </tr>
      		<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>Maintenance List</h2>
			        </div>
			        <div class="contentbox">
			     
			      <form action="maintenance_list" method="POST"> 
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
				     <tr class="title">
							<td valign="top" align="left" width="20%">Equipment Id</td>
							<td valign="top" align="left" width="20%">Equipment Name</td>
							<td valign="top" align="left" width="20%">Equipment Model</td>
							<td valign="top" align="left" width="20%">Acquired Date </td>
							<td valign="top" align="left" width="20%">Actions</td>
							</tr>
							<c:if test="${fn:length(maintenanceForm.maintenance) gt 0}">
        				  <c:forEach items="${maintenanceForm.maintenance}" var="maintenance" varStatus="status">
        				       				<tr class="row1">
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> <a href="view_maintenance?auto_equip=${maintenance.auto_equip}">${maintenance.equipment_id}</a></td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_name}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_model}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.date_acquired}</td>
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_maintenance?auto_equip=${maintenance.auto_equip}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_maintenance?auto_equip=${maintenance.auto_equip}"/>" onclick="return confirmation()">Remove</a>
											</td>
        				       				 </tr>
        				       				 </c:forEach>
        				       				 </c:if>
        				       				  <c:if test="${fn:length(maintenanceForm.maintenance) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    		
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
	var answer = confirm("Are you Sure You Want to Delete  Maintenance & Calibration Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>    				       				