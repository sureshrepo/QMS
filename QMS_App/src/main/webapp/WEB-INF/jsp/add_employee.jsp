<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="addemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add Employees</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewemployees" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View Employees</span>
				            	</a>
				            </li>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Employee</h2>
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
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_title" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
   
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
 
</script>
            
      <jsp:include page="footer.jsp"></jsp:include>
