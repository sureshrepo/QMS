<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
 
  

<form method="post" action="feedback_report">
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
 <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Customer Feedback Report</h2>
            </div>
            <div class="contentbox">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <tr class="row2">
               <td valign="middle" align="left" class="input_txt" width="30%"> Type of Feedback :<!-- </td> -->
                  <!-- <td valign="top" align="left" class="input_txt" width="70%"> -->
                  <select name="type_of_feedback" class="input_cmbbx1">
                  <option value="Complaint"<c:if test="${feedback=='Complaint'}"><c:out value="selected"/></c:if>>Complaint</option>
                  <option value="Suggestion"<c:if test="${feedback=='Suggestion'}"><c:out value="selected"/></c:if>>Suggestion</option>
                  
                  </select>
                  <td></td>
                  </td>
                  <td></td><td></td>
                   </tr>
                  <tr class="row1">
                  <td valign="top" width="30%"><span class="err">*</span>From Date:
                  <input type="text" name="from_date" class="input_txtbx1" id="datepicker"  value="${fromdate}" /></br><span class="err"></span></td>
                   <td width="30%"><span class="err">*</span>To Date:
                  <input type="text" name="to_date" class="input_txtbx1" id="datepicker1" value="${todate}" /></br><span class="err"></span></td>
                  <td  valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Generate" class="submit_btn1" id="button" onClick="commit()"></td>                
</tr>
</table>
 <table cellpadding="0" cellspacing="0" border="0" width="100%" id="table">

							<tr class="title">
								
         						<td valign="top" align="left" width="15%">Date of Feedback</td>
					         	<td valign="top" align="left" width="15%">Type of Feedback</td>
					         	<td valign="top" align="left" width="20%">Feedback recorded by</td>
								<td valign="top" align="left" width="20%">Feedback details</td>
          						<td valign="top" align="left" width="15%">Attachments</td>
          						<td valign="top" align="left" width="20%">Actions</td>
          						
        					</tr>
        					
        					<c:forEach items="${customerFeedbackForm.customerFeedbacks}" var="customerFeedbacks" varStatus="status">
        							
        								<tr class="row2" onmouseover="mouse_event(this,"row_hover");" onmouseout="mouse_event(this,"row1");">
								  
        						<td valign="top" align="left"  width="10%">${customerFeedbacks.date_of_feedback}</td>
											<td valign="top" align="left" width="15%">${customerFeedbacks.type_of_feedback}</td>
											<td valign="top" align="left" width="10%">${customerFeedbacks.feedback_recorded_by}</td>
											<td valign="top" align="left" width="10%">${customerFeedbacks.feedback_details }
											<td valign="top" align="left" width="15%"><a href="download_attachment?fid=<c:out value="${customerFeedbacks.feedback_id}"/>">Download</a></td></td>
									    	<td valign="top" align="left" width="15%">
											
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editfeedback?fid=${customerFeedbacks.feedback_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletefeedbackr?fid=${customerFeedbacks.feedback_id}"/>" onclick="return confirmation()">Remove</a>
											
											</td>
											</tr>
											
        					</c:forEach>
        					                
        					
<tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="right"  colspan="3"><input type="submit" value="Download" class="submit_btn1" ></td>
                </tr>
</table> 

</div>
</div>
</td>
</tr>
</table>
</form>
<script>
 $(function() {
           $( "#datepicker" ).datepicker();
         });
 
</script>

 <script>
 $(function() {
           $( "#datepicker1" ).datepicker();
         });
 
</script>
<script type="text/javascript">
$(document).ready(function()
{
    $("#table").hide();
    $("#button").click(function()
    {
        $("#table").show();
    });

});
</script>
<script>
function commit(){         
    $("#historylist").toggle();
}
</script>