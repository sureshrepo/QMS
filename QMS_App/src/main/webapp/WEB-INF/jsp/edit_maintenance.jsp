<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="update_maintenance">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add maintenance</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="maintenance_list" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View maintenance</span>
				            	</a>
				            </li>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Editing Maintenance & Callibration</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <c:set value="${maintenanceForm.maintenance[0]}" var="maintenance"> </c:set>
               <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_id" class="input_txtbx" id="equipment_id" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.equipment_id}" /></br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_name" class="input_txtbx" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.equipment_name}" /></br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_model" class="input_txtbx" id="equipment_model" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.equipment_model}" /></br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="serial_number" class="input_txtbx" id="serial_number" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.serial_number}" /></br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="date_acquired" class="input_txtbx" id="date_acquired" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.date_acquired}" /></br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                   <select  name="equipment_status" class="input_cmbbx1">
					<option  value="Active" <c:if test="${maintenance.equipment_status=='Active'}"><c:out value="selected"/></c:if>>Active</option>
					<option value="Not Active " <c:if test="${maintenance.equipment_status=='Not Active'}"><c:out value="selected"/></c:if>>Not Active</option>
				  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select  name="frequency_maintenance" class="input_cmbbx1">
					<option  value="Weekly" <c:if test="${maintenance.frequency_maintenance=='Weekly'}"><c:out value="selected"/></c:if>>Weekly</option>
					<option value="Monthly " <c:if test="${maintenance.frequency_maintenance=='Monthly'}"><c:out value="selected"/></c:if>>Monthly</option>
				  <option value="Quarterly" <c:if test="${maintenance.frequency_maintenance=='Quarterly'}"><c:out value="selected"/></c:if>>Quarterly</option>
				  <option value="Semi-Annually " <c:if test="${maintenance.frequency_maintenance=='Semi-Annually'}"><c:out value="selected"/></c:if>>Semi-Annually</option>
				  <option value="Annually" <c:if test="${maintenance.frequency_maintenance=='Annually'}"><c:out value="selected"/></c:if>>Annually</option>
				  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Calibration(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">
               
                <input type="radio" name="calibration" value="Yes" id="calibration_yes" class="input_txt"   <c:if test="${maintenance.calibration=='yes'}"><c:out value="Checked=checked"/></c:if>>Yes&nbsp;&nbsp;&nbsp;
				  <input type="radio" name="calibration" value="No" id="calibration_no" class="input_txt"  <c:if test="${maintenance.calibration=='no'}"><c:out value="Checked=checked"/></c:if>>No&nbsp;&nbsp;&nbsp;
				  
               </td>
                </tr>
                <tr>
             <td colspan="4">
            <!--  <div id="child_table" style="display:none;"> -->
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
            
        <!--  <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"></span></td>
                </tr> -->
               <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                 <select  name="type_of_maintenance" class="input_cmbbx1">
					<option  value="Preventive" <c:if test="${maintenance.type_of_maintenance=='Preventive'}"><c:out value="selected"/></c:if>>Weekly</option>
					<option value="Corrective " <c:if test="${maintenance.type_of_maintenance=='Corrective'}"><c:out value="selected"/></c:if>>Monthly</option>
				    <option value="Predictive" <c:if test="${maintenance.type_of_maintenance=='Predictive'}"><c:out value="selected"/></c:if>>Quarterly</option>
				  </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="maintenance_frequency" class="input_txtbx" id="maintenance_frequency" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.maintenance_frequency}" /></br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="reference" class="input_txtbx" id="reference" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.reference}" /></br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Instructions:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="instructions"  style="width:25%; height: 89px;" >${maintenance.instructions}</textarea><br/><span class="err"></span></td>
            </tr>
            <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="due_date" class="input_txtbx" id="due_date" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.due_date}" /></br><span class="err"></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx" id="completion_date" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.completion_date}" /></br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completed_by" class="input_txtbx" id="completed_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${maintenance.completed_by}" /></br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Notes:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="notes"  style="width:25%; height: 89px;" >${maintenance.notes}</textarea><br/><span class="err"></span></td>
            </tr>
            </tr>
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Update" class="submit_btn1"></td>
                </tr>
            </table>
            </div>
            </td>
            </tr>
            </table>
            </div>
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
          