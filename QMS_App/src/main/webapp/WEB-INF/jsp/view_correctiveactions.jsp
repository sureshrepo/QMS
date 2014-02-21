<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcorrectiveAndPreventiveActions" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Corrective and Preventive Actions</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="correctiveactions_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Corrective and Preventive Actions</span>
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
      
 
	
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>View Corrective And Preventive Actions </h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${correctiveAndPreventiveActionsForm.correctiveAndPreventiveActions[0]}" var="correctiveAndPreventiveActions"> </c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">CAPA Id: </td>

                  

                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.capa_id}<span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">NC id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.nc_id}<span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Source of Nonconformance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.source_of_nonconformance}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">External id:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.external_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Type of Nonconformance:</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.type_of_nonconformance}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Date found :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.date_found}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">Temporary Action :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.temporary_action}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Nature of NC:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.nature_of_nc}
               </td>
                </tr>
               <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">CAPA Requester:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.capa_requestor}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Request Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.request_date}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">CAPA Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.capa_due_date}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Assigned team leader:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.assigned_team_leader}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Team members:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.team_members}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Root Cause Analysis File:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.root_cause_analysis_file}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Use 5 why in System:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.use_5_why_in_system}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Why's:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.why}
               </td>
                </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Root Cause Statement:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.root_cause_statement}
               </td>
                </tr>
                  <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Upload external analysis:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.upload_external_analysis}
               </td>
                </tr>
                  
                 

                <tr>
             <td colspan="4">
            <!--  <div id="child_table" style="display:none;"> -->
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
            
        <!--  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%">Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
                </tr> -->
              <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Action:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.action}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Responsibility:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.responsibility}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Due Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.due_date}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Completion Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.completion_date}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Verified by:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.verified_by}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Verification Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${correctiveAndPreventiveActions.verification_date}
               </td>
                </tr>
                 
                
            </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            </div>
            </td>
            </tr>
            </table></div>
            </form>
            <!--  <script type="text/javascript">
function toggle3(value){
     
       var e = document.getElementById('child_table');
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
       }
else
       {
	e.style.display="block";
       }
       
}
</script> -->
            