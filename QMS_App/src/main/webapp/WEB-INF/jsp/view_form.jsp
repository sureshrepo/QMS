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
								<a href="add_documents" class="<c:choose>
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
								<a href="formreport" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
								</a>
							</li>
  </div>
</td>
</tr>
			<tr>
				<td valign="top" align="left"><div>
						<div class="headings altheading">
							<h2>View Form</h2>
						</div>
						 <div class="contentbox">
						<form action="searchform" name="dashboard" method="GET">
<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Record Title</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="form_or_rec_title" class="input_txtbx1" id="recordtitle"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Media Type:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="form_media_type" class="input_txtbx1" id="mediatype"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;Retention Time:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="retention_time" id="retentiontime" class="input_txtbx1"></td>
							    <td align="center" valign="middle" width="38%">
							  <input type="submit" value="search" class="submit_btn" name="search" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /></td>
							  </tr>
							</table>
						</div> 
</form>
					<form action="?do=viewparticipants" name="dashboard" method="POST">
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr class="title">
									<td valign="top" align="left" width="5%">Auto Number</td>
									
									<td valign="top" align="left" width="15%">Form/Rec ID</td>
									<td valign="top" align="left" width="15%">Responsibility</td>
																		
									<td valign="top" align="left" width="15%">Process</td>
									
									<td valign="top" align="left" width="10%">Retention Time</td>
									<td valign="top" align="left" width="10%">Form?(Y/N)</td>
									<td valign="top" align="left" width="10%">Effective Date</td>
									<td valign="top" align="left" width="10%">Retention Time</td>
									<td valign="top" align="left" width="10%">Approver1</td>
									<td valign="top" align="left" width="10%">Issuer</td>
									<td valign="top" align="left" width="10%">Actions</td>
									</tr>

								<!-- Display Admin Userd here  Suresh--> 
								<% int i=1; %>
							       		
									<c:forEach items="${formForm.form}" var="form" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								           	<td valign="top" align="left"  width="10%">${form.auto_number}</td>
									
											<td valign="top" align="left" width="10%">${form.form_or_rec_id}</td>
											<td valign="top" align="left" width="10%">${form.responsibility}</td>
											
											<td valign="top" align="left" width="15%">${form.process}</td>
											
											<td valign="top" align="left" width="15%">${form.retention_time}</td>
											<td valign="top" align="left" width="15%">${form.form}</td>
											
											<td valign="top" align="left" width="10%">${form.effective_date}</td>
											<td valign="top" align="left" width="10%">${form.document_id}</td>
											<td valign="top" align="left" width="10%">${form.approver1}</td>
											<td valign="top" align="left" width="10%">${form.issuer}</td>
											
											
											
											<td valign="top" align="left" width="15%">
											<%-- <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="edit_form?id=<c:out value="${form.id}"/>">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="delete_form?id=<c:out value="${form.id}"/>" onclick="return confirmation()">Delete</a>
											 --%>
											 <a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a>
											<a href="editform?fid=<c:out value="${form.form_or_rec_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a>
											<a href="deleteform?fid=<c:out value="${form.form_or_rec_id}"/>" style="padding-right:10px;">Delete</a>
											
											</td>
										</tr>
							    	</c:forEach>
						    	

							<!-- 	<tr><td colspan="7">  <div class="extrabottom">
              						<ul class="pagination">
                						<li class="text"><input type="submit" name="view" value="View All" class="submit_btn"></li>
                						<li class="text"></li>
                					</ul></div></td></tr> -->

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
						
						
<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Form ?")
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>
<jsp:include page="footer.jsp"></jsp:include>