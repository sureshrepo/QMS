<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="update_corrective">

  <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
  <tr>
  <td>
  <div>
  <ul class="horizmenu">
  <li style=" float:left;margin-right:8px;text-transform:uppercase;">
	<a href="view_correctiveactions" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
	 <span>View Corrective Action </span>
</a>
</li>
</ul>
</div>
</td>
</tr>
<tr>

        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Corrective and Preventive Actions</h2>
            </div>
            <div class="contentbox">
            <table cellpadding="0" cellspacing="0" border="0"
													width="100%">
										<tr>
										<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
												<table cellpadding="0" cellspacing="0" border="0" width="100%" >
												 <c:set value="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions[0]}" var="corrective"> </c:set>
													<tr class="row2">
													<input
															type="hidden" class="input_txtbx1"
															id="inp_nc_id"
															name="nc_id" value="${corrective.nc_id}"/>
														<td valign="middle" align="left" class="input_txt">
															 CAPA Requester:</td>
														<td valign="top" align="left" class="input_txt">
																<input
															type="text" class="input_txtbx1"
															id="inp_capa_requester"
															name="capa_requestor" value="${corrective.capa_requestor }"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span>Request Date :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_external_id"
																name="request_date" value="${corrective.request_date}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.request_date"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row2">
														<td valign="middle" align="left" class="input_txt">
															CAPA Due Date :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_external_id"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="capa_due_date" value="${corrective.capa_due_date}"/><br/>
															
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.capa_due_date"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span> Assigned Team Leader :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_product_id"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');" name="assigned_team_leader" value="${corrective.assigned_team_leader}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.assigned_team_leader"></form:errors>
														</span>
														</td>

													</tr>
													<tr class="row2">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span> Team Members:</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1"
															id="inp_quantity_suspect"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="team_members" value="${corrective.team_members}" /><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.team_members"></form:errors>
														</span>
														</td>
													</tr>

													<tr class="row1">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span> Root Cause analysis file :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1"
															id="inp_nature_of_nonconformance"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="root_cause_analysis_file" value="${corrective.root_cause_analysis_file}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.root_cause_analysis_file"></form:errors>
														</span>
														</td>
													</tr>
												<tr class="row2">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span>Use 5-Why in System :</td>
														<td valign="top" align="left" class="input_txt"><input
																			type="radio" name="use_5_why_in_system" value="0"
																			class="input_txt" checked>Yes&nbsp;&nbsp;&nbsp;<input
																			type="radio" name="use_5_why_in_system" value="1"
																			class="input_txt">No
														</td>

													</tr>
													<tr class="row1">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Why (Memo Field) :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="why" value="${corrective.why}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
								path="CorrectiveAndPreventiveActions.why"></form:errors>
														</span>
														</td>
													</tr>
												
												<!-- </table>
												
												
												
													</td>
												<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
												<table cellpadding="0" cellspacing="0" border="0" width="100%"> -->
													<!-- <tr class="row1">
													<td align="left" valign="top" width="50%"
																style="padding-right: 25px;"> -->
													
												<tr class="row2">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Root Cause Statement :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="root_cause_statement" value="${corrective.root_cause_statement}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.root_cause_statement"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Upload External Analysis :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="upload_external_analysis" value="${corrective.upload_external_analysis}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.upload_external_analysis"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row2">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Action :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="action" value="${corrective.action}" /><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.action"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Responsibility :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="responsibility" value="${corrective.responsibility}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.responsibility"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row2">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Due Date :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="due_date" value="${corrective.due_date}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.due_date"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Completion Date :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="completion_date" value="${corrective.completion_date}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.completion_date"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row2">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Verified by:</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="verified_by" value="${corrective.verified_by}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.verified_by"></form:errors>
														</span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Verification Date:</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="verification_date" value="${corrective.verification_date}"/><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.verification_date"></form:errors>
														</span>
														</td>
													</tr>
													 </tr>
                 <tr >
                  <td valign="top" align="left">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
                </tr>
												</table>
												</td>
												</tr>
												</table>
												</div>
												</div>
												</td>
												</tr>
												</table>
												</form>
												