<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
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
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu=='maintenance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
   </tr></table>

<form method="post" action="maintanence_report">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
 <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Maintanence Report</h2>
            </div>
            <div class="contentbox">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row2">
               <td valign="middle" align="right" class="input_txt" width="25%" > Type of Feedback :</td> 
                <td valign="top" align="left" class="input_txt" width="25%" > 
                  <select name="type_of_report" class="input_cmbbx_big" onchange="show_number_of_days(this.value)">
                  <option value="maintain_for_30">Due Maintenance for next 30 days</option>
                  <option value="maintain_for_ndays">Upcoming Calibration for next xx days</option>
      			     <option value="past_due_maintenance">Past Due Maintenance</option>
      			    <option value="past_due_calibration">Past Due Calibration</option>
      			
      			 
      			 </select>
                  </td>
                 
                   <td valign="middle" style="display:none;" id="get_number_of_days" align="left" class="input_txt" width="50%">Number of days:&nbsp;&nbsp;<input type="text" name="number_of_days" class="input_txtbx1" id="datepicker"  value="${fromdate}" /></td>
               <td valign="middle"  align="left" class="input_txt" width="25%"><input type="submit" value="Generate" class="submit_btn1" id="button"></td>
                    <td valign="middle" align="left" id="temp" class="input_txt" width="25%"></td>
              
                 
             <td></td>
                   </tr>
                  <tr class="row1" >
                  <td valign="middle" align="right" class="input_txt" width="25%"></td>
                  <td valign="middle" align="left" class="input_txt" width="25%"></td>
              <td valign="middle" align="right" class="input_txt" width="25%"></td>
                  <td valign="middle" colspan="2" align="right" class="input_txt" width="50%"></td>                
</tr>
</table>
<c:if test="${report_table=='yes'}">
 <table cellpadding="0" cellspacing="0" border="0" width="100%" id="report_table" >
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
							    	<tr>
							    	<td><h3><a href="./nonconformanceexport">Export</a></h3></td>
							    	</tr>
        				       				 </table></c:if>
        				       				</form>
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				</table>
        				       				
        				       				

</div>
</div>
</td>
</tr>
</table>
</form>
<script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 
</script>

 <script>
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 
</script>
<script type="text/javascript">
$(document).ready(function()
{
    $("#table").hide();
    $("#button").click(function()
    {
        $("#table").show();
    });

});
</script>
<script>
function commit(){         
	 var e = document.getElementById('report_table');
	 e.style.display="block";
	   
}

function show_number_of_days(value){
  //  alert("yes");
    var e = document.getElementById('get_number_of_days');
    var e1 = document.getElementById('temp');
if(value=='maintain_for_ndays')
    {
	e.style.display="block";
	e1.style.display="none";
    }
else
    {
	e.style.display="none";
	e1.style.display="block";
    }
    
}



</script>