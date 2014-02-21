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
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Maintenance</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu=='maintenance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
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
		<form action="search_maintenance" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="5%">ID : </td>
							    <td align="left" valign="middle" width="5%"><input type="text" name="equipment_id" class="input_txtbx2" id="equipment_id"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Equipment Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="equipment_name" class="input_txtbx2" id="equipment_name"></td>
							    <td align="left" valign="middle" width="5%">&nbsp;Date:</td>
							    <td align="left" valign="middle" width="5%"><input type="text" name="date_acquired" id="date_acquired" class="input_txtbx2"></td>
							   	<td align="center" valign="middle">
							  	<input type="submit" class="submit_btn" value="Find" id="id_submit" name="search_maintenance"/></td>
							 	<td align="center" valign="middle">
							  <input type="button" class="submit_btn" name="clear" id="id_clear" value="clear">
							  </tr>
							</table>
						</div>
</form>
			     
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
        				       				
        				       				
        				       				 <td valign="top" align="left"  width="10%"> <a href="view_maintenance?equipment_id=${maintenance.equipment_id}">${maintenance.equipment_id}</a></td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_name}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.equipment_model}</td>
        				       				 <td valign="top" align="left" width="15%">${maintenance.date_acquired}</td>
        				       					<td valign="top" align="left">
												<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="edit_maintenance?equipment_id=${maintenance.equipment_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_maintenance?equipment_id=${maintenance.equipment_id}"/>" onclick="return confirmation()">Remove</a>
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
<script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
   </script>  				       				