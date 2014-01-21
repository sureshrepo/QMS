<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" enctype="multipart/form-data" action="insertfeedback">
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
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                 <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Date of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_of_feedback" class="input_txtbx" id="inp_date_of_feedback" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Type of Feedback :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_feedback" class="input_cmbbx1">
                  <option value="Complaint">Complaint</option>
                  <option value="Suggestion">Suggestion</option>
                  <option value="Product Return">Product Return</option>                  
                  </select>
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"> Feedback Recorded by :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="feedback_recorded_by" class="input_cmbbx1">
                  <option value="name1">Associate name1</option>
                  <option value="name2">Associate name2</option>
                  <option value="name3">Associate name3</option>                  
                  </select>                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Feedback Details :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <textarea class="input_txtbx1" name="feedback_details" id="id_feedback_details" style="width: 177px; height: 89px;"></textarea>                  
                  
                  <br/><span class="err"></span></td>
                  </tr>
                  <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Attachments :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input name="attachments" id="image" type="file" /></br><span class="err"></span></td>
                  </tr>
                  
                    <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"></td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="submit" class="submit_btn2" name="submit" id="id_submit" onmouseover="showTooltip('tooltip_id','inp_id3');" /><br/></td>
                  </tr>
                  
                  
              </table>
              
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
<jsp:include page="footer.jsp"></jsp:include>
