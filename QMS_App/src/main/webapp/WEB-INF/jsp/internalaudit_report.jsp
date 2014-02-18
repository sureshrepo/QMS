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
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="maintenance_list">x</a>
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
					<h2>Internal Audit Report </h2>
				</div>
				<div class="contentbox">
					<form method="post" action="internal_audit_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="report_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Type Of Report :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" name="audit_report_type" value="0" id="id_type_pastduedate" checked/>Past Due Audits<br/>
								<input type="radio" onchange="toggle4(this.value)" name="audit_report_type" value="1" id="id_type_auditnonconformance"/>Audits with NonConformance<br/>
								
								<input type="radio"  name="audit_report_type" value="2" id="id_type_areaofimprovement"/>Area of Improvements<br/>
								<input type="radio"  name="audit_report_type" value="3" id="id_type_pastduebyauditor"/>Past Due audits by Auditor<br/>
								<input type="radio" name="audit_report_type" value="4" id="id_type_schedule"/>Audit Schedule<br/>
							</td>
							</tr>
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
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="report_id" id="id_report_id"/>ID</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="process" id="id_process"/>Process</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="auditee_name" id="id_auditee_name"/>Auditee Name</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_start_date" id="id_audit_start_date"/>Audit Start Date</td>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_due_date" id="id_audit_due_date"/>Audit Start Date</td>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="auditor" id="id_auditor"/>Auditor</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" onclick="selectall(this.id)"  name="report_field[]" value="audit_notes" id="id_audit_notes"/>Auditor Notes</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="finding" id="id_finding"/>Finding</td>
								<td><input type="checkbox"  onclick="selectall(this.id)" name="report_field[]" value="completion_date" id="id_completion_date"/>Completion Date</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox"  onclick="selectall(this.id)"  name="report_field[]" value="auditors_initial" id="id_auditors_initial"/>Auditor's Initial</td>
							
								</table>
								
								</td>
								
							</tr>
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
function toggle4(value)
{
	var e3=document.getElementById("no_of_days");
	if(value==1)
    {
	
	e3.style.display="table-row";
	
    }
if(value==0)
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

<script>
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
  
  
  
  
  
  