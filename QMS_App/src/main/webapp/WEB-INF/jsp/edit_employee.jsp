<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updateemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
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
            <c:set value="${employeeForm.employees[0]}" var="employee"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Employee ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="employee_id" value="<c:out value="${employee.employee_id }"/>"/><c:out value="${employee.employee_id }"/><br/><span class="err"></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Qualified By:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="qualified_by" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.qualified_by }" /><br><span class="err"><form:errors path="Employee.qualified_by"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name }" /><br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Type:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="type_of_training" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.type_of_training}" /><br><span class="err"><form:errors path="Employee.type_of_training"></form:errors></span></td>
                
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Job Title</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_title" class="input_txtbx" id="inp_job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title }" /><br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
                
               	<td><textarea class="input_txtbx1" id="inp_job_title" name="job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">
						${employee.job_title}</textarea><br/><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
				<td valign="middle" align="right" class="input_txt" width="30%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.trainer }" /><br><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">Date Hired</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_hired" class="input_txtbx" id="inp_date_of_hired" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.date_hired }" /><br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx" id="inp_telephone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_due_date }" /><br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Attachments</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx" id="inp_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.attachments}" /><br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date }" /><br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">List of Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.list_of_functions_needes}" /><br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_review_due_date }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Documented In:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.documented_in}" /><br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Training Effectiveness Notes:</td>
                 <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea><br><span class="err"><form:errors path="employee.training_effectiveness_notes"></form:errors></span></td>
                 
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_notes" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_notes }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                </tr>    
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Employee" class="submit_btn2"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
      <jsp:include page="footer.jsp"></jsp:include>
 --%>
 
 
 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updateemployee">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu=='employee'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='employees'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Employee Report</span>
									
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
            <c:set value="${employeeForm.employees[0]}" var="employee"/>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span><label>Employee ID:</label></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="employee_id" value="<c:out value="${employee.employee_id }"/>"/><c:out value="${employee.employee_id }"/><br/><span class="err"></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Qualified By:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="qualified_by" class="input_txtbx" id="inp_qualified_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.qualified_by }" /><br><span class="err"><form:errors path="Employee.qualified_by"></form:errors> </span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="name" class="input_txtbx" id="inp_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.name }" /><br><span class="err"><form:errors path="Employee.name"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Type:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="type_of_training" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.type_of_training}" /><br><span class="err"><form:errors path="Employee.type_of_training"></form:errors></span></td>
                
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Job Title</td>
               	<td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="job_title" class="input_txtbx" id="inp_job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.job_title }" /><br><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
               <%--  
               	<td><textarea class="input_txtbx1" id="inp_job_title" name="job_title" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">
						${employee.job_title}</textarea><br/><span class="err"><form:errors path="Employee.job_title"></form:errors></span></td>
				 --%><td valign="middle" align="right" class="input_txt" width="30%"> Trainer :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="trainer" class="input_txtbx" id="inp_trainer" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.trainer }" /><br><span class="err"><form:errors path="Employee.trainer"></form:errors></span></td>
                </tr>
                
				<tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">Date Hired</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_hired" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.date_hired }" /><br><span class="err"><form:errors path="Employee.date_hired"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_due_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_due_date }" /><br><span class="err"><form:errors path="Employee.training_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Attachments</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx" id="inp_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.attachments}" /><br><span class="err"><form:errors path="Employee.attachments"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_completion_date }" /><br><span class="err"><form:errors path="Employee.training_completion_date"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Process:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process" class="input_txtbx" id="inp_process" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process}" /><br><span class="err"><form:errors path="Employee.process"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Process Name</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="process_name" class="input_txtbx" id="inp_process_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.process_name}" /><br><span class="err"><form:errors path="Employee.process_name"></form:errors></span></td>
                
                </tr>
                
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Document Control:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="doc_control" class="input_txtbx" id="inp_doc_control" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.doc_control}" /><br><span class="err"><form:errors path="Employee.doc_control"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Management Rep:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="management_rep" class="input_txtbx" id="inp_management_rep" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.management_rep}" /><br><span class="err"><form:errors path="Employee.management_rep"></form:errors></span></td>
                
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%">List of Functions Needs:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="list_of_functions_needes" class="input_txtbx" id="inp_list_of_functions_needes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.list_of_functions_needes}" /><br><span class="err"><form:errors path="Employee.list_of_functions_needes"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Training Effective Review Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_review_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_review_due_date }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_review_due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Documented In:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="documented_in" class="input_txtbx" id="inp_documented_in" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.documented_in}" /><br><span class="err"><form:errors path="Employee.documented_in"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Training Effectiveness Notes:</td>
                 <td><textarea class="input_txtbx1" id="inp_job_title" name="training_effectiveness_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"><c:out value="${employee.training_effectiveness_notes  }"/> </textarea><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>

                 <%--  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="training_effectiveness_notes" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${employee.training_effectiveness_notes }" /><br><span class="err"><form:errors path="Employee.training_effectiveness_notes"></form:errors></span></td>
                 --%></tr>    
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Employee" class="submit_btn2"></td>
                </tr>
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>


 <script>
   $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker" ).datepicker();
	           
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
	           $( "#datepicker1" ).datepicker();
	         });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker2" ).datepicker();
       });
	 
	 $(function() {
		 var format="yy-mm-dd";
         $( "#datepicker3" ).datepicker();
       });
      <jsp:include page="footer.jsp"></jsp:include>
 