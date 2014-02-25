<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />


<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
	<script src="/QMS_App/resources/js/jquery.js"></script>
 
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" enctype="multipart/form-data" action="add_correctiveAndPreventiveActions">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <td>
        <div>
  <ul class="horizmenu">
						
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Corrective And Preventive Actions</span>
									
								</a>
							</li>
							
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Corrective And Preventive Actions</span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="capa_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Add Corrective And Preventive Actions</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>CAPA ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="capa_id" value="<c:out value="${capa_id}"/>"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row2">
						         	<td valign="top" align="right" class="input_txt"> NC ID :</td>
						          <td valign="top" align="left" class="input_txt">
				                  		<select name="nc_id" class="input_cmbbx1">
				                  		<option value="1111">11111</option>
</select>
						           		<span class="err"><form:errors path="CorrectiveAndPreventiveActions.nc_id"></form:errors></span>
				                   	</td>	
						          
			
                  <td valign="middle" align="right" class="input_txt" width="30%"> External ID :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <input type="text" name="external_id" class="input_txtbx" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.external_id}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.external_id"></form:errors></span>
                  </td>         		</tr>
                  

								
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Source of NC :</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="source_of_nonconformance" class="input_txtbx" id="sourceofnonconformance" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.source_of_nonconformance}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.source_of_nonconformance"></form:errors></span></td>
               
   
                
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Date Found :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_found" class="input_txtbx" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.date_found}" /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.date_found"></form:errors></span></td>
                </tr>
			<tr class="row2">
							         									
                      
                  <td valign="middle" align="right" class="input_txt" width="30%"> Type of NC :</td>
                    <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="type_of_nonconformance" class="input_txtbx" id="typeofnc" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.type_of_nonconformance}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.type_of_nonconformance"></form:errors></span></td>
                  <td valign="middle" align="right" class="input_txt" width="30%">Temporary Action :</td>               
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="temporary_action"  style="width:70%; height: 70px;">${correctiveAndPreventiveActions.temporary_action}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.temporary_action"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%">Nature of NC :</td>      
						         	 <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="nature_of_nc"  style="width:70%; height: 70px;">${correctiveAndPreventiveActions.temporary_action}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.temporary_action"></form:errors></span></td>
              
              </tr>
              
              
              
            <tr class="row2">
              <td valign="middle" align="right" class="input_txt"> CAPA Requestor</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="capa_requestor" class="input_cmbbx1">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.capa_requestor eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span class="err"><form:errors path="CorrectiveAndPreventiveActions.capa_requestor"></form:errors></span>
				                 
				                   	</td>	
				                   	<td valign="middle" align="left" class="input_txt"> Use 5 Whys's in system(Y/N)</td>
				                   	<td><input type="checkbox" name="use_5_why_in_system" value="use_5_why_in_system" id="use_5_why_in_system"/></td>
								
						         </tr> 
				
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Request Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="request_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.request_date}" /><span class="err"><form:errors path="CorrectiveAndPreventiveActions.request_date"></form:errors></span></td>
                  
                  <td valign="middle" align="left" class="input_txt" id="why?" width="20" style="display:none;">Why's?'
				   	
				   	<input type="checkbox" name="why1" value="why1" id="0"/>
					</td>
					  <td valign="top" align="left" class="input_txt" width="70% " id="5why" style="display:none;">
					 
					
					 <textarea class="input_txtbx1"  name="why" id="why" style="width:70%; height: 70px;">${correctiveAndPreventiveActions.why}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.why"></form:errors></span></td>			
                 </tr>	
                
                <tr class="row2">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"> CAPA Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="capa_due_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${correctiveAndPreventiveActions.capa_due_date}" /><span class="err"><form:errors path="CorrectiveAndPreventiveActions.capa_due_date"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">
                <td valign="top" align="left" class="input_txt" width="70%"> 
              
                </tr>
            <tr class="row1">
              <td valign="middle" align="right" class="input_txt">Assigned Team Leader</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="assigned_team_leader" class="input_cmbbx1">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.assigned_team_leader eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span class="err"><form:errors path="CorrectiveAndPreventiveActions.assigned_team_leader"></form:errors></span>
				                 
				                   	</td>	
                 </tr>
                  <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%">Team Member(s)</td>      
						         	 <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="team_members"  style="width:70%; height: 70px;">${correctiveAndPreventiveActions.team_members}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.team_members"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%">Root-Cause Statement</td>               
                  <td valign="top" align="left" class="input_txt" width="70%"><textarea class="input_txtbx1"  name="root_cause_statement"  style="width:70%; height: 70px;">${correctiveAndPreventiveActions.root_cause_statement}</textarea><span class="err"><form:errors path="CorrectiveAndPreventiveActions.root_cause_statement"></form:errors></span></td>
               
              </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Root-Cause Analysis File</td>
                  
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="root_cause_analysis_file" class="input_txtbx" id="root_cause_analysis_file" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${correctiveAndPreventiveActions.root_cause_analysis_file}"></c:out>' /><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.root_cause_analysis_file"></form:errors></span></td>
               <td valign="middle" align="left" class="input_txt" > Upload External Analysis(Y/N)</td>
				                   	<td><input type="checkbox" name="upload_external_analysis" id="externalfile" value="upload_external_analysis" id="0"/></td>
							</tr>
				<tr class="row2" id="upload" style="display:none;">
				 <td valign="middle" align="right" class="input_txt" width="30%" >Upload</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  
                  <input name="attachments"  id="id_file" type="file" /> 
                  </td>       	
          
           </tr>
                 
                 
                  </table>
                
                <div>
                 <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Action</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="action" value="<c:out value="${correctiveAndPreventiveActions.action}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.action"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Due Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" id="datepicker6" name="due_date" value="<c:out value="${correctiveAndPreventiveActions.due_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.due_date"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Verified By</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="verified_by" value="<c:out value="${correctiveAndPreventiveActions.verified_by}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.verified_by"></form:errors></span></td>
               </tr>
                    <tr class="row2">
                     <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Responsibity</td>
                     <td valign="top" align="left" class="input_txt">
				                  		<select name="responsibility" class="input_cmbbx1">
						                  <option value="">--Select--</option>
						                       <option <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name1'}"><c:out value="Selected"/></c:if> value="name1" >name1</option>
											<option <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name2'}"><c:out value="Selected"/></c:if> value="name1">name2</option>
											<option  <c:if test="${correctiveAndPreventiveActions.responsibility eq 'name3'}"><c:out value="Selected"/></c:if> value="name3">name3</option>
				                 </select>
				                 <span class="err"><form:errors path="CorrectiveAndPreventiveActions.responsibility"></form:errors></span>
				                   	</td>	
                     
                     <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completion Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" id="datepicker4" name="completion_date" value="<c:out value="${correctiveAndPreventiveActions.completion_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.completion_date"></form:errors></span></td>
                <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Verification Date</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" id="datepicker5" name="verification_date" value="<c:out value="${correctiveAndPreventiveActions.verification_date}"/>"/><br/><span class="err"><form:errors path="CorrectiveAndPreventiveActions.verification_date"></form:errors></span></td>
                
                    
                    
                    </tr>
                </table>
               </td>
               </tr>
               </table>
                </div>
                
                
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
                  </tr></table></div>
                 
                  </form>
                  
                  
                  
     
<script>
$('#externalfile').change(function() {
	 var e1=document.getElementById("upload");
	   
	 if($(this).is(':checked')) {
		 e1.style.display="table-row";
			
     
     } else {
    	 e1.style.display="none";
 	 }
   
});

</script>
 <script>
$('#use_5_why_in_system').change(function() {
	 var e4=document.getElementById("5why");
	 var e5=document.getElementById("why?");
		  
	 if($(this).is(':checked')) {
		 e4.style.display="table-cell";
		 e5.style.display="table-cell";
     
     } else {
    	 e4.style.display="none";
    	 e5.style.display="none";
    	    	 
			 }
   
});

</script>
          
   <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker4" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker5" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
<script>
 $(function() {
	 $( "#datepicker6" ).datepicker({dateFormat: 'yy-mm-dd'});
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
      <jsp:include page="footer.jsp"></jsp:include>
