<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>

<html>
<head>

<script type="text/javascript" src="js/ajaxpaging.js"></script>
</head>
<body>
<div id="right_content">
	 	<table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
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
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>View Supplier</span>
									
								</a>
							</li>
				            <li  style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="supplierperformance_report" class="<c:choose>
								<c:when test="${menu=='supplier'}">select</c:when><c:otherwise>unselect</c:otherwise></c:choose>">
									<span>Report Supplier</span>
									
								</a>
							</li>
				            
				            </ul>
  </div>
				</td>
				</tr>
				<tr>
				<!-- 	<div class="del_div">
						<p><label style="padding: 0pt 20px 0pt 0pt;"><input type="submit" name="delete" value="" class="icon1" onclick="form.action='?do=deleteparticipant'" /></label></p>

	          		</div>
				</td> -->
			</tr>
			<tr>
        		<td valign="top" align="left">
			        <div class="headings altheading">
			          <h2>View SupplierPerformance</h2>
			        </div>
			        <div class="contentbox">
 			        <div style="border:#ccc 2px solid; padding:15px; margin-bottom:15px;">
							<form action="findsupplierperformance" method="GET">
							
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
							  <tr>
							    <td align="left" valign="middle" width="10%">Supplier Name:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="supplier_name" class="input_txtbox" id="suppliername"></td>
							    <td align="left" valign="middle" width="15%">&nbsp;&nbsp;Phone:</td>
								<td align="left" valign="middle" width="10%"><input type="text" name="phone" id="phone" class="input_txtbox"></td>							    
							    <td align="left" valign="middle" width="8%">&nbsp;&nbsp;Email:</td>
							    <td align="left" valign="middle" width="10%"><input type="text" name="email_address" id="email" class="input_txtbox"></td>
							    <td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Find" name="findsupplierperformance" ></td>
							  	<td align="center" valign="middle" width="20%"><input type="submit" class="submit_btn" value="Clear" name="welcome" ></td>
							  
							  </tr>
							  
							</table>
							</form>
						</div> 

	<form action="?do=viewparticipants" name="dashboard" method="POST">
   				
				        <table cellpadding="0" cellspacing="0" border="0" width="100%">
				        
				        
							<tr class="title">
								<!-- <td valign="center" align="left" width="5%"><input type="checkbox" onclick="selectall(this.form)" value="" name="checkall"></td> -->
         						<td valign="top" align="left" width="10%">&nbsp;Supplier ID</td>
					         	<td valign="top" align="left" width="10%">Supplier Name</td>
					         <!--	<td valign="top" align="left" width="10%">Category</td> -->
								<!-- <td valign="top" align="left" width="15%">Address</td>
          						<td valign="top" align="left" width="5%">City</td>
          						<td valign="top" align="left" width="10%">State</td>
          						<td valign="top" align="left" width="20%">Postal Code</td>
          						<td valign="top" align="left" width="5%">Country</td>
          						<td valign="top" align="left" width="10%">Website</td>
          						<!-- <td valign="top" align="left" width="30%">Certified to</td> -->
          				<!-- 		<td valign="top" align="left" width="15%">Contact name</td> -->
          						<!-- <td valign="top" align="left" width="30%">Contact Title</td> -->
          						<td valign="top" align="left" >Phone</td>
          					<!-- 	<td valign="top" align="left" width="10%">Fax</td> -->
          						<td valign="top" align="left" >e_mail address</td>
          						<td valign="top" align="left" >Actions</td>
        					</tr>
						
						
						<% int i=1; %>
							       		
									<c:forEach items="${supplierPerformanceForm.supplierperformance}" var="supplierperformance" varStatus="status">
							       		<% if(i==1)
							       			i=2;
							       			else
							       			i=1;%>
							       		<tr class="row<%=i%>" ">
								           	<td valign="top" align="left"  width="15%"><a href="list_supplierperformance?supplier_id=${supplierperformance.supplier_id}">${supplierperformance.supplier_id}</a></td>
											<td valign="top" align="left" width="15%">${supplierperformance.supplier_name}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.phone}</td>
											<td valign="top" align="left" width="15%">${supplierperformance.email_address}</td>
											<td valign="top" align="left" width="15%">
										
											<a href="#" title="" ><img src="resources/images/icons/icon_edit.png" alt="Edit" /></a><a href="<c:out value="editsupplierperformance?sid=${supplierperformance.supplier_id}"/>" style="padding-right:10px;">Edit</a>
											<a href="#" title=""><img src="resources/images/icons/icon_delete.png" alt="Delete" /></a><a href="<c:out value="deletesupplierperformance?sid=${supplierperformance.supplier_id}"/>" onclick="return confirmation()">Remove</a>
											</td>
											</tr>
							    	</c:forEach>
						    	
						
						
						</table>
						</form>
					</div>
				</td>
				</tr>
				<tr>
				<td colspan="6">  
	<div class="extrabottom">
             <ul class="pagination">
        
             <c:if test="${currentpage!=1&&currentpage!=null}">
             <li class="page_unselect"><a href="viewsupplierreport_page?page=${currentpage - 1}" >Prev</a></li> 
               </c:if>
              
             <%-- <c:forEach var="count" begin="1" end="${noofrows}"> --%> 
               <c:forEach begin="1" end="${noofpages}" var="i">
                <c:choose>
                    <c:when test="${currentpage eq i}">
                      <li class="page"><a class="paging_select"><c:out value="${i}"></c:out></a></li>
                     </c:when>
                    <c:otherwise>
                        <li class="page_unselect"><a href="viewsupplierreport_page?page=${i}"><c:out value="${i}"></c:out></a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>          
            <c:if test="${currentpage!=noofpages}">
              <li class="page_unselect"><a href="viewsupplierreport_page?page=${currentpage+1}">Next</a></li> 
                 </c:if>
              <c:choose>
              <c:when test="${button=='viewall'}">
                  <li class="page"><a href="viewallsupplierreport" class="paging_select">ViewAll</a></li>
             </c:when>
                <c:otherwise>
                  <li class="page"><a href="view_supplierperformance" class="paging_select">Back</a></li>
              </c:otherwise>
              </c:choose>					
		 
		  </ul>
		  </div>
		  </td>
				
			</tr>
		</table> 
	
</div>

<script>
function confirmation() {
	var answer = confirm("Are you Sure You Want to Delete Supplier Performance Form ?")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}


</script>

<script language="javascript">

function selectall(field)
{
	//field.getElementByTagName('checkbox');
	if(document.grid.checkall.checked==true)
	{
		for (i = 0; i < field.length; i++)
			field[i].checked = true ;
	}
	else
	{
		for(i = 0; i < field.length; i++)
			field[i].checked = false;
	}
}

function validate(fname)
{
// alert(fname);
var chks = document.getElementsByName('checkbox[]');

var hasChecked = false;
for (var i = 0; i < chks.length; i++)
{
if (chks[i].checked)
{
hasChecked = true;
break;
}
}
if (hasChecked == false)
{
alert("Please select at least one.");
return false;
}
return true;
}

 function findpart()
{
 alert(document.getElementById("suppliername").value);
 alert(document.getElementById("phone").value);
 alert(document.getElementById("city").value);
window.location="?do=viewsupplierperformance&suppliername="+document.getElementById("suppliername").value+"&phone="+document.getElementById("phone").value+"&city="+document.getElementById("city").value;
}


</script>

<%-- <jsp:include page="footer.jsp"></jsp:include> --%>