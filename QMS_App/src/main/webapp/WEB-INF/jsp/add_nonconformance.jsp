<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<div id="right_content">
<form action="add_nonconformance" method="POST" name="update" id="update">

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
     <td>
     <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_nonconformance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add nonconformance</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="view_nonconformance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View nonconformance</span>
				            	</a>
				            </li>
				            </ul>
  </div>
     </td>
     </tr>
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
             <c:choose>
				<c:when test="${empty nonconformance}">
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
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span>External ID :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="external_id" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.external_id"></form:errors></span></td>
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
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Product ID :</td>
					                      	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_product_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="product_id" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
					                  </tr>
								<tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Quantity Suspect :</td>
				                                     	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_quantity_suspect" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.quantity_suspect"></form:errors></span></td>
				    	</tr>
						
				                <tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Nature of Non conformance :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_nature_of_nonconformance" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="nature_of_nonconformance"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors></span></td>
				                </tr>
								 <tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Date Found :</td>
				                  	                        	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.date_found"></form:errors></span></td>
				  
				                </tr>
								<tr class="row1">
				                	<td valign="top" align="left" class="input_txt"><span class="err">*</span>Reported By :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_reported_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="reported_by" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.reported_by"></form:errors></span></td>
				       	</tr>
						                 
              				</table>
              			</td>
    					<td align="left" valign="top"> <h2 class="quck-txt"></h2>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							  <tr class="row1"></tr>
							  <br/>
							  <br/>
							  <br/>
			                <tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span>Temporary Action(Memo):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
			                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_temporary_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="temporary_action" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.temporary_action"></form:errors></span></td>
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
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Disposition Complete Date:</td>
			                                	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.disposition_complete_date"></form:errors></span></td>
				      </tr>
			          		<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Name of Disposition Responsibility:</td>
			                             	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="name_of_disposition_responsibility" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors></span></td>
				        </tr>
			        		<tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Cost of NonConformance:</td>
			                            	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="cost_of_nonconformance" /></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors></span></td>
				          </tr>
			         	</table>
			         	</c:when>
			         	<c:otherwise>
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
				                	<td valign="middle" align="left" class="input_txt"><span class="err">*</span>External ID :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_external_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="external_id" value="${nonconformance.external_id}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.external_id"></form:errors></span></td>
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
					            	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Product ID :</td>
					                      	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_product_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="product_id" value="${nonconformance.product_id}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.product_id"></form:errors></span></td>
				           
					                  </tr>
								<tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Quantity Suspect :</td>
				                                     	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_quantity_suspect" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="quantity_suspect" value="${nonconformance.quantity_suspect}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.quantity_suspect"></form:errors></span></td>
				    	</tr>
						
				                <tr class="row1">
				                  	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Nature of Non conformance :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_nature_of_nonconformance" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" name="nature_of_nonconformance" value="${nonconformance.nature_of_nonconformance}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.nature_of_nonconformance"></form:errors></span></td>
				                </tr>
								 <tr class="row2">
				                 	<td valign="middle" align="left" class="input_txt"><span class="err">*</span> Date Found :</td>
				                  	                        	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="datepicker" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="date_found" vale="${nonconformance.date_found}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.date_found"></form:errors></span></td>
				  
				                </tr>
								<tr class="row1">
				                	<td valign="top" align="left" class="input_txt"><span class="err">*</span>Reported By :</td>
				                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_reported_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="reported_by" value="${nonconformance.reported_by}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.reported_by"></form:errors></span></td>
				       	</tr>
						                 
              				</table>
              			</td>
    					<td align="left" valign="top"> <h2 class="quck-txt"></h2>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
							  <tr class="row1"></tr>
							  <br/>
							  <br/>
							  <br/>
			                <tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span>Temporary Action(Memo):&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
			                  	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_temporary_action" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="temporary_action" value="${nonconformance.temporary_action}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.temporary_action"></form:errors></span></td>
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
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Disposition Complete Date:</td>
			                                	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="disposition_complete_date" value="${nonconformance.disposition_complete_date}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.disposition_complete_date"></form:errors></span></td>
				      </tr>
			          		<tr class="row2">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Name of Disposition Responsibility:</td>
			                             	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="name_of_disposition_responsibility" value="${nonconformance.name_of_disposition_responsibility}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.name_of_disposition_responsibility"></form:errors></span></td>
				        </tr>
			        		<tr class="row1">
			                  <td valign="top" align="left" class="input_txt"><span class="err">*</span> Cost of NonConformance:</td>
			                            	<td valign="top" align="left" class="input_txt"><input type="text" class="input_txtbx1" id="inp_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  name="cost_of_nonconformance" value="${nonconformance.cost_of_nonconformance}"/></br><font color="Red" size="+1"></font><span class="err"><form:errors path="Nonconformance.cost_of_nonconformance"></form:errors></span></td>
				          </tr>
			         	</table>
			         	</c:otherwise>
			         	</c:choose>
			    	</td>
              	</tr>
                <tr class="row1">
                  <td valign="top" align="center">&nbsp;</td>
                 <td valign="top" align="left"><input type="submit" value="Add Participant" class="submit_btn1"></td>
                  <!-- <td valign="top" align="left"><input type="submit" class="submit_btn2" value="Add Participant" onclick="update.submit()"></td> -->
                </tr>
              </table>
         	</td>
  		</tr>
 	</table>
</form>
</div>
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
 <script language="JavaScript">
function CreateGroup()
{
	document.update.action = 'index.php?do=creategroup&type=1';
	document.update.submit();
}
</script>
<jsp:include page="footer.jsp"></jsp:include>