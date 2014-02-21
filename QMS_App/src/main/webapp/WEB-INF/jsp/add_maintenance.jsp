<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css" type="text/css" />
<script src="resources/js/jquery.min.js"></script>
 <script src="resources/js/jquery-ui.js"></script>

<form method="post" action="add_maintenance">
  <!-- <div id="right_content" style="background-color:lightgrey;"> -->
  
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <!-- <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr> -->
      <tr>
      <td>
      <div>
  <ul class="horizmenu">
						
							<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="add_maintenance" class="<c:choose>
								<c:when test="${menu=='maintenance'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
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
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
								</a>
							</li>
				           </ul>
  </div>
      </td>
      </tr>
      <tr>
        <td valign="top" align="left">
            <div class="headings altheading">
              <h2>Maintenance and Calibration</h2>
            </div>
    <div class="contentbox">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
			<td align="left" valign="top" width="50%" style="padding-right: 25px;">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="70%"><span class="err">*</span>Equipment Id :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_id" class="input_txtbx1" id="equipment_id" onblur="toggle(this.value)"onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_id"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_name" class="input_txtbx1" id="equipment_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_name"></form:errors></span></td>
                </tr>
                 <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Equipment Model :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipment_model" class="input_txtbx1" id="equipment_model" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.equipment_model"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Serial Number :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="serial_number" class="input_txtbx1" id="serial_number" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.serial_number"></form:errors></span></td>
                </tr>
                </table>
						         </td>
						         <td align="left" valign="top">
						         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                
                 <tr class="row2">
                  <td valign="middle" align="left" class="input_txt" width="30%"><span class="err">*</span>Date Acquired :</td>
                  <td valign="top" align="left" class="input_txt" width="50%"><input type="text" name="date_acquired" class="input_txtbx1" id="datepicker1" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.date_acquired"></form:errors></span></td>
                </tr>
                <tr class="row1">
                 <td valign="middle" align="left" class="input_txt" width="30%"> Equipment Status :</td>
                  <td valign="top" align="right" class="input_txt" width="70%">
                  <select name="equipment_status" class="input_cmbbx1">
                  <option value="">--Select--</option>
                  <option value="Active">Active</option>
                  <option value="Not Active">Not Active</option>
                  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                 <td valign="middle" align="left" class="input_txt" width="50%"> Frequency of Maintenance :</td>
                  <td valign="top" align="right" class="input_txt" width="70%">
                  <select name="frequency_maintenance" class="input_cmbbx1">
                  <option value="">--Select--</option>
                  <option value="Weekly">Weekly</option>
                  <option value="Monthly">Monthly</option>
                   <option value="Weekly">Quarterly</option>
                   <option value="Weekly">Semi-Annually</option>
                  <option value="Monthly">Annually</option>
                  </select>
                  <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row1">
               <td valign="middle" align="left" class="input_txt" width="50%"><span class="err">*</span>Calibration(Y/N):</td>
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
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="equipmentid" class="input_txtbx1" id="equipmentid" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"></span></td>
                </tr> 
               <tr class="row1">
                 <td valign="middle" align="right" class="input_txt" width="30%"> Type of Maintenance :</td>
                  <td valign="top" align="left" class="input_txt" width="70%">
                  <select name="type_of_maintenance" class="input_cmbbx1">
                  <option value="">--Select--</option>
                  <option value="Preventive">Preventive</option>
                  <option value="Corrective">Corrective</option>
                   <option value="Predictive">Predictive</option>
               </select>
                <br/><span class="err"></span></td>
                  </tr>
                   <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="50%"><span class="err">*</span>Maintenance Frequency :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="maintenance_frequency" class="input_txtbx1" id="maintenance_frequency" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.maintenance_frequency"></form:errors></span></td>
                </tr>
                 <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Reference :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="reference" class="input_txtbx1" id="reference" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.reference"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Instructions:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="instructions"  style="width:96%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.instructions"></form:errors></span></td>
            </tr>
        </table>
        </td> 
           <td>
           <table>
           
           
            <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Due Date :</td>
                  <td valign="middle" align="left" class="input_txt" width="70%"><input type="text" name="due_date" class="input_txtbx1" id="datepicker2" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.due_date"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completion Date :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completion_date" class="input_txtbx1" id="datepicker3" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completion_date"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Completed By :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="completed_by" class="input_txtbx1" id="completed_by" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /><span class="err"><form:errors path="Maintenance.completed_by"></form:errors></span></td>
                </tr>
                <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Notes:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="notes"  style="width:85%; height: 89px;" ></textarea><br/><span class="err"><form:errors path="Maintenance.notes"></form:errors></span></td>
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
                 
          </table>
           </form>
       <script>
 $(function() {
	 $( "#datepicker1" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker2" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
 <script>
 $(function() {
	 $( "#datepicker3" ).datepicker({dateFormat: 'yy-mm-dd'});
        });
 
</script>
            <script>
            function toggle(value){
            	
            if(value!=null)
            	equipmentid.value=value;
            
            }
            </script>
 <script>
$(document).ready(function()
{
$("#searchbox").keyup(function()
{
var sr=$("#searchbox").val();
$("#suggestion_box").val('');
$.ajax(
{
type:"post",
url:"add_maintenance.jsp",
data:"search="+ sr,
cache:false,
success:function(html)
{
$("#suggestion_box").html(html);
}
});
}); 
});
</script>
            
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
            