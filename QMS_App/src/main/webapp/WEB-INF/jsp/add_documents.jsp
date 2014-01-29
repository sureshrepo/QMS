<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
<script type="text/javascript">
 $(window).load(function(){
var oldValue = "";
$("#save_exdocument").click(function() {
	alert("java");
	var issuer = $('#issuer').val();
	var document_id=$('#document_type').val()+'-'+$('#document_id').val();;
	var approver1=$('#approver1').val();
	var approver2=$('#approver2').val();
	var approver3=$('#approver3').val();
	var revision_level=$('#revision_level').val();
	var date=$('#date').val();
	var comments=$('#comments').val();
	var status=$('#status').val();
	$.ajax({
		type : "POST",
		url : "/QMS_App/addexternaldoc",
		data : "issuer="+issuer+"&document_id="+document_id+"&approver1="+approver1+"&approver2="+approver2+"&approver3="+approver3+"&revision_level="+revision_level+"&date="+date+"&comments="+comments+"&status="+status,
		success : function(response) {
			// we have the response  
			$('#document_table').html(response);
			  var e = document.getElementById('external_doc_table');
		      // var e1=document.getElementById('employee');
		if(value==0)
		       {
			e.style.display="none";
		       }
		else
		       {
			e.style.display="block";
		       }
			/*     $('#education').val(''); */
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
})
$("#remove").click(function() {
	alert("java");
	var issuer = $('#issuer').val();
	var document_id=$('#document_type').val()+'-'+$('#document_id').val();;
	var approver1=$('#approver1').val();
	var approver2=$('#approver2').val();
	var approver3=$('#approver3').val();
	var revision_level=$('#revision_level').val();
	var date=$('#date').val();
	var comments=$('#comments').val();
	var status=$('#status').val();
	$.ajax({
		type : "POST",
		url : "/QMS_App/addexternaldoc",
		data : "issuer="+issuer+"&document_id="+document_id+"&approver1="+approver1+"&approver2="+approver2+"&approver3="+approver3+"&revision_level="+revision_level+"&date="+date+"&comments="+comments+"&status="+status,
		success : function(response) {
			// we have the response  
			$('#document_table').html(response);
			  var e = document.getElementById('external_doc_table');
		      // var e1=document.getElementById('employee');
		if(value==0)
		       {
			e.style.display="none";
		       }
		else
		       {
			e.style.display="block";
		       }
			/*     $('#education').val(''); */
		},
		error : function(e) {
			alert('Error: ' + e);
		}
	});
})
});

 
 
</script>
 <form method="post" enctype="multipart/form-data" action="insert_documents">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>&nbsp;&nbsp;Add Document</h2>
            </div>
            <div class="contentbox">
            <center>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             <tr class="row1">
               <td valign="middle" align="right" class="input_txt" width="15%"><span class="err">*</span>Document ID:</td>
               <td valign="top" align="left" class="input_txt1" width="15%"><select name="document_type" id="document_type" class="input_cmbbx1" style="width:57px;">
               <option value="PM">PM</option>
               <option value="QSP">QSP</option>
               <option value="WI">WI</option>
               <option value="SD">SD</option>
               <option value="GR">GR</option>
               <option value="SP">SP</option>
               </select><input type="hidden" name="document_id_hidden"  class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/>&nbsp;-&nbsp;<input type="text" value="" id="document_id" class="input_txtbx1" style="height:25px;width:50px;" name="document_id"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <!-- <select name="media_type" class="input_cmbbx1" onchange="">
               <option onclick="toggle2(this.value);" value="Hard Copy">Hard Copy</option>
               <option onclick="toggle2(this.value);" value="Electronic">Electronic</option>
               </select> -->
                <input type="radio" name="media_type" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="media_type" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
                    
               </td>
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document Title:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="document_title" class="input_txtbx1"  style="width:200px;" value=""/><br/><span class="err"></span></td>
              
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%"><label id="location_label" ><span class="err">*</span> Location:</label><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value="Nil">--Select--</option>
               <option value="Lab">Lab</option>
               <option value="Shop Floor">Shop Floor</option>
               <option value="Office">Office</option>
               </select>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> 
               </td>
          
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"><span class="err">*</span></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/><span class="err"></span></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <select name="document_type" class="input_cmbbx1" style="width:200px;">
               <option value="Manual">Manual</option>
               <option value="Procedure">Procedure</option>
               <option value="Work Instruction">Work Instruction</option>
               <option value="Standard">Standard</option>
               <option value="Goverment Reg">Goverment Reg</option>
               <option value="Specification">Specification</option>
               </select>
               </td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="good"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>
               
               
               
               </select>
               
               
               <br/><span class="err"></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>External Document(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="external" value="1" onchange="toggle3(this.value);"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="external" value="0" id="id_noforexternal" onchange="toggle3(this.value);"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               
               </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>  
             
              
            
             <tr>
             <td colspan="5" style="padding:5px 0px 5px 0px;">
              <table cellpadding="0" cellspacing="0" border="0" width="100%" id="document_table">
		    	</table>
		    	</td>
		    	</tr>
		    	<tr>
             <td colspan="5">
             
             
             <div id="external_doc_table" style="display:none;padding:5px;">
            
             <table cellpadding="0" cellspacing="0"  width="100%" style="border:solid 2px gainsboro;">
             <tr class="row1">
         <td colspan="5">
         <h2>Add External Document</h2>
         </td>
             </tr>  
          	<tr>
						<td >
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
             <tr class="row2" style="border:none;">
            <!--     <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span></td>
               <td valign="top" align="left" class="input_txt" width="20%"></td>
            -->
            <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Issuer:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               
               
               <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
               
               
               <br/><span class="err"></span></td>
            
                <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <select name="approver1" id="approver1" class="input_cmbbx1" style="width:200px;">
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>               
               <br/><span class="err"></span>
               
               
               </td>
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                 </tr>  
              <tr class="row1" style="border:none;">
              
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="revision_level" name="revision_level" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
              
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
 <select name="approver2" class="input_cmbbx1" id="approver2" style="width:200px;">
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>
               
               <br/><span class="err"></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             <tr class="row2" style="border:none;">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="date" name="date" class="input_txtbx1" style="width:200px;" value=""/><br/><span class="err"></span></td>
              
                <td valign="middle" align="right" class="input_txt" width="20%">
               
               
               
               <span class="err">*</span>Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="approver3" id="approver3" class="input_cmbbx1" style="width:200px;">
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>
               
               <br/><span class="err"></span></td>
           <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>  
              <tr class="row1" style="border:none;">
                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" ></textarea><br/><span class="err"></span></td>
         
               <td valign="top" align="right" class="input_txt" width="20%"><span class="err">*</span>Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <select name="status" id="status" class="input_cmbbx1" style="width:200px;">
               <option value="Draft">Draft</option>
               <option value="Active">Active</option>
               <option value="Obsolete">Obsolete</option>
               </select>
                
               <br/><span class="err"></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
              <tr class="row2">
              
               <td valign="middle" align="left" colspan="2"><input type="button" id="save_exdocument" name="save_exdocument" value="Add" class="submit_btn"></td>
             
             </tr>
             <!-- <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="right"  colspan="3"><input type="button" name="save_exdocument" value="One More Document" class="submit_btn2"></td>
                </tr> --></table>
                 </td></tr>
             </table></div>
             
             
             </td>
             </tr>
             
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="save_exdocument"  name="save_exdocument" value="Submit" class="submit_btn"></td>
             <td colspan="3">
            <input type="reset" id="save_exdocument" name="save_exdocument" value="Reset" class="submit_btn"></td>
            
             </tr>
             
             
             
                     
              </table>
              
             </center> 
            </div>
          </div></td>
      </tr>
      </table>
    
      </div>
      
</form>
 <script type="text/javascript">
function toggle3(value){
     
       var e = document.getElementById('external_doc_table');
       var e1=document.getElementById("document_table");
      // var e1=document.getElementById('employee');
if(value==0)
       {
	e.style.display="none";
	e1.style.display="none";
       }
else
       {
	e.style.display="block";
	e1.style.display="block";
       }
       
}
</script>

<script type="text/javascript">
function toggle2(value){
  
    var e = document.getElementById('location_label');
    var e1 = document.getElementById('file_upload_label');
    var e2=document.getElementById('location_text');
    var e3=document.getElementById('id_file');
if(value==1)
    {
	e.style.display="none";
	e1.style.display="block";
	e2.style.display="none";
	e3.style.display="block";
	
    }
else if(value==0)
    {
	e.style.display="block";
	e1.style.display="none";
	e2.style.display="block";
	e3.style.display="none";
  
    }
    
}
</script>
      <jsp:include page="footer.jsp"></jsp:include>
