<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="right_content">
<form action="add_nonconformance" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
       <!--  <td valign="top" align="left" style="padding:5px 0 10px 0;">&nbsp;
		<div class="status success" style="display: none;">
            <p class="closestatus"><a title="Close" href="">x</a></p>
            <p><img alt="Success" src="images/icons/icon_success.png"><span>Success!</span>.</p>
          </div>
      </tr>
      <tr> -->
        <td valign="top" align="left">
        	<div>
	            <div class="headings altheading">
	              <h2>Non Conformance</h2>
	            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
  				<tr>
    				<td align="left" valign="top" width="50%" style="padding-right:25px;">
    					<h2 class="quck-txt">Quick Info</h2>
    						<table cellpadding="0" cellspacing="0" border="0" width="100%">
                        		<tr class="row1">
				                  <td valign="middle" align="left" class="input_txt"><span class="err">*</span> ID :</td>
				                  <td valign="top" align="left" class="input_txt">
				                 
				                 <input type="hidden" name="id" value="<c:out value="${id }"/>"/><c:out value="${id}"/>
				                   	</br><font color="Red" size="+1"></font>
				                  </td>
				                </tr>

								 <tr class="row2">
						         	<td valign="middle" align="left" class="input_txt"> Source of Non Conformance :</td>
						           <td valign="top" align="left" class="input_txt">
				                  		<select name="source_of_nonconformance" class="input_cmbbx1">
						                    <option selected="selected" value="Internal Audit" >Internal Audit</option>
											<option value="Customer Audit">Customer Audit</option>
											<option value="Third Party Audit">Third Party Audit</option>
											<option value="Incoming Inspection">Incoming Inspection</option>
				                   			<option value="Customer Complaint">Customer Complaint</option>
				                   	
				                   		</select>
				                   	</td>	</br><font color="Red" size="+1"></font></td>
						         </tr> 
								<tr class="row1">
				                	<td valign="middle" align="left" class="input_txt">External ID :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="external_id" /></br><font color="Red" size="+1"></font></td>
				                </tr> 
								<tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"> Type of NonConformance :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="type_of_nonconformance" class="input_cmbbx1">
						                    <option selected="selected" value="Product Quality" >Product Quality</option>
											<option value="Service Quality">Service Quality</option>
											<option value="Late Delivery">Late Delivery</option>
											<option value="Early Delivery">Early Delivery</option>
				                	
				                   		</select>
				                   	</td> </tr>	
								<tr class="row1">
					            	<td valign="middle" align="left" class="input_txt"> Product ID :</td>
					                      	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_product_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="product_id" /></br><font color="Red" size="+1"></font></td>
				           
					                  </tr>
								<tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"> Quantity Suspect :</td>
				                                     	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_quantity_suspect" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" /></br><font color="Red" size="+1"></font></td>
				    	</tr>
						
				                <tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"> Nature of Non conformance :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_nature_of_nonconformance" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="nature_of_nonconformance"/></br><font color="Red" size="+1"></font></td>
				                </tr>
								 <tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"> Date Found :</td>
				                  	                        	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_date_found" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" /></br><font color="Red" size="+1"></font></td>
				  
				                </tr>
								<tr class="row1">
				                	<td valign="top" align="left" class="input_txt">Reported By :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_reported_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="reported_by" /></br><font color="Red" size="+1"></font></td>
				       	</tr>
						                 
              				</table>
              			</td>
    					<td align="left" valign="top"> <h2 class="quck-txt"></h2>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							  <tr class="row1"></tr>
			                <tr class="row1">
			                  <td valign="top" align="left" class="input_txt">Temporary Action(Memo):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
			                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_temporary_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="temporary_action" /></br><font color="Red" size="+1"></font></td>
				   <font color="Red" size="+1"></font></td>
			                </tr>
		  					<tr class="row2">
                  				<td valign="middle" align="left" class="input_txt">Corrective Action Required:</td>
                  				         <td valign="top" align="left" class="input_txt"><input type="radio" name="corrective_action_required" value="0" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="corrective_action_required" value="1" class="input_txt">No
                			</tr>
						<tr class="row1">
			                  <td valign="top" align="left" class="input_txt"> Disposition Required:</td>
			        		         <td valign="top" align="left" class="input_txt"><input type="radio" name="disposition_required" value="0" class="input_txt" checked="true">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="disposition_required" value="1" class="input_txt">No
                	          </tr>
                	          <tr class="row2">
				                  	<td valign="middle" align="left" class="input_txt"> Disposition :</td>
				                  	<td valign="top" align="left" class="input_txt">
				                  		<select name="disposition" class="input_cmbbx1">
						                    <option selected="selected" value="Product Quality" >Discard</option>
											<option value="Service Quality">Keep as is</option>
										</select>
				                   	</td> </tr>	
			            	<tr class="row1">
			                  <td valign="top" align="left" class="input_txt"> Disposition Complete Date:</td>
			                                	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" /></br><font color="Red" size="+1"></font></td>
				      </tr>
			          		<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"> Name of Disposition Responsibility:</td>
			                             	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="name_of_disposition_responsibility" /></br><font color="Red" size="+1"></font></td>
				        </tr>
			        		<tr class="row1">
			                  <td valign="top" align="left" class="input_txt"> Cost of NonConformance:</td>
			                            	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="cost_of_nonconformance" /></br><font color="Red" size="+1"></font></td>
				          </tr>
			         	</table>
			    	</td>
              	</tr>
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Add Participant" onclick="update.submit()"></td>
                </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form>
</div>
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>