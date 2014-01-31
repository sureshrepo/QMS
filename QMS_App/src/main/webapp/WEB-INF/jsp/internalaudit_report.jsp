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
								<a href="addinternalaudits" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Internal Audits</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_internalaudits" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu=='audits'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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


<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
 <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Maintanence Report</h2>
            </div>
            <div class="contentbox">
            <form method="post" action="internalaudit_report">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row2">
               <td valign="middle" align="right" class="input_txt" width="25%" > Type of Report :</td> 
                <td valign="top" align="left" class="input_txt" width="25%" > 
                  <select name="type_of_report" class="input_cmbbx_big" onchange="show_number_of_days(this.value)">
                  <option value="past_due_audits">Past Due Audits</option>
                  <option value="audits_with_nonconformance">Audits with NonConformance</option>
      			     <option value="area_of_improvements">Area of Improvements</option>
      			    <option value="past_due_audits_by_auditor">Past Due audits by Auditor</option>
      			 <option value="audit_schedule">Audit Schedule</option>
      			 
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
</form>
<c:if test="${report_table=='yes'}">
 <table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="10%">Audit Id</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="15%">Audit Due Date</td>
									<td valign="top" align="left" width="15%">Audit Start Date</td>
									<td valign="top" align="left" width="10%">Auditor</td>									
									<td valign="top" align="left" width="15%">Finding</td>
									<td valign="top" align="left" width="15%">Completion Date</td>
									<!-- <td valign="top" align="left" width="10%">Actions</td> -->
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${internalAuditsForm.internalAudits}" var="internalAudits" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>">
								           	<td valign="top" align="left"  width="10%">${internalAudits.id}</td>
											<td valign="top" align="left" width="10%">${internalAudits.process}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_due_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_start_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.auditor}</td>
											<td valign="top" align="left" width="15%">${internalAudits.finding}</td>
											<td valign="top" align="left" width="15%">${internalAudits.completion_date}</td>
											<%-- <td valign="top" align="left" width="15%">
											<a href="edit_internalaudit?id=<c:out value="${internalAudits.id}"/>">Edit</a>
											<a href="delete_internalaudit?id=<c:out value="${internalAudits.id}"/>">Delete</a>
										</td> --%>
										</tr>
							    	</c:forEach>
						    	

								<tr><td colspan="8" >  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"><h3><a href="./export?type=${type}">Export</a></h3></li>
                					</ul></div></td></tr>

							<%-- 
        				       				  <c:if test="${fn:length(maintenanceForm.maintenance) == 0}">	
							    	<tr class="row1">
							    	<td colspan="7" width="100%"><center><b>No Participants Found!!!</b></center></td>
							    		
							    	</tr>
							    	</c:if> --%>
        				       				 </table></c:if>
        				       			
        				       				</div>
        				       				</td>
        				       				</tr>
        				       				</table>
        				       				
        				       				

</div>
</div>
</td>
</tr>
</table>
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