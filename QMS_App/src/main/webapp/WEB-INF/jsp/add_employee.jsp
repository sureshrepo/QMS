<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<!-- Modal -->

<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" url="resources/js/jquery.js" />


<!-- Modal Ends -->

<!-- Ajax -->
<script type="text/javascript">
$(window).load
(
		function()
		{
		$.ajax
		(
		{
			type : "POST", url: "/QMS_App/ajax_getjob",
        success: function(response)
  	      {
    		   $('#job_titles').html(response);
   		  }
		}
		);
}
		);
</script>


<script type="text/javascript">

function doAjaxPost() {
		// get the form values  
		alert("hit");
		var job_id = $('#add_job_id').val();
		var job_title=$('#add_job_title').val();
		var job_desc=$('#add_job_desc').val();
		/*   var education = $('#education').val();	 */		
		$.ajax({
			type : "POST",
			url : "/QMS_App/ajax_addjob",
			data : "job_id=" + job_id +"&job_title="+job_title+"&job_desc="+job_desc,
			success : function(response) {
				// we have the response  
				$('#job_titles').html(response);
			//document.getElementById("newjob").style.display="none";
				//  $('#education').val(''); */
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
</script>
	<!-- End Ajax -->












<form method="post" action="addemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
  <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
						
				           </ul>
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Employee</h2><div id="info"></div>
            </div>
            <div class="contentbox">
            <c:choose>
				<c:when test="${empty employees}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Employee ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><span id="job_titles"></span>&nbsp;&nbsp;<a href="#newjob" data-toggle="modal">Add New Job</a><br/><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   
		</tr>
		
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Working as :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <input type="checkbox" name="process_owner" onchange="toggle2(this)" value="yes" id="id_field_document_id"/>&nbsp;Process Owner                 
                  
                  <label id="process_name_label" style="display:none;">&nbsp;&nbsp;&nbsp;Process Name:</label>
                  <input type="text" name="process_name" id="process_name" style="display: none;" class="input_txtbx1"  onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><br/>
                  <input type="checkbox" name="report_field[]" value="document_id" id="id_field_document_id"/>&nbsp;Document Control<br/><br/>
                  <input type="checkbox" name="report_field[]" value="document_id" id="id_field_document_id"/>&nbsp;Management Representative<br/>
                  
                  
                  
                  <span class="err"><form:errors path="Employee.name"></form:errors></span>
                  
                  </td>
                </tr>
		
		
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> <span class="err">*</span>Date Hired:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_hired" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx" id="inp_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> List of Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Qualified By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="qualified_by" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><%-- <form:errors path="Employee.qualified_by"></form:errors> --%></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Type of Training :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="type_of_training" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.type_of_training"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Effectiveness Notes :</td>
                  <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea></br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                
                
                </tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Employee" class="submit_btn1"></td>
                </tr>
              </table>
              </c:when>
              <c:otherwise>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Employee ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name}" /></br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Job Title :</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_title" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title}" /></br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   
									  </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> <span class="err">*</span>Date Hired:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_hired" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.date_hired}" /></br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx" id="inp_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.attachments}" /></br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> List of Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.list_of_functions_needes}" /></br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Documented In :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.documented_in}" /></br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Qualified By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="qualified_by" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.qualified_by}" /></br><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Type of Training :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="type_of_training" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.type_of_training}" /></br><span class="err"><form:errors path="Employee.type_of_training"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.trainer}" /></br><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_due_date}" /></br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date}" /></br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_review_due_date}" /></br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Training Effectiveness Notes :</td>
                  <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">${employee.training_effectiveness_notes}</textarea></br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                
                
                </tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Employee" class="submit_btn1"></td>
                </tr>
              </table>
              </c:otherwise>
              </c:choose>
              
              
              
              <div id="newjob" class="modal hide fade" style="display: none; " >
              <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal">×</button>
		<h2>Add New Job</h2>
		</div>
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Job ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="add_job_id" id="add_job_id" value="<c:out value="${job_id}"/>"/><c:out value="${job_id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Job Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="add_job_title" id="add_job_title" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name}" /></br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Job Description:</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_description" id="add_job_desc" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title}" /></br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   
									  </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="button" class="submit_btn1" value="Submit" onclick="doAjaxPost()" data-dismiss="modal" /><form:errors path="Employee.date_hired"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"></td>
                </tr>
                </table>
              </div>             
              
              
              
              
              
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
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
               <script>
 $(function() {
           $( "#datepicker2" ).datepicker();
         });
 

 
</script>
               <script>
 $(function() {
           $( "#datepicker3" ).datepicker();
         });
 function toggle2(sender){

	    var e3=document.getElementById("process_name");
	    var e4=document.getElementById("process_name_label");
	    
	    
	e3.style.display=sender.checked?'inline':'none';
	e4.style.display=sender.checked?'inline':'none';
	    
	}
</script>
            
      <jsp:include page="footer.jsp"></jsp:include>
