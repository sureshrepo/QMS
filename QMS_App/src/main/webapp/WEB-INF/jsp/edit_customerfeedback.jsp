<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="updatefeedback">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
    <c:if test="${status=='true'}">
    <tr>
    
        <td valign="top" align="left" style="padding:5px 0 10px 0;">
			<div class="status success">
	            <p class="closestatus"><a title="Close" href="">x</a></p>
	            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
	       	</div>                          
		</td>
		
      </tr></c:if>
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
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${customerFeedbackForm.customerFeedbacks[0]}" var="customerfeedbacks"></c:set>
                <tr class="row1">
             
                 <td valign="middle" align="right" class="input_txt" width="30%">    <input type="hidden" name="feedback_id" value="${customerfeedbacks.feedback_id }"/>
               Date of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_of_feedback" class="input_txtbx1" id="inp_date_of_feedback" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${customerfeedbacks.date_of_feedback}"></c:out>' /></br><span class="err"><form:errors path="CustomerFeedback.date_of_feedback"></form:errors></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Type of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_feedback" class="input_cmbbx1">
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Complaint'}"><c:out value="Selected"/></c:if> value="Complaint">Complaint</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Suggestion'}"><c:out value="Selected"/></c:if> value="Suggestion">Suggestion</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq 'Product Return'}"><c:out value="Selected"/></c:if> value="Product Return">Product Return</option>                  
                  </select>
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Feedback Recorded by :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="feedback_recorded_by" class="input_cmbbx1">
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq'name1'}"><c:out value="Selected"/></c:if> value="name1">Associate name1</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq'name2'}"><c:out value="Selected"/></c:if> value="name2">Associate name2</option>
                  <option <c:if test="${customerfeedbacks.type_of_feedback eq'name3'}"><c:out value="Selected"/></c:if> value="name3">Associate name3</option>                  
                  </select>                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Feedback Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx1" name="feedback_details" id="id_feedback_details" style="width: 177px; height: 89px;"><c:out value="${customerfeedbacks.feedback_details}"></c:out></textarea>                  
                  
                  <br/><span class="err"><form:errors path="CustomerFeedback.feedback_details"></form:errors></span></td>
                  </tr>
                  <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="attachments" class="input_txtbx1" id="id_attachments" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value='<c:out value="${customerfeedbacks.attachments}"></c:out>'></br><span class="err"></span></td>
                  </tr>
                  
                    <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="submit" class="submit_btn1" value="Update Feedback" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  </tr>
                  
                  
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
<jsp:include page="footer.jsp"></jsp:include>
