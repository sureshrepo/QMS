<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />

<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="updateinternalaudits" method="POST" name="update" id="update">

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
								<c:when test="${menu=='audits'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
							</ul>
				            
  </div>
      </td>
      </tr>
       <!--  <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>-->
      <tr> 
        <td valign="top" align="left">
        	<div class="headings altheading">
	              <h2>Internal Audits</h2>
	            </div>
	            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${internalAuditsForm.internalAudits[0]}" var="internalaudits"></c:set>
            
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="id" value="<c:out value="${internalaudits.id}"/>"/><c:out value="${internalaudits.id}"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
						         	<td valign="top" align="right" class="input_txt"> Process :</td>
						          <td valign="top" align="left" class="input_txt">
				                  		<select name="process" class="input_cmbbx1">
				                  		<option value="">--Select--</option>
						                  <option <c:if test="${internalaudits.process eq 'process1'}"><c:out value="Selected"/></c:if> value="process1" >Process1</option>
											<option <c:if test="${internalaudits.process eq 'process2'}"><c:out value="Selected"/></c:if> value="process2">Process2</option>
											<option  <c:if test="${internalaudits.process eq 'process3'}"><c:out value="Selected"/></c:if> value="process3">Process3</option>
				                   	</select>
						           		<br/><span class="err"><form:errors path="InternalAudits.process"></form:errors></span>
				                   	</td>	
						         </tr> 
			<tr class="row2">
               <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditee Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="auditee_name" class="input_txtbx" id="inp_auditee_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.auditee_name}"></c:out>' /><br/><span class="err"><form:errors path="InternalAudits.auditee_name"></form:errors></span>
                  </td>         		</tr>
                  

								
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit Start Date :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_start_date" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${internalaudits.audit_start_date}"></c:out>' /><br/><span class="err"><form:errors path="InternalAudits.audit_start_date"></form:errors></span></td>
               
   
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Audit Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="audit_due_date" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.audit_due_date}" /><br/><span class="err"><form:errors path="InternalAudits.audit_due_date"></form:errors></span></td>
                </tr>
			<tr class="row1">
							         	<td valign="middle" align="right" class="input_txt"> Auditor :</td>
							           <td valign="top" align="left" class="input_txt">
					                  		<select name="auditor" class="input_cmbbx1">
							                <option value="">--Select--</option>
						                     <option <c:if test="${internalaudits.auditor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >Name1</option>
											<option <c:if test="${internalaudits.auditor eq 'name2'}"><c:out value="Selected"/></c:if> value="name2">Name2</option>
											<option  <c:if test="${internalaudits.auditor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">Name3</option>
				                   	</select>
				                   	<br/><span class="err"><form:errors path="InternalAudits.auditor"></form:errors></span>
					                   	</td>	
							         </tr> 
						         </table>
						         </td>
						         <td align="left" valign="top">
 <table cellpadding="0" cellspacing="0" border="0" width="100%">
								
                      <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditor Notes :</td>
                                
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="auditor_notes"  style="width:70%; height: 70px;">${internalaudits.auditor_notes}</textarea><span class="err"><form:errors path="InternalAudits.auditor_notes"></form:errors></span></td>
                </tr>
                 <tr class="row1">
						         	<td valign="middle" align="right" class="input_txt"> Finding :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="finding" class="input_cmbbx1">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${internalaudits.finding eq 'ok'}"><c:out value="Selected"/></c:if> value="ok" >Ok</option>
											<option <c:if test="${internalaudits.finding eq 'area of improvement'}"><c:out value="Selected"/></c:if> value="area of improvement">Area Of Improvement </option>
											<option  <c:if test="${internalaudits.finding eq 'nonconformance'}"><c:out value="Selected"/></c:if> value="nonconformance">NonConformance</option>
				                 </select>
				                 <br/><span class="err"><form:errors path="InternalAudits.finding"></form:errors></span>
				                 
				                   	</td>	
						         </tr> 
				
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.completion_date}" /><span class="err"><form:errors path="InternalAudits.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Auditor's Initials :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="auditors_initials" class="input_txtbx" id="inp_auditors_initials" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${internalaudits.auditors_initials}" /><span class="err"><form:errors path="InternalAudits.auditors_initials"></form:errors></span></td>
                </tr>
               
                 
                  </table>
                
                  <table align="center" width="100%">
                  <tr >
                  
                  <td valign="top" align="center"></td>
				  <td valign="top" align="center"><input type="submit" class="submit_btn2" value="Submit" class="submit_btn1">
				 </td>
                  </tr>
                  </table>
                  </table>
                  </div>
	            
                      	</td>
  		</tr>
 	</table>
</form>
</div>
 <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
   <script>
 $(function() {
           $( "#datepicker" ).datepicker({dateFormat: 'yy-mm-dd'});
         });
 
</script>
   <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
     
         });
 
</script>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>