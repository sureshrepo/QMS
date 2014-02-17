<%-- <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Supplier</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Report Supplier</span>
									
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
							<a title="Close" href="supplierperformance_list">x</a>
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
					<h2>SupplierPerformance Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_supplierperformance_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select SupplierPerformance Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<br>
								<br>
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_open_supplierperformance" checked/>Open SupplierPerformance<br/>
								<!-- <input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_disposition"/>No Disposition Over 30 Days<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_cost_of_nonconformance"/>Cost of Non-Conformance<br/> 
								 -->
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
									<input type="text" name="supplier_name" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="supplier_id" id="id_supplier_id"/>ID</td>
								<td><input type="checkbox" name="report_field[]" value="supplier_name" id="id_name"/>Name</td>
								<td><input type="checkbox" name="report_field[]" value="category" id="id_category"/>category</td>
					      		<td><input type="checkbox" name="report_field[]" value="address" id="id_address"/>address</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="city" id="id_city"/>city</td>
								<td><input type="checkbox" name="report_field[]" value="state" id="id_state"/>state</td>
								<td><input type="checkbox" name="report_field[]" value="postalcode" id="id_postalcode"/>postalcode</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="country" id="id_country"/>Country</td>
								<td><input type="checkbox" name="report_field[]" value="website" id="id_website"/>Website</td>
								<td><input type="checkbox" name="report_field[]" value="certified_to" id="id_certified_to"/>Certified To</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="contact_name" id="id_contact_name"/>Contact Name</td>
								<td><input type="checkbox" name="report_field[]" value="contact_title" id="id_contact_title"/>Contact Title</td>
								<td><input type="checkbox" name="report_field[]" value="phone" id="id_phone"/>Phone</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="fax" id="id_fax"/>Fax</td>
								<td><input type="checkbox" name="report_field[]" value="email_address" id="id_email_address"/>Email Address</td>
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
  <jsp:include page="footer.jsp"></jsp:include> --%>
  
  
  
  
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
								<a href="add_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Add Supplier</span>
									
								</a>
							</li>
						
				          <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="view_supplierperformance" class="<c:choose>
								<c:when test="${menu==''}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='document'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Report Supplier</span>
									
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
							<a title="Close" href="supplierperformance_list">x</a>
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
					<h2>SupplierPerformance Report</h2>
				</div>
				<div class="contentbox">
					<form method="post" action="generate_supplierperformance_report">
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							
							<tr class="row1" id="document_type_table">
								<td valign="middle" align="right" class="input_txt" width="30%">
								Select SupplierPerformance Type :
								</td>
								<td valign="middle" align="left" class="input_txt" width="100%">
								<!-- <input type="radio" name="doc_type" value="0" id="id_type_manual" checked/><br/> -->
								
								<br>
								<br>
								<input type="radio" onchange="validation1()" name="doc_type" value="0" id="id_open_supplierperformance" checked/>Open SupplierPerformance<br/>
								<!-- <input type="radio"  onclick="validation1()"  name="doc_type" value="1" id="id_disposition"/>No Disposition Over 30 Days<br/>
								 <input type="radio" onclick="validation()" name="doc_type" value="2" id="id_cost_of_nonconformance"/>Cost of Non-Conformance<br/> 
								 -->
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
									<input type="text" name="supplier_name" class="input_txtbx1"  style="width:40%;" value=""/>
								</td>
								
							</tr>
							<tr class="row2" id="userdefined_fields" style="display:none;">
								<td valign="top" align="right" style="margin-top:2px;" class="input_txt" width="30%">
									Enter the Fields Required on the Report:</td>
								<td valign="top" align="left" class="input_txt" width="100%">
								<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tr>
								<td><input type="checkbox" name="report_field[]" value="supplier_id" id="id_supplier_id"/>ID</td>
								<td><input type="checkbox" name="report_field[]" value="supplier_name" id="id_name"/>Name</td>
								<td><input type="checkbox" name="report_field[]" value="category" id="id_category"/>category</td>
					      		<td><input type="checkbox" name="report_field[]" value="address" id="id_address"/>address</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="city" id="id_city"/>city</td>
								<td><input type="checkbox" name="report_field[]" value="state" id="id_state"/>state</td>
								<td><input type="checkbox" name="report_field[]" value="postalcode" id="id_postalcode"/>postalcode</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="country" id="id_country"/>Country</td>
								<td><input type="checkbox" name="report_field[]" value="website" id="id_website"/>Website</td>
								<td><input type="checkbox" name="report_field[]" value="certified_to" id="id_certified_to"/>Certified To</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="contact_name" id="id_contact_name"/>Contact Name</td>
								<td><input type="checkbox" name="report_field[]" value="contact_title" id="id_contact_title"/>Contact Title</td>
								<td><input type="checkbox" name="report_field[]" value="phone" id="id_phone"/>Phone</td>
					      		</tr>
					      		<tr>
								<td><input type="checkbox" name="report_field[]" value="fax" id="id_fax"/>Fax</td>
								<td><input type="checkbox" name="report_field[]" value="email_address" id="id_email_address"/>Email Address</td>
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