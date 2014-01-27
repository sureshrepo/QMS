<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="addcustomer">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td valign="top" align="left" style="padding:5px 0 10px 0;"></td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
            <center>
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
             <tr class="row1">
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Document ID:</td>
               <td valign="top" align="left" class="input_txt1" width="20%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Media Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
                <input type="radio" name="mediatype" onchange="toggle2(this.value);" value="0"   id="id_hardcopy"  checked/>Hard Copy&nbsp;&nbsp;&nbsp;<input type="radio" name="mediatype" onchange="toggle2(this.value);" value="1"  id="id_electronic" onchange="toggle2(this.value);" />Electronic&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
             
               
               </td>
           
             </tr>  
              <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document Title:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="customer_id" class="input_txtbx1"  style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
              
               <td valign="middle" align="right" class="input_txt" width="20%"><div id="id_location_lbl" style="display:block;"><span class="err">*</span>Location:</div></td>
               <td valign="top" align="left" class="input_txt" width="25%"><div id="id_location_txt" style="display:block;"><input type="text" name="customer_id" class="input_txtbx1" id="id_location" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></div></td>
           
             </tr> 
             <tr class="row1">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document Type:</td>
               <td valign="top" align="left" class="input_txt" width="20%">
               <select name="media_type" class="input_cmbbx1">
               <option>Manual</option>
               <option>Procedure</option>
               <option>Work Instruction</option>
               <option>Standard</option>
               <option>Goverment Reg</option>
               <option>Specification</option>
               </select>
               </td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Process:</td>
               <td valign="top" align="left" class="input_txt" width="25%"><input type="text" name="customer_id" class="input_txtbx1"  style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
            
             </tr> 
             <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt" width="25%">
               <td valign="top" align="left" class="input_txt" width="20%">
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>External Document(Y/N):</td>
               <td valign="top" align="left" class="input_txt" width="25%">
               
              <input type="radio" name="gender" value="1" onchange="toggle3(this.value);"  id="id_yesforexternal">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="0" id="id_noforexternal" onchange="toggle3(this.value);"  checked>No&nbsp;&nbsp;&nbsp;<br/><span class="err"></span>
               
               </td>
            
             </tr>  
            
            
            
             <tr>
             <td colspan="4">
             <div id="external_doc_table" style="display:none;">
             <table cellpadding="0" cellspacing="0" border="0" width="100%" >
             <tr class="row1">
         <td colspan="4">
         <h2>Add External Document</h2>
         </td>
             </tr>  
             <tr class="row2" style="border:none;">
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Document ID:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 1(Process Owner):</td>
               <td valign="top" align="left" class="input_txt" width="25%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
           
             </tr>  
              <tr class="row1" style="border:none;">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Issuer:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 2(Doc Control):</td>
               <td valign="top" align="left" class="input_txt" width="25%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
            
             </tr>
             <tr class="row2" style="border:none;">
                <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Revision Level:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Approver 3(Mgmt Report):</td>
               <td valign="top" align="left" class="input_txt" width="25%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
           
             </tr>  
              <tr class="row1" style="border:none;">
              
               <td valign="middle" align="right" class="input_txt" width="25%"><span class="err">*</span>Date:</td>
               <td valign="top" align="left" class="input_txt" width="20%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
               <td valign="middle" align="right" class="input_txt" width="20%"><span class="err">*</span>Status:</td>
               <td valign="top" align="left" class="input_txt" width="25%"><input type="text" name="customer_id" class="input_txtbx1" style="width:200px;" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
            
             </tr>
              <tr class="row2">
              
               <td valign="middle" align="right" class="input_txt"><span class="err">*</span>Comments:</td>
               <td valign="top" align="left"  colspan="3"><textarea class="input_txtbx1"  name="customer_id"  style="width:50%; height: 89px;" ><c:out value="${id }"/></textarea><br/><span class="err"></span></td>
            
             </tr>
              <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="right"  colspan="3"><input type="submit" value="One More Document" class="submit_btn2"></td>
                </tr>
             </table></div>
             </td>
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
</script>

<script type="text/javascript">
function toggle2(value){
  //  alert("yes");
    var e = document.getElementById('id_location_lbl');
    var e1 = document.getElementById('id_location_txt');
if(value==1)
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
      <jsp:include page="footer.jsp"></jsp:include>
