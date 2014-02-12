 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
 <form method="post" action="updateform">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Document</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Document</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Document report</span>
									
								</a>
							</li>
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Add Form</h2>
            </div>
            <div class="contentbox">
            
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<c:set value="${formForm.form[0]}" var="form"> </c:set>
														<tr>
															<td align="left" valign="top" width="50%"
																style="padding-right: 25px;">
																<h2 class="quck-txt">Quick Info</h2>
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr class="row1">
              <%-- <input type="hidden" class="input_txtbx1" id="inp_id" value="${form.auto_number}" name="auto_number" /> --%>
              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Auto Number :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="hidden" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="auto_number"
																			value="${form.auto_number}" />
																			<c:out value="${form.auto_number}"></c:out>
																		
																		</td>
			<td valign="middle" id="id_location_lbl" align="left" class="input_txt" ><label id="location_label" ><span class="err">*</span> Location:</label><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" >
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Lab" <c:if test="${form.location=='Lab'}"><c:out value="Selected"/></c:if>>Lab</option>
               <option value="Shop Floor" <c:if test="${form.location=='Shop Floor'}"><c:out value="Selected"/></c:if>>Shop Floor</option>
               <option value="Office" <c:if test="${form.location=='Office'}"><c:out value="Selected"/></c:if>>Office</option>
               </select>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align= "left" class="input_txt">																	
																		</td>
																		</tr>
               
              
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_id"
																			value="${form.form_or_rec_id}" /><br/><span class="err"><form:errors path="Form.form_or_rec_id"></form:errors></span>
																		
																		</td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Responsibility :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="responsibility"
																			value="${form.responsibility}" /><br/><span class="err"><form:errors path="Form.responsibility"></form:errors></span>
																		
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		

             </tr>
              
              <tr class="row1">
               <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Form/Rec Title :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="form_or_rec_title"
																			value="${form.form_or_rec_title}" /><br/><span class="err"><form:errors path="Form.form_or_rec_title"></form:errors></span>
																		
																		</td>
				<td valign="middle" align="left" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" >
               
               <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
              <%--  <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>
                --%>
               
               
               </select>
               
																		
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>              </tr>
              
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt" ><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt">
               
                <!-- <input type="radio" name="media_type" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="media_type" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span> -->
                 
                 <input type="radio" name="media_type" value="0" id="id_hardcopy" class="input_txt"   <c:if test="${form.media_type=='0'}"><c:out value="Checked=checked"/></c:if>>Hardcopy&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="media_type" value="1" id="id_electronic" class="input_txt"  <c:if test="${form.media_type=='1'}"><c:out value="Checked=checked"/></c:if>>Electronic&nbsp;&nbsp;&nbsp;
				  
                    
               </td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Retention Time :</td>
																		<td valign="top" align="left" class="input_txt"><%-- <input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="retention_time"
																			value="${form.retention_time}" /> --%>
																			 <select id="retention" name="retention_time" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="1Week" <c:if test="${form.retention_time=='1Week'}"><c:out value="Selected"/></c:if>>1Week</option>
               <option value="1Month" <c:if test="${form.retention_time=='1Month'}"><c:out value="Selected"/></c:if>>1Month</option>
               <option value="1Year" <c:if test="${form.retention_time=='1Year'}"><c:out value="Selected"/></c:if>>1Year</option>
               </select>
																		
																		</td>
																		<td></td><td></td>
																		</tr>
																		<tr class="row1">
																		<td valign="middle" align="left" class="input_txt">Form:</td>
														<td valign="top" align="left" class="input_txt">
														<!-- <input
															type="radio" name="form" value="1"
															class="input_txt" onchange="toggle2(this.value)">Yes&nbsp;&nbsp;&nbsp;<input
															type="radio" name="form" value="0"
															class="input_txt" checked onchange="toggle2(this.value)">No -->
															
															<input type="radio" name="form" value="1"  class="input_txt"   <c:if test="${form.form=='1'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  											<input type="radio" name="form" value="0"  class="input_txt"  <c:if test="${form.form=='0'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            </tr>
                            
              
              <td colspan="4">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
              
             <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             
              <tr class="row1">
                             <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Auto Number :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="hidden" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="auto_no"
																			value="${form.auto_no}" />
																			<c:out value="${form.auto_no}"></c:out>
																		
																		</td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Effective Date :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="datepicker"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="effective_date"
																			value="${form.effective_date}" /><br/><span class="err"><form:errors path="Form.effective_date"></form:errors></span>
																		</td>  
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>      
																		  
																		</tr>
              
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Document ID :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="document_id"
																			value="${form.document_id}" /><br/><span class="err"><form:errors path="Form.document_id"></form:errors></span>
																		</td>
																		              <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Approver1(Process Owner) :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="approver1"
																			value="${form.approver1}" /><br/><span class="err"><form:errors path="Form.approver1"></form:errors></span>
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td> </tr>
              
              <tr class="row1">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Issuer :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="issuer"
																			value="${form.issuer}" /><br/><span class="err"><form:errors path="Form.issuer"></form:errors></span>
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		
              </tr>
              
              <tr class="row2">
                            <td valign="middle" align="left" class="input_txt"><span
																			class="err">*</span>Comments :</td>
																		<td valign="top" align="left" class="input_txt"><input
																			type="text" class="input_txtbx1" id="inp_external_id"
																			onmouseover="showTooltip('tooltip_id','inp_id3');"
																			onmouseout="hideTooltip('tooltip_id');"
																			name="comments"
																			value="${form.comments}" />
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
																		<td valign="top" align="left" class="input_txt">																	
																		</td>
              </tr>
              
              </table>
              </div>
              </td>

              
              <tr class="row1">
              <td colspan="2" align="right">
             <input type="submit" id="export"  name="export" value="Submit" class="submit_btn"></td>
             <td colspan="3">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn"></td>
             </tr>
            </table>
            </td>
            </tr>
            </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            </form>
           
             
       
       <%-- 
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
 <form method="post" enctype="multipart/form-data" action="insert_documents">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="select">
									<span>Add Documents</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewdocuments" class="select">
				            		<span>View Documents</span>
				            	</a>
				            </li>
				             <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="document_report" class="select">
				            		<span>Reports</span>
				            	</a>
				            </li>
				            </ul>
  </div>
        </td>
      </tr>
     
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Add Document</h2>
            </div>
            <div class="contentbox">
            
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              
              
              <tr class="row1">
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Auto Number:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="auto_number" name="auto_number" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Location:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="location" name="location" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
         
              </tr>
              
              <tr class="row2">
              <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Form/Record ID:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="record_id" name="record_id" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
         
              <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Responsibility:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="auto_number" name="responsibility" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
         
              </tr>
               
               <tr class="row1">
              <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Form/Rec Title:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="record_title" name="record_title" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
         
              <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>
               
               
               
               </select>
               
               
               <br/><span class="err"></span></td>
               </tr>
               
               <tr class="row2">
                <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <!-- <select name="media_type" class="input_cmbbx1" onchange="">
               <option onclick="toggle2(this.value);" value="Hard Copy">Hard Copy</option>
               <option onclick="toggle2(this.value);" value="Electronic">Electronic</option>
               </select> -->
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="media_type" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
                    
               </td>
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Retention Time:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="retention_time" class="input_txtbx1"  style="width:200px;" value=""/><br/><span class="err"></span></td>
              <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Form (Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="external" value="1"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="external" value="0" id="id_noforexternal"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               
               </td>
               </tr>
              
               <td colspan="4">
            <!--  <div id="child_table" style="display:none;"> -->
<br>
             <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
               <tr class="row1">
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Auto Number:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="auto_number" name="auto_number" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="date" name="date" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
              </tr>
             <tr class="row1"> 
               <td valign="middle" align="right" class="input_txt" width="15%"><span class="err">*</span>Document ID:</td>
               <td valign="top" align="left" class="input_txt1" width="15%"><select name="document_type" id="document_type" class="input_cmbbx1" style="width:57px;border:none;">
               <option value="PM">PM</option>
               <option value="QSP">QSP</option>
               <option value="WI">WI</option>
               <option value="SD">SD</option>
               <option value="GR">GR</option>
               <option value="SP">SP</option>
               </select><input type="hidden" name="document_id_hidden"  class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><input type="text" value="" id="document_id" class="input_txtbx1" style="height:25px;width:50px;border:none;" name="document_id"/><br/><span class="err"></span></td>
              
            
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Approver1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="approver1" class="input_txtbx1"  style="width:200px;" value=""/><br/><span class="err"></span></td>
                   
		      <tr class="row1" style="border:none;">
           
            <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Issuer:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               
               
               <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
               
               
               <br/><span class="err"></span></td>
               </tr>
            
               <tr class="row2" style="border:none;">
                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" ></textarea><br/><span class="err"></span></td>
         
               
             </tr>
             </table>
             </div>
             </td>
             
             
             
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="export"  name="export" value="Submit" class="submit_btn"></td>
             <td colspan="3">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn"></td>
            
             </tr>
            
                     
              </table>
           
           
      </div></td></tr></table></div>
      
</form>
<script type="text/javascript">
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
if(value==1)
    {
	e.style.display="none";
	e1.style.display="block";
	e2.style.display="none";
	e3.style.display="block";
	
    }
else if(value==0)
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }
    
}
</script>
      <jsp:include page="footer.jsp"></jsp:include> --%>
       