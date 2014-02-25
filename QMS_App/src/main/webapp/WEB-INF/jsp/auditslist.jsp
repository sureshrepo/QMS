<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="internalaudits">
  <div id="right_content">
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
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Internal Audits </span>
									
								</a>
							</li>
						
				         <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="internalaudit_report" class="<c:choose>
								<c:when test="${menu=='audits'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Internal Audits List</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${internalAuditsForm.internalAudits[0]}" var="internalaudits"></c:set>
               <tr class="row2">

                  <td valign="middle" align="left" class="input_txt" width="20%">Audit  Id: </td>
					<td valign="top" align="left" class="input_txt" width="70%">${internalaudits.id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Process :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.process}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%">Audit Start Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.audit_start_date}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="left" class="input_txt" width="20%">Audit Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.audit_due_date}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="20%"> Auditor :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.auditor}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="20%"> Audit Notes :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.auditor_notes}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="20%">  Finding :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.finding}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%"> Completion Date:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.completion_date}
               </td>
                </tr>
                 <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Auditors Initials:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.auditors_initials}
               </td>
                </tr>
                <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="20%">Auditee Name:</td>
               <td valign="top" align="left" class="input_txt" width="70%">${internalaudits.auditee_name}
               </td>
                </tr>
              

                         </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
            
            </form>
           
            