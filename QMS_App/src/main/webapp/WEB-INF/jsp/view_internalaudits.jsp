<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">

	
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">
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
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>View Internal Audits</h2>
						</div>
						<div class="contentbox">
						<form action="search_audits" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Audit ID:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="id" class="input_txtbx1" id="id"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Process:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="process" class="input_txtbx1" id="process"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Auditee name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="auditee_name" id="auditee_name" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  </tr>
							</table>
						</div>
</form>
					<form action="?do=viewparticipants" name="dashboard" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Audit Id</td>
									<td valign="top" align="left" width="10%">Process</td>
									<td valign="top" align="left" width="15%">Audit Due Date</td>
									<td valign="top" align="left" width="15%">Audit Start Date</td>
									<td valign="top" align="left" width="10%">Auditor</td>									
									<td valign="top" align="left" width="15%">Finding</td>
									<td valign="top" align="left" width="15%">Completion Date</td>
									<td valign="top" align="left" width="10%">Actions</td>
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${internalAuditsForm.internalAudits}" var="internalAudits" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%"><a href="list_internalaudit?id=${internalAudits.id}">${internalAudits.id}</a></td>
											<td valign="top" align="left" width="10%">${internalAudits.process}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_due_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_start_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.auditor}</td>
											<td valign="top" align="left" width="15%">${internalAudits.finding}</td>
											<td valign="top" align="left" width="15%">${internalAudits.completion_date}</td>
											
											
											<td valign="top" align="left" width="15%">
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="edit_internalaudit?id=<c:out value="${internalAudits.id}"/>">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="delete_internalaudit?id=${internalAudits.id}"/>" onclick="return confirmation()">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	

								

								</table>
								</form>

								<div style="clear: both;"></div>
								</div>
								
								
								
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
							<tr><td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewinternalreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewinternalreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewinternalreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallinternalreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_internalaudits" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>		
              </ul>
              </div>
              </td>
              </tr>
        
								
							</table>
							
						</div>
						
						
<script>
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Internal Audits Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}

</script>
<jsp:include page="footer.jsp"></jsp:include>