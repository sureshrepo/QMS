<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/jquery-ui.css"
	type="text/css" />
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-ui.js"></script>

<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table" >
	<tr>
		<td>
			<div>
				<ul class="horizmenu">

					<li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="adddocument" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Document</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="viewdocuments" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Document</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="document_report" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Document report</span>
									
								</a>
							</li>
				             <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addform" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_form" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Form</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="form_report" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Form Report</span>
									
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
							<a title="Close" href="maintenance_list">x</a>
						</p>
						<p>
							<img alt="Success" src="resources/images/icons/icon_success.png"><span>Success!</span>.
						</p>
					</div>
			</tr>
		</c:if>
	</tr>
<tr><td>
<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Form Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_doc_form">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Form List by Process :</td>
									<td valign="top" align="left" class="input_txt" width="100%">
									<select name="type_of_form" class="input_cmbbx_big"
									onchange="toggle2(this.value)">
										<option value="human_resources">Human Resources (FHR-XX)</option>
										<option value="engineering">Engineering (FEN-XX)</option>
								   </select>
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
									Name to appear on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="50%">
									<input type="text" name="document_name" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Select Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="auto_number" id="id_field_document_id"/>Auto Number</td>
								<td><input type="checkbox" name="report_field[]" value="location" id="id_field_document_title"/>Location</td>
								<td><input type="checkbox" name="report_field[]" value="form_or_rec_id" id="id_field_document_type"/>Form/Rec Id</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="responsibility" id="id_field_media_type"/>Responsibility</td>
								<td><input type="checkbox" name="report_field[]" value="form_or_rec_titlelocation" id="id_field_location"/>Form/Rec Title</td>
								<td><input type="checkbox" name="report_field[]" value="process" id="id_field_process"/>Process</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="media_type" id="id_field_external"/>Media Type</td>
								<td><input type="checkbox" name="report_field[]" value="retention_time" id="id_field_issuer"/>Retention Time</td>
								<td><input type="checkbox" name="report_field[]" value="form" id="id_field_revision_level"/>Form</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="effective_date" id="id_field_date"/>Effective Date</td>
								<td><input type="checkbox" name="report_field[]" value="document_id" id="id_field_approver1"/>Document Id</td>
								<td><input type="checkbox" name="report_field[]" value="approver1" id="id_field_approver2"/>Approver 1</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="issuer" id="id_field_approver3"/>Issuer</td>
								<!-- <td><input type="checkbox" name="report_field[]" value="status" id="id_field_status"/>Status</td> -->
								<td><input type="checkbox" name="report_field[]" value="comments" id="id_field_comment"/>Comments</td>
					      		</tr>
								</table>
								
								</td>
								
							</tr>
							<tr >
             <td  colspan="2" align="center" width="30%">
             <table><tr style="padding:10px;"><td style="padding:10px;"><input type="submit" id="export"  name="export" value="Generate Report" class="submit_btn1">
             </td><td style="padding:10px;">
              <input type="reset" id="reset_export" name="reset_export" value="Reset" class="submit_btn1"></td>
            
             </tr>
             </table>
             </td>
             </tr>
             </table>
             </form></div>
             </td>
             </tr>
             </table>
             </td>
             </tr>
             </table>
             
             
							
							
							
							
<script type="text/javascript">
/* function toggle2(value){
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
 */

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
 </script>
 
				