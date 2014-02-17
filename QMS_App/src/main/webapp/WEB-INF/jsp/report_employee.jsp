<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script>

 function validation()
 {

 document.getElementById("start").style.display="block";
 
 }
 function validation1()
 {

 document.getElementById("start").style.display="none";
  }
 
</script>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu">

					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addemployee" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Employees</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewemployees" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Employees</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="employee_report" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Reports</span>
									
								</a>
							</li>
				             
				</ul>
			</div></td>
	</tr>
	<tr>
		<c:if test="${success==true}">
			<tr>
				<td valign="top" align="left" style="padding: 5px 0 10px 0;">&nbsp;
					<div id="success_statusbar" class="status success">
						<p class="closestatus">
							<a title="Close" href="employee_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Employee Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_employee_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select Employee Report Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<br>
								<br>
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_training_needs" checked/>Training Needs<br/>
								<input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_training_report_for_each_employee"/>Training Report for Each Employee<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_qualification_for_each_employee"/>Qualification for each employee<br/>
								  <input type="radio" onclick="validation()" name="doc_type" value="3" id="id_open_training"/>Open Training<br/>
								   <input type="radio" onclick="validation()" name="doc_type" value="4" id="id_open_training_effectiveness"/>Open Training Effectiveness<br/> 
								    <input type="radio" onclick="validation()" name="doc_type" value="5" id="id_past_due_training_by_trainer"/>Past-due training by trainer<br/>
								
								</td>
								</tr>
								
								<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<input type="radio" onchange="toggle3(this.value)" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" onchange="toggle3(this.value)" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
									
								</td>
								
							</tr>
						
						</table>
						
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
						
						
							<!-- <tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report Type:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="radio" name="report_type" value="0" id="id_type_standard" checked/>Standard Report&nbsp;&nbsp;&nbsp;
								<input type="radio" name="report_type" value="1" id="id_type_userdefined"/>User Defined Report<br/>
							
								</td>
								
							</tr> -->
							<tr class="row1" id="userdefined_name" style="display:none;">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Enter the Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="name" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="employee_id" id="id_employee_id"/>Employee id</td>
								<td><input type="checkbox" name="report_field[]" value="name" id="id_name"/>name</td>
								<td><input type="checkbox" name="report_field[]" value="job_title" id="id_job_title"/>Job Title</td>
					      		<td><input type="checkbox" name="report_field[]" value="date_hired" id="id_date_hired"/>Date Hired</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="attachments" id="id_attachments"/>Attachments</td>
								<td><input type="checkbox" name="report_field[]" value="list_of_function_needs" id="id_list_of_function_needs"/>List of function needs</td>
								<td><input type="checkbox" name="report_field[]" value="documented_in" id="id_documented_in"/>documented In</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="qualified_by" id="id_qualified_by"/>Qualified By</td>
								<td><input type="checkbox" name="report_field[]" value="type_of_training" id="id_type_of_training"/>Type of Training</td>
								<td><input type="checkbox" name="report_field[]" value="trainer" id="id_trainer"/>Trainer</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="training_due_date" id="id_training_due_date"/>Training Due Date</td>
								<td><input type="checkbox" name="report_field[]" value="training_completion_date" id="id_training_completion_date"/>Completion Date</td>
								<td><input type="checkbox" name="report_field[]" value="training_effectiveness_review_due_date" id="id_training_effectiveness_review_due_date"/>Review Due Date</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="training_effectiveness_notes" id="id_training_effectiveness_notes"/>Effectiveness Notes</td>
								</tr>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate Report" class="submit_btn2">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn"></td>
            
             </tr></table>
            
           
             </tr>
            
							
						</table>
						</form>
					</div>
				</td></tr>
</table></td></tr></table>

<script type="text/javascript">

$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker" ).datepicker();
          
        });
$(function() {
	 var format="yy-mm-dd";
          $( "#datepicker1" ).datepicker();
          
        });

 function toggle2(value){
    var e3=document.getElementById("document_type_table");
if(value=="document_list_by_type")
    {
	
	e3.style.display="table-row";
	
    }
else
    {
	
	e3.style.display="none";
  
    }
    
}
function toggle3(value){
	
    var e1=document.getElementById("userdefined_name");
    var e2=document.getElementById("userdefined_fields");
if(value==1)
    {
	
	e1.style.display="table-row";
	e2.style.display="table-row";
    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}



 function toggle1(value){
	alert(value);
	document.getElementById("reportdate").style.display="block";
    //var e1=document.getElementById("startdate");
    
if(value==2)
    {
	alert("jhsghjsa");
	document.getElementById("reportdate").style.display="block";

    }
if(value==0)
    {
	
	e1.style.display="none";
	e2.style.display="none";
  
    }
    
}
</script>
  <jsp:include page="footer.jsp"></jsp:include>