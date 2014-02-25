<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="update_maintenance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Maintenance</span>
									
								</a>
							</li>
						<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_list" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Maintenance</span>
								</a>
							</li>
				           <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="maintenance_report" class="<c:choose>
								<c:when test="${menu=='maintenance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
              <h2>Editing Maintenance & Calibration</h2>
            </div>  <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${maintenanceForm.maintenance[0]}" var="Maintenance"> </c:set>
             
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_id" class="input_txtbx" id="equipment_id" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_model" class="input_txtbx" id="equipment_model" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="serial_number" class="input_txtbx" id="serial_number" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_acquired" class="input_txtbx" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="equipment_status" class="input_cmbbx1">
                  <option value="Active">Active</option>
                  <option value="Not Active">Not Active</option>
                  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="50%"> Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="frequency_maintenance" class="input_cmbbx1">
                  <option value="Weekly">Weekly</option>
                  <option value="Monthly">Monthly</option>
                   <option value="Weekly">Quarterly</option>
                   <option value="Weekly">Semi-Annually</option>
                  <option value="Monthly">Annually</option>
                  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Calibration(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               <input type="radio" name="calibration" value="Yes" onchange="toggle3(this.value);"  id="calibration_yes" >Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="calibration" value="No" id="calibration_no" onchange="toggle3(this.value);"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               </td>
               </table>
             </td>
              </tr>
            
            
        </table>
        </div>
         <div class="contentbox">
        <table>
        
    
    <tr>
    <td>
    <table>
          <tr class="row2">
         
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"></span></td>
                </tr> 
               <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_maintenance" class="input_cmbbx1">
                  <option value="Preventive">Preventive</option>
                  <option value="Corrective">Corrective</option>
                   <option value="Predictive">Predictive</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="50%"><span class="err">*</span>Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="maintenance_frequency" class="input_txtbx" id="maintenance_frequency" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="reference" class="input_txtbx" id="reference" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.reference"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Instructions:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="instructions"  style="width:25%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.instructions"></form:errors></span></td>
            </tr>
        </table>
        </td> 
           <td>
           <table>
           
           
            <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="due_date" class="input_txtbx" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completed_by" class="input_txtbx" id="searchbox" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Notes:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="notes"  style="width:25%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
            </tr>
            <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Submit" class="submit_btn1"></td>
                </tr>
          
           </table>
           </td>
           </tr>
    
           </table>
            
            
           
         </div>  
            
             </td>
            </tr>
            </table></div>
            </form>
            <!--  <script type="text/javascript">
function toggle3(value){
     
       var e = document.getElementById('child_table');
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
       }
else
       {
	e.style.display="block";
       }
       
}
</script> -->
          