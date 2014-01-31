<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-1.7.2.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/popover.js"></script>
<script src="resources/js/transition.js"></script>
<div id="right_content">
	<form action="add_nonconformance" method="POST" name="update"
		id="update">

		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
			<tr>
				<td>
					<div>
						<ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose>
								<c:when test="${menu=='nonconformance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Nonconformance</span>
									
								</a>
							</li>

							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_nonconformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Nonconformance</span>
									
								</a>
							</li>
						</ul>
					</div></td>
			</tr>
			<tr>
				<!--  <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
      <tr> -->
				<td valign="top" align="left">
						<div class="headings altheading">
							<h2>Non Conformance</h2>
						</div>
						           <div class="contentbox">
				
															

	<table cellpadding="0" cellspacing="0" border="0" width="100%">
														<tr>
															<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
																<h2 class="quck-txt">Quick Info</h2>
																<table cellpadding="0" cellspacing="0" border="0"
																	width="100%">
																	<tr class="row1">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span> ID :</td>
																		<td valign="top" align="left" class="input_txt">

																			<input type="hidden" name="id"
																			value="<c:out value="${id }"/>" />
																		<c:out value="${id}" /> <br/>
																		<font color="Red" size="+1"></font></td>
																	</tr>

																	<tr class="row2">
																		<td valign="middle" align="left" class="input_txt">
																			Source of Non Conformance :</td>
																		<td valign="top" align="left" class="input_txt">
																			<select name="source_of_nonconformance"
																			class="input_cmbbx1">
																				<option selected="selected" value="Internal Audit">Internal
																					Audit</option>
																				<option value="Customer Audit">Customer
																					Audit</option>
																				<option value="Third Party Audit">Third
																					Party Audit</option>
																				<option value="Incoming Inspection">Incoming
																					Inspection</option>
																				<option value="Customer Complaint">Customer
																					Complaint</option>

																		</select>
																		<br/>
																		<font color="Red" size="+1"></font>
																		</td>
																	</tr>
																	<tr class="row1">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>External ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="external_id"
																			value="${nonconformance.external_id}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.external_id"></form:errors>
																		</span>
																		</td>
																	</tr>
																	<tr class="row2">
																		<td valign="middle" align="left" class="input_txt">
																			Type of NonConformance :</td>
																		<td valign="top" align="left" class="input_txt">
																			<select name="type_of_nonconformance"
																			class="input_cmbbx1">
																				<option selected="selected" value="Product Quality">Product
																					Quality</option>
																				<option value="Service Quality">Service
																					Quality</option>
																				<option value="Late Delivery">Late Delivery</option>
																				<option value="Early Delivery">Early
																					Delivery</option>

																		</select></td>
																	</tr>
																	<tr class="row1">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span> Product ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_product_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="product_id"
																			value="${nonconformance.product_id}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.product_id"></form:errors>
																		</span>
																		</td>

																	</tr>
																	<tr class="row2">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span> Quantity Suspect :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1"
																			id="inp_quantity_suspect"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="quantity_suspect"
																			value="${nonconformance.quantity_suspect}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.quantity_suspect"></form:errors>
																		</span>
																		</td>
																	</tr>

																	<tr class="row1">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span> Nature of Non conformance :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1"
																			id="inp_nature_of_nonconformance"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="nature_of_nonconformance"
																			value="${nonconformance.nature_of_nonconformance}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.nature_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	</tr>
																	<tr class="row2">
																		<td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span> Date Found :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="date_found" value="${nonconformance.date_found}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.date_found"></form:errors>
																		</span>
																		</td>

																	</tr>
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt"><span
																			class="err">*</span>Reported By :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_reported_by"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="reported_by"
																			value="${nonconformance.reported_by}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.reported_by"></form:errors>
																		</span>
																		</td>
																	</tr>

																</table>
															</td>
															<td align="left" valign="top">
																
																<table cellpadding="0" cellspacing="0" border="0"
																	width="100%">
																	<h2 class="quck-txt"></h2>
																	<tr></tr>
																	<br/>
																	<tr class="row1">
																	<td colspan="2"></td></tr>
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt"><span
																			class="err">*</span>Temporary
																			Action(Memo):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1"
																			id="inp_temporary_action"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="temporary_action"
																			value="${nonconformance.temporary_action}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.temporary_action"></form:errors>
																		</span>
																		
																		<font color="Red" size="+1"></font>
																		</td>
																	</tr>
																	<tr class="row2">
																	<td valign="middle" align="left" class="input_txt">Corrective
															Action Required:</td>
														<td valign="top" align="left" class="input_txt"><input
															type="radio" name="corrective_action_required" value="1"
															class="input_txt" onchange="toggle2(this.value)">Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="corrective_action_required" value="0"
															class="input_txt" checked onchange="toggle2(this.value)">No
												
																			</tr>
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt">
																			Disposition Required:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="radio" name="disposition_required" value="0"
																			class="input_txt" checked>Yes&nbsp;&nbsp;&nbsp;<input
																			type="radio" name="disposition_required" value="1"
																			class="input_txt">No</td>
																	</tr>
																	<tr class="row2">
																		<td valign="middle" align="left" class="input_txt">
																			Disposition :</td>
																		<td valign="top" align="left" class="input_txt">
																			<select name="disposition" class="input_cmbbx1">
																				<option selected="selected" value="Product Quality">Discard</option>
																				<option value="Service Quality">Keep as is</option>
																		</select></td>
																	</tr>
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt"><span
																			class="err">*</span> Disposition Complete Date:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="datepicker1"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="disposition_complete_date"
																			value="${nonconformance.disposition_complete_date}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.disposition_complete_date"></form:errors>
																		</span>
																		</td>
																	</tr>
																	<tr class="row2">
																		<td valign="top" align="left" class="input_txt"><span
																			class="err">*</span> Name of Disposition
																			Responsibility:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="name_of_disposition_responsibility"
																			value="${nonconformance.name_of_disposition_responsibility}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.name_of_disposition_responsibility"></form:errors>
																		</span>
																		</td>
																	</tr>
																	<tr class="row1">
																		<td valign="top" align="left" class="input_txt"><span
																			class="err">*</span> Cost of NonConformance:</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="cost_of_nonconformance"
																			value="${nonconformance.cost_of_nonconformance}" /><br/>
																		<font color="Red" size="+1"></font><span class="err"><form:errors
																					path="Nonconformance.cost_of_nonconformance"></form:errors>
																		</span>
																		</td>
																	</tr>
																</table></td>
														</tr>
														<tr class="row1">
														<td colspan="2">
														<div id="corrective_div" style="display: none;">

										<div class="quck-txt">
											
											Corrective Action Details
										</div>
										<table cellpadding="0" cellspacing="0" border="0"
													width="100%">
										<tr>
										<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
												<table cellpadding="0" cellspacing="0" border="0" width="100%" >
													<tr class="row2">
														<td valign="middle" align="left" class="input_txt">
															 CAPA Requester:</td>
														<td valign="top" align="left" class="input_txt">
																<input
															type="text" class="input_txtbx1"
															id="inp_capa_requester"
															name="capa_requestor" /><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></span>
														</td>
													</tr>
													<tr class="row1">
														<td valign="middle" align="left" class="input_txt"><span
															class="err">*</span>Request Date :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_external_id"
																name="request_date" /><br/>
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
															name="capa_due_date" /><br/>
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
															onmouseout="hideTooltip('tooltip_id');" name="assigned_team_leader" /><br/>
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
															name="team_members" /><br/>
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
															name="root_cause_analysis_file" /><br/>
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
															name="why" /><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.why"></form:errors>
														</span>
														</td>
													</tr>
												
												</table>
												
												
												
													</td>
												<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
												<table cellpadding="0" cellspacing="0" border="0" width="100%">
													<tr class="row1">
													<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
													
												<tr class="row2">
														<td valign="top" align="left" class="input_txt"><span
															class="err">*</span>Root Cause Statement :</td>
														<td valign="top" align="left" class="input_txt"><input
															type="text" class="input_txtbx1" id="inp_reported_by"
															onmouseover="showTooltip('tooltip_id','inp_id3');"
															onmouseout="hideTooltip('tooltip_id');"
															name="root_cause_statement" /><br/>
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
															name="upload_external_analysis" /><br/>
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
															name="action" /><br/>
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
															name="responsibility" /><br/>
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
															name="due_date" /><br/>
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
															name="completion_date" /><br/>
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
															name="verified_by" /><br/>
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
															name="verification_date" /><br/>
														<font color="Red" size="+1"></font><span class="err"><form:errors
																	path="CorrectiveAndPreventiveActions.verification_date"></form:errors>
														</span>
														</td>
													</tr>
													
												</table></td></tr></table>








									
									</div>
														</td>
														</tr>
														<tr class="row1">
															<td valign="top" align="center"></td>
															<td valign="top" align="left"><input
																type="submit" class="submit_btn2"
																value="Add Non Conformance" class="submit_btn1">
															</td>
															<!-- <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Add Participant" onclick="update.submit()"></td> -->
														</tr>
													</table>
										</div>
									
									</td>
										</tr>
									</table>
									</form>
									<!-- modal form -->
									</div>
									
					 <script>
 $(function() {
	 var format="yy-mm-dd";
           $( "#datepicker" ).datepicker();
           
         });
 
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 

function toggle2(value){
  // alert("yes");
    var e = document.getElementById('corrective_div');
   
if(value==0)
    {
	e.style.display="none";
	
    }
else
    {
	e.style.display="block";
	
    }
    
}
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script> <jsp:include page="footer.jsp"></jsp:include>