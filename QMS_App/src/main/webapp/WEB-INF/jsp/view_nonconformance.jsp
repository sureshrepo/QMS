<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
	<form action="?do=viewparticipants" name="dashboard" method="POST">
		<table cellpadding="0" cellspacing="0" border="0" width="98%"
			class="margin_table">

			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>Non Conformance</h2>
						</div>
						<div class="contentbox">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Id</td>
									<td valign="top" align="left" width="20%">Source of NonConformance</td>
									<td valign="top" align="left" width="10%">External ID</td>
									<td valign="top" align="left" width="20%">Type of Non Conformance</td>

									<td valign="top" align="left" width="15%">Product Id</td>
									<td valign="top" align="left" width="15%">Quantity Suspect</td>
									<td valign="top" align="left" width="25%">Action</td>
									
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${nonConformanceForm.nonconformance}" var="nonconformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${nonconformance.id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.source_of_nonconformance}</td>
											<td valign="top" align="left" width="10%">${nonconformance.external_id}</td>
											<td valign="top" align="left" width="10%">${nonconformance.type_of_nonconformance}</td>
											<td valign="top" align="left" width="15%">${nonconformance.product_id}</td>
											<td valign="top" align="left" width="15%">${nonconformance.quantity_suspect}</td>
											<td valign="top" align="left" width="15%">
											<a href="edit_nonconformance?id=<c:out value="${nonconformance.id}"/>">Edit</a>
											<a href="delete_nonconformance?id=<c:out value="${nonconformance.id}"/>">Delete</a>
											
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