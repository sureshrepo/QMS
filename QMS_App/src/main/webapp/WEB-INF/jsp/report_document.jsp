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

					<li
						style="float: left; margin-right: 8px; text-transform: uppercase;">
						<a href="addinternalaudits"
						class="select">
							<span> Add Internal Audits</span> </a></li>

					<li
						style="float: left; margin-right: 8px; text-transform: uppercase;">
						<a href="view_internalaudits"
						class="select" rel="ddsubmenu1"> <span>View Internal Audits</span> </a></li>
					<li
						style="float: left; margin-right: 8px; text-transform: uppercase;">
						<a href="internalaudit_report"
						class="select" rel="ddsubmenu1"> <span>Reports</span> </a></li>
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
<table cellpadding="0" cellspacing="0" border="0" width="98%"
	class="margin_table">
	<tr>
		<td valign="top" align="left">
				<div class="headings altheading">
					<h2>Document Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_doc_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr class="row2">
								<td valign="middle" align="right" class="input_txt" width="30%">
									Select Report :</td>
								<td valign="top" align="left" class="input_txt" width="100%">
									<select name="type_of_report" class="input_cmbbx_big"
									onchange="toggle2(this.value)">
										<option value="document_list_by_type">Document List by type</option>
										<option value="external_document">External Document</option>
								   </select>
								</td>
								
							</tr>
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select Document Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<input type="radio" name="doc_type" value="0" id="id_type_manual" checked/>Manual<br/>
								<input type="radio" name="doc_type" value="1" id="id_type_procedure"/>Procedure<br/>
								<input type="radio"  name="doc_type" value="2" id="id_type_workinstruction"/>Work-Instruction<br/>
								<input type="radio"  name="doc_type" value="3" id="id_type_standard"/>Standard<br/>
								<input type="radio"  name="doc_type" value="4" id="id_type_gov_regulation"/>Goverment Regulation<br/>
								<input type="radio" name="doc_type" value="5" id="id_type_manual"/>Specification<br/>
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
								<td><input type="checkbox" name="report_field[]" value="document_id" id="id_field_document_id"/>Document ID</td>
								<td><input type="checkbox" name="report_field[]" value="document_title" id="id_field_document_title"/>Document Title</td>
								<td><input type="checkbox" name="report_field[]" value="document_type" id="id_field_document_type"/>Document Type</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="media_type" id="id_field_media_type"/>Media Type</td>
								<td><input type="checkbox" name="report_field[]" value="location" id="id_field_location"/>Location(s)</td>
								<td><input type="checkbox" name="report_field[]" value="process" id="id_field_process"/>Process</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="external" id="id_field_external"/>External?</td>
								<td><input type="checkbox" name="report_field[]" value="issuer" id="id_field_issuer"/>Issuer</td>
								<td><input type="checkbox" name="report_field[]" value="revision_level" id="id_field_revision_level"/>Revision Level</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="date" id="id_field_date"/>Date</td>
								<td><input type="checkbox" name="report_field[]" value="approver1" id="id_field_approver1"/>Approver 1</td>
								<td><input type="checkbox" name="report_field[]" value="approver2" id="id_field_approver2"/>Approver 2</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="approver3" id="id_field_approver3"/>Approver 3</td>
								<td><input type="checkbox" name="report_field[]" value="status" id="id_field_status"/>Status</td>
								<td><input type="checkbox" name="report_field[]" value="comments" id="id_field_comment"/>Comment/Changes</td>
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
</script>
  <jsp:include page="footer.jsp"></jsp:include>