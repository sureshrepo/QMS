<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<div id="right_content">
	<!-- <form name="grid" onSubmit="return validate(this)" action="" method="POST">
     -->	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      		<tr>
      		<td>
      			 <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Customers</span>
									
								</a>
							</li>
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewcustomers" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Customers</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addfeedback" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewfeedback" class="<c:choose>
								<c:when test="${menu=='customer'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View feedback</span>
									
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="feedback_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Feedback Report</span>
									
								</a>
							</li>
				            </ul>
  </div>
      		</td>
      		</tr>
      		
      		<tr>
					<table>
					<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>
	          		</div>
	          		</table>
						</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View Customer Feedbacks</h2>
			        </div>
			        <div class="contentbox">
						<div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findcustomerfeedback" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="25%">Date of Feedback : </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="date_of_feedback" class="input_txtbx1" id="date"></td>
							    <td align="left" valign="middle" width="25%">&nbsp;Type of Feedback: </td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="type_of_feedback" id="type" class="input_txtbx1"></td>
							    <!-- <td align="left" valign="middle" width="10%">Feedback Details:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="feedback_details" class="input_txtbx1" id="details"></td>
							     -->
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Find" name="findcustomerfeedback" ></td>
							  	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn1" value="Clear" name="welcome" ></td>
							  </tr>
							</table>
							</form>
						</div>
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					         <!--  <td valign="top" align="left" width="20%">Feedback recorded by</td>
 							 -->	<td valign="top" align="left" width="20%">Feedback details</td> 
          						<td valign="top" align="left" width="15%">Attachments</td>
          						<td valign="top" align="left" width="15%">Actions</td>
          						
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		 <tr class="row<%=i%>" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");"> 
								           	<td valign="top" align="left"  width="10%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
									 	 <td valign="top" align="left" width="10%">${customerFeedbacks.feedback_details}</td>
									 	 <c:choose>
											<c:when test="${customerFeedbacks.attachment_name!='null'}">
											<td valign="top" align="left" width="10%"><a href="<c:out value="download_attachment?fid=${customerFeedbacks.feedback_id}"></c:out>">Download</a></td>
										</c:when>
										<c:otherwise><td valign="top" align="center" width="10%">No Document</td>
										</c:otherwise>
										</c:choose>	
									 	 <%-- 
										 	 <td valign="top" align="left" width="10%"><a href="download_attachment?fid=<c:out value="${customerFeedbacks.feedback_id}"/>">Download</a></td>
										 --%>	<%-- <td valign="top" align="left" width="15%">${customerFeedbacks.attachments}</td>
									    	 --%><td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editfeedback?fid=${customerFeedbacks.feedback_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletefeedbackr?fid=${customersFeedbacks.feedback_id}"/>" onclick="return confirmation()">Remove</a>
											
											</td>
										</tr>
							    	</c:forEach>
							    	<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewfeedbackreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewfeedbackreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewfeedbackreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallfeedbackreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_customerfeedback" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
		  </tr>

        				       				

						    	
						
						
						</table>
					</div>
				</td>
			</tr>
		</table> 
	
</div>

<script>
function confirmation(val) {
	var answer = confirm("Are you Sure You Want to Delete Participant ?")
	if (answer){
		window.location = "?do=deleteparticipant&id="+val;
	}
	else{
		
	}
}
</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

function findpart()
{
// alert(document.getElementById("moblie").value);
// alert(document.getElementById("group").value);
// alert(document.getElementById("city").value);
window.location="?do=viewparticipants&id="+document.getElementById("id").value+"&date="+document.getElementById("date").value+"&type="+document.getElementById("type").value;
}
</script>

<jsp:include page="footer.jsp"></jsp:include>