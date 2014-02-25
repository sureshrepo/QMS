<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu">
<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Corrective And Preventive Actions</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Corrective And Preventive Actions</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
							</ul>
				            	</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="correctiveactions_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Capa Report </h2>
				</div>
				<div class="contentbox">
					<form method="post" action="capas_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Type Of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio"  name="actions_report_type" value="0" id="id_type_Open_Corrective_Actions" checked/>Open_Corrective_Actions<br/>
								<input type="radio"  name="actions_report_type" value="1" id="id_type_Open_Corrective_Actions_for_Over_30_Days"/>Open_Corrective_Actions_for_Over_30_Days<br/>							
							    <input type="radio"  name="actions_report_type" value="2" id="id_type_Corrective_Actions_for_A_Certain_Period"/>Corrective_Actions_for_A_Certain_Period<br/>
								
							
							
							
							
				<!-- 			
								
							<tr class="row1" id="no_of_days" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Number Of Days:
									</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								
									<input type="text" name="no_of_days" class="input_txtbx1"  style="width:40%;" value=""/>
							</td>
								
							</tr>	 -->
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr>
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="report_title" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
								<tr>
								<td><input type="checkbox" id="select_all"/>Select All</td>
								</tr>
								<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_id" id="id_capa_id"/>Capa id</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="nc_id" id="id_nc_id""/>"Nc id"</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="source_of_nonconformance" id="id_source_of_nonconformance"/>source_of_nonconformance</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="external_id" id="id_external_id"/>external_id</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="type_of_nonconformance" id="id_type_of_nonconformance"/>type_of_nonconformance</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="date_found" id="id_date_found"/>date_found</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox"onclick="selectall(this.id)" name="report_field[]" value="temporary_action" id="id_temporary_action"/>temporary_action</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="nature_of_nc" id="id_nature_of_nc"/>nature_of_nc</td>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_requestor" id="id_capa_requestor"/>capa_requestor</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="request_date" id="id_request_date"/>request_date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="capa_due_date" id="id_capa_due_date"/>capa_due_date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="assigned_team_leader" id="id_assigned_team_leader"/>assigned_team_leader</td>
							</tr>
							<tr> 
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="team_members" id="id_team_members"/>team_members</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="root_cause_analysis_file" id="id_root_cause_analysis_file"/>root_cause_analysis_file</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="use_5_why_in_system" id="id_use_5_why_in_system"/>use_5_why_in_system</td>
							</tr>
							<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="why" id="id_why"/>why</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="root_cause_statement" id="id_root_cause_statement"/>root_cause_statement</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="upload_external_analysis" id="id_upload_external_analysis"/>upload_external_analysis</td>
								</tr>
								<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="action" id="id_action"/>action</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="responsibility" id="id_responsibility"/>responsibility</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="due_date" id="id_due_date"/>due_date</td>
								</tr>
								
							<tr>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="completion_date" id="id_completion_date"/>completion_date</td>
							<td><input type="checkbox" onclick="selectall(this.id)" name="report_field[]" value="verified_by" id="id_verified_by"/>verified_by</td>
							<td><input type="checkbox" name="report_field[]" value="verification_date" id="id_verification_date"/>verification_date</td>
								</tr>
								
								</table>
								
								</td>
								
						
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate Report" class="submit_btn2">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>


<script type="text/javascript">
function toggle2(value){
    var e3=document.getElementById("report_type_table");
if(value=="report_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
</script>

 <script type="text/javascript">
function toggle2(value){
    var e3=document.getElementById("report_type_table");
if(value=="report_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}

$('#select_all').change(function() {
    var checkboxes = $(this).closest('form').find(':checkbox');

    if($(this).is(':checked')) {
        checkboxes.attr('checked','checked');
    } else {
        checkboxes.removeAttr('checked');
    }
   
});

</script>
<script>
		function selectall(id) 
		{
			// var checkboxes1 = $(id).closest('form').find(':checkbox').not($('#select_all'));
		
 if(($('#id').is(':checked')))
	//if(!$(id).closest('form').find(':checkbox').not($('#select_all').is(':checked')))
	
	 {  $("#select_all").attr('checked','checked'); 
		
		//if(!$id.closest('form').find(':checkbox').not($("#select_all")))
			
			
	     
			
	 }
	 else 
	 {$("#select_all").removeAttr('checked');
		 
	 }
	 
		}
		
</script>

  <jsp:include page="footer.jsp"></jsp:include>
  
  
  
  
  
  
