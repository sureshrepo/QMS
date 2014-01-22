<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="maintenance">
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
              <h2>View Maintenance & Callibration</h2>
            </div>
            <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
               <c:set value="${maintenanceForm.maintenance[0]}" var="maintenance"> </c:set>
               <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.equipment_id}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.equipment_name}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.equipment_model}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.serial_number}</br><span class="err"></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.date_acquired}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.equipment_status}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Frequency of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.frequency_maintenance}
                  
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Calibration(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="70%">${maintenance.calibration}
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
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.type_of_maintenance}
                  
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.maintenance_frequency}</br><span class="err"></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.reference}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Instructions:</td>
               <td valign="top" align="left"  colspan="3">${maintenance.instructions}<br/><span class="err"></span></td>
            </tr>
            <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Due Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.due_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.completion_date}</br><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">${maintenance.completed_by}</br><span class="err"></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Notes:</td>
               <td valign="top" align="left"  colspan="3">${maintenance.notes}<br/><span class="err"></span></td>
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
            