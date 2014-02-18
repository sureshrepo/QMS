<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <c:set value="${internalAuditsForm.internalAudits[0]}" var="internalaudits"></c:set>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="100%" style="padding-right:25px;">
    					<h2 class="quck-txt">Quick Info</h2>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        		<tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> ID :</td>
				                  <td valign="top" align="left" class="input_txt">
				                 
				                 <input type="hidden" name="id" value="<c:out value="${internalaudits.id}"/>"/><c:out value="${internalaudits.id}"/>
				                   	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"> Process :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="process" class="input_cmbbx1">
						                    <option <c:if test="${internalaudits.process eq 'process1'}"><c:out value="Selected"/></c:if> value="process1" >Process1</option>
											<option <c:if test="${internalaudits.process eq 'process2'}"><c:out value="Selected"/></c:if> value="process2">Process2</option>
											<option  <c:if test="${internalaudits.process eq 'process3'}"><c:out value="Selected"/></c:if> value="process3">Process3</option>
				                   	
				                   		</select>
				                   	</td>	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="left" class="input_txt">Audit Start Date :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" value="<c:out value="${internalaudits.audit_start_date}"/>"  class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="audit_start_date" /></br><span class="err"><form:errors path="InternalAudits.audit_start_date"></form:errors></span></td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"> Audit Due Date :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" value="<c:out value="${internalaudits.audit_due_date}"/>"  class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="audit_due_date" /></br><span class="err"><form:errors path="InternalAudits.audit_due_date"></form:errors></span></td>
				                </tr> 
				                  <tr class="row1">
						         	<td valign="middle" align="left" class="input_txt"> Auditor :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="auditor" class="input_cmbbx1">
						                    <option <c:if test="${internalaudits.auditor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >Name1</option>
											<option <c:if test="${internalaudits.auditor eq 'name2'}"><c:out value="Selected"/></c:if> value="name2">Name2</option>
											<option  <c:if test="${internalaudits.auditor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">Name3</option>
				                   	
				                   		</select>
				                   	</td>	</br><font color="Red" size="+1"></font></td>
						         </tr> 
				       <tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"> Audit Notes :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  	<input type="text" value="<c:out value="${internalaudits.auditor_notes}"/>"  class="input_txtbx1" id="inp_auditor_notes" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="auditor_notes" /></br><span class="err"><form:errors path="InternalAudits.auditor_notes"></form:errors></span></td>
				                </tr>
				                <tr class="row1">
						         	<td valign="middle" align="centre" class="input_txt"> Finding :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="finding" class="input_cmbbx1">
						                    <option <c:if test="${internalaudits.finding eq 'ok'}"><c:out value="Selected"/></c:if> value="ok" >Ok</option>
											<option <c:if test="${internalaudits.finding eq 'area of improvement'}"><c:out value="Selected"/></c:if> value="area of improvement">Area Of Improvement </option>
											<option  <c:if test="${internalaudits.finding eq 'non conformance'}"><c:out value="Selected"/></c:if> value="non conformance">NonConformance</option>
				                   	
				                   		</select>
				                   	</td>	</br><font color="Red" size="+1"></font></td>
						         </tr> 
				              
			            	<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"> Completion Date:</td>
			                                	<td valign="top" align="left" class="input_txt"><input type="text" value="${internalaudits.completion_date}" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="completion_date" /></br><span class="err"><form:errors path="InternalAudits.completion_date"></form:errors></span></td>
				      </tr>
			          		<tr class="row2">
			                  <td valign="top" align="left" class="input_txt">Auditors Initials:</td>
			                             	<td valign="top" align="left" class="input_txt"><input type="text" value="${internalaudits.auditors_initials}" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="auditors_initials" /></br><span class="err"><form:errors path="InternalAudits.auditors_initials"></form:errors></span></td>
				        </tr>
			        		<tr class="row1">
			                  <td valign="top" align="left" class="input_txt">Auditee Name:</td>
			                            	<td valign="top" align="left" class="input_txt"><input type="text" value="${internalaudits.auditee_name}" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="auditee_name" /></br><span class="err"><form:errors path="InternalAudits.auditee_name"></form:errors></span></td>
				          </tr>
			         	</table>
			    	</td>
              	</tr>
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Update Participant" onclick="update.submit()"></td>
                </tr>
              </table></div>
         	</td>
  		</tr>
 	</table>
</form>
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>