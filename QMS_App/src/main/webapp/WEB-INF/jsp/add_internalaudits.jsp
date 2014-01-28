<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="add_internalaudits">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addinternalaudits" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span> Add Internal Audits</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="view_internalaudits" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View Internal Aidits</span>
				            	</a>
				            </li>
				             <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="internalaudit_report" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>Reports</span>
				            	</a>
				            </li>
				            
				            
  </div>
       </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Internal Audits</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="id" value="<c:out value="${id}"/>"/><c:out value="${id}"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
						         	<td valign="top" align="right" class="input_txt"> Process :</td>
						          <td valign="top" align="left" class="input_txt">
				                  		<select name="process" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                    <option value="process1" >Process1</option>
											<option value="process2">Process2</option>
											<option value="process3">Process3</option>
						           		</select>
						           		<br/><span class="err"><form:errors path="InternalAudits.process"></form:errors></span>
				                   	</td>	
						         </tr> 
								
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit Start Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_start_date" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.audit_start_date}"></c:out>' /><br/><span class="err"><form:errors path="InternalAudits.audit_start_date"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_due_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><br/><span class="err"><form:errors path="InternalAudits.audit_due_date"></form:errors></span></td>
                </tr>
		<tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"> Auditor :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="auditor" class="input_cmbbx1">
						                    <option selected="selected" value="auditor1" >auditor1</option>
											<option value="auditor2">auditor2</option>
											<option value="auditor3">auditor3</option>
						           		</select>
				                   	</td>	
						         </tr> 
								
                      <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditor Notes :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auditor_notes" class="input_txtbx" id="inp_auditor_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="InternalAudits.auditor_notes"></form:errors></span></td>
                </tr>
                 <tr class="row2">
						         	<td valign="middle" align="right" class="input_txt"> Finding :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="finding" class="input_cmbbx1">
						                    <option selected="selected" value="ok" >Ok</option>
											<option value="area of improvement">Area Of Improvement</option>
											<option value="non conformance">Non Conformance</option>
						           		</select>
				                   	</td>	
						         </tr> 
				
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="InternalAudits.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditor's Initials :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auditors_initials" class="input_txtbx" id="inp_auditors_initials" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="InternalAudits.auditors_initials"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditee Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auditee_name" class="input_txtbx" id="inp_auditee_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="InternalAudits.auditee_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="submit" class="submit_btn2" name="submit" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  </tr>
                  
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
      <jsp:include page="footer.jsp"></jsp:include>
