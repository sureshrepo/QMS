<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
	<form action="?do=viewparticipants" name="dashboard" method="POST">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Internal Audits</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Id</td>
									<td valign="top" align="left" width="5%">Process</td>
									<td valign="top" align="left" width="10%">Audit Due Date</td>
									<td valign="top" align="left" width="15%">Audit Start Date</td>
									<td valign="top" align="left" width="5%">Auditor</td>
									<td valign="top" align="left" width="10%">Auditor Notes</td>
									<td valign="top" align="left" width="5%">Finding</td>
									<td valign="top" align="left" width="10%">Completion Date</td>
									<td valign="top" align="left" width="10%">Auditor's Initial'</td>
									<td valign="top" align="left" width="10%">Auditee Name</td>
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${internalAuditsForm.internalAudits}" var="internalAudits" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${internalAudits.id}</td>
											<td valign="top" align="left" width="15%">${internalAudits.process}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_due_date}</td>
											<td valign="top" align="left" width="10%">${internalAudits.audit_start_date}</td>
											<td valign="top" align="left" width="15%">${internalAudits.auditor}</td>
											<td valign="top" align="left" width="15%">${internalAudits.auditor_notes}</td>
											<td valign="top" align="left" width="10%">${internalAudits.finding}</td>
											<td valign="top" align="left" width="10%">${internalAudits.completion_date}</td>
											<td valign="top" align="left" width="15%">${internalAudits.auditors_initials}</td>
											<td valign="top" align="left" width="15%">${internalAudits.auditee_name}</td>
											
											
											<td valign="top" align="left" width="15%">
											<a href="edit_internalaudit?id=<c:out value="${internalAudits.id}"/>">Edit</a>
											<a href="delete_internalaudit?id=<c:out value="${internalAudits.id}"/>">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	

								<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr>

								</table>

								<div style="clear: both;"></div>
								</div>
								</div>
								</td>
								</tr>
								<tr>
									<td valign="top" align="left">&nbsp;</td>
								</tr>
								
							</table>
							</form>
						</div>
<jsp:include page="footer.jsp"></jsp:include>