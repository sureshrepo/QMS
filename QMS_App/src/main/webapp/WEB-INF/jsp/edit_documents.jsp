<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type='text/javascript' src='//code.jquery.com/jquery-1.10.1.js'></script>
  
<script type="text/javascript">
$(window).load(function(){
	//alert("yes");
	   $(document).on("click", "label.mytxt", function () {
		   alert("ok");
	        var txt = $(".mytxt").text();
	        $(".mytxt").replaceWith("<input class='mytxt'/>");
	        $(".mytxt").val(txt);
	    });
	    $(document).on("blur", "input.mytxt", function () {
	        var txt = $(this).val();
	        $(this).replaceWith("<label class='mytxt'></label>");
	        $(".mytxt").text(txt);
	    });

	});

    </script>   
 
<jsp:include page="header.jsp"></jsp:include>
	<script src="/QMS_App/resources/js/jquery.js"></script>
 <form method="post" enctype="multipart/form-data" action="update_documents">
 
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
     <tr>
        <td>
        <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="select">
									<span>Add Documents</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewdocuments" class="select">
				            		<span>View Documents</span>
				            	</a>
				            </li>
				             <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="document_report" class="select">
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
              <h2>&nbsp;&nbsp;Update Document</h2>
            </div>
            <div class="contentbox">
            <c:set value="${documentMainForm.documentMains[0]}" var="documentMain"></c:set>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             <tr class="row1">
             
               <td valign="middle" align="right" class="input_txt" width="15%"><span class="err">*</span>Document ID:</td>
               <td valign="top" align="left" class="input_txt1" width="15%">
               <c:out value="${documentMain.document_id}"></c:out>
               <input type="hidden" value="${documentMain.document_id}" id="document_id" class="input_txtbx145" style="height:22px;background-color:lightgrey;width:50px;border:none;" name="document_id"/><br/><span class="err"></span></td>
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
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="document_title" class="input_txtbx1"  style="width:200px;" value="${documentMain.document_title}"/><br/><span class="err"><form:errors path="DocumentMain.document_title"></form:errors></span></td>
              
               <td valign="middle" id="id_location_lbl" align="right" class="input_txt" width="20%"><label id="location_label" ><span class="err">*</span> Location:</label><label id="file_upload_label" style="display:none;"><span class="err">*</span> Upload File:</label></td>
               <td valign="top" align="left" id="id_location_txt" class="input_txt" width="25%">
               
               <select id="location_text" name="location" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Lab" <c:if test="${documentMain.location=='Lab'}"><c:out value="Selected"/></c:if>>Lab</option>
               <option value="Shop Floor" <c:if test="${documentMain.location=='Shop Floor'}"><c:out value="Selected"/></c:if>>Shop Floor</option>
               <option value="Office" <c:if test="${documentMain.location=='Office'}"><c:out value="Selected"/></c:if>>Office</option>
               </select>
              <input name="attachments" style="display:none;" id="id_file" type="file" /> <br/>
              <span class="err"><form:errors path="DocumentMain.location"></form:errors></span>
               </td>
          
           <td valign="middle" id="softcopy_file_label" style="display:none;" align="right" class="input_txt" width="20%"><span class="err">*</span></td>
               <td valign="top" id="softcopy_file_upload" style="display:none;" align="left" class="input_txt" width="25%"><div ><br/><span class="err"></span></div></td>
     
          
           <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <select name="document_type" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <option value="Manual" <c:if test="${documentMain.document_type=='Manual'}"><c:out value="Selected"/></c:if>>Manual</option>
               <option value="Procedure" <c:if test="${documentMain.document_type=='Procedure'}"><c:out value="Selected"/></c:if>>Procedure</option>
               <option value="Work Instruction" <c:if test="${documentMain.document_type=='Work Instruction'}"><c:out value="Selected"/></c:if>>Work Instruction</option>
               <option value="Standard" <c:if test="${documentMain.document_type=='Standard'}"><c:out value="Selected"/></c:if>>Standard</option>
               <option value="Goverment Reg" <c:if test="${documentMain.document_type=='Goverment Reg'}"><c:out value="Selected"/></c:if>>Goverment Reg</option>
               <option value="Specification" <c:if test="${documentMain.document_type=='Specification'}"><c:out value="Selected"/></c:if>>Specification</option>
               </select><br/>
               <span class="err"><form:errors path="DocumentMain.document_type"></form:errors></span>
               </td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="process" id="id_inpprocess" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <c:forEach items="${processForm.processes}" var="processes" varStatus="true">
               <option value="<c:out value="${processes.process_name}"/>"><c:out value="${processes.process_name}"/></option>
               </c:forEach>
               
               
               
               </select>
               
               
               <br/><span class="err"><form:errors path="DocumentMain.process"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"></td>
              
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>External Document(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="external" value="1"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="external" value="0" id="id_noforexternal"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               
               </td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
              
             </tr>  
             
		      <tr class="row1" style="border:none;">
           
            <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Issuer:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               
               
               <select name="issuer" id="issuer" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option> 
               <c:forEach items="${employeeForm.employees}" var="employees" varStatus="true">
               <option value="<c:out value="${employees.name}"/>"><c:out value="${employees.name}"/></option>
               </c:forEach>              
               </select>
               
               
               <br/><span class="err"><form:errors path="DocumentMain.issuer"></form:errors></span></td>
            
                <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               <select name="approver1" id="approver1" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>               
               <br/><span class="err"><form:errors path="DocumentMain.approver1"></form:errors></span>
               
               
               </td>
              <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
                 </tr>  
              <tr class="row2" style="border:none;">
              
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="revision_level" name="revision_level" class="input_txtbx1" style="width:200px;" value="${documentMain.revision_level }"/><br/>
              <span class="err"><form:errors path="DocumentMain.revision_level"></form:errors></span>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
 				<select name="approver2" class="input_cmbbx1" id="approver2" style="width:200px;">
             	  <option value="">--Select--</option>
            	   <option value="Apporver name1">Approver name 1</option>
            	   <option value="Approver name2">Approver name 2</option>
            	   <option value="Approver name3">Approver name 3</option>
               </select>
               
               <br/><span class="err"><form:errors path="DocumentMain.approver2"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             <tr class="row1" style="border:none;">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" id="date" name="date" class="input_txtbx1" style="width:200px;" value="${documentMain.date}"/><br/><span class="err"><form:errors path="DocumentMain.date"></form:errors></span></td>
              
                <td valign="middle" align="right" class="input_txt" width="20%">
               
               
               
               <span class="err">*</span>Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
               <select name="approver3" id="approver3" class="input_cmbbx1" style="width:200px;">
               <option value="">--Select--</option>
               <option value="Apporver name1">Approver name 1</option>
               <option value="Approver name2">Approver name 2</option>
               <option value="Approver name3">Approver name 3</option>
               </select>
               
               <br/><span class="err"><form:errors path="DocumentMain.approver3"></form:errors></span></td>
           <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>  
              <tr class="row2" style="border:none;">
                 <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Comments:</td>
               <td valign="top" align="left"><textarea class="input_txtbx1" id="comments"  name="comments"  style="width:100%; height: 89px;" >${documentMain.comments}</textarea><br/><span class="err"></span></td>
         
               <td valign="top" align="right" class="input_txt" width="20%"><span class="err">*</span>Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <select name="status" id="status" class="input_cmbbx1" style="width:200px;">
              <option value="">--Select--</option>
               <option value="Draft" <c:if test="${documentMain.status=='Draft'}"><c:out value="Selected"/></c:if>>Draft</option>
               <option value="Active" <c:if test="${documentMain.status=='Active'}"><c:out value="Selected"/></c:if>>Active</option>
               <option value="Obsolete" <c:if test="${documentMain.status=='Obsolete'}"><c:out value="Selected"/></c:if>>Obsolete</option>
               </select>
                
               <br/><span class="err"><form:errors path="DocumentMain.status"></form:errors></span></td>
            <td valign="top" align="left" class="input_txt" width="20%"><span class="err"></span></td>
             </tr>
             
             
             <tr class="row1" >
             <td colspan="2" align="right">
             <input type="submit" id="submit"  name="submit" value="Submit" class="submit_btn"></td>
             <td colspan="3">
            <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn"></td>
            
             </tr>
            
                     
              </table>
           
           
      </div></td></tr></table></div>
      
</form>
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
