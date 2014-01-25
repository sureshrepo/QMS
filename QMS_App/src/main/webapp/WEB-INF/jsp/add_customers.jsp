<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="header.jsp"></jsp:include>

<form method="post" action="addcustomer">
  <div id="right_content">
    <table cellpadding="0" cellspacing="0" border="0" width="98%" class="margin_table">
      <tr>
        <td>
         <div>
  <ul class="horizmenu">
						
							<li style=" float:left;margin-right:8px;text-transform:uppercase;">
								<a href="addcustomer" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>">
									<span>Add Customers</span>
								</a>
							</li>
						
				           <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewcustomers" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View Customers</span>
				            	</a>
				            </li>
				            <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="addfeedback" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>Add feedback</span>
				            	</a>
				            </li>
				            <li style=" float:left;margin-right:8px;text-transform:uppercase;">
				            	<a href="viewfeedback" class="<c:choose><c:when test="${true}">select</c:when><c:otherwise></c:otherwise></c:choose>" rel="ddsubmenu1">
				            		<span>View feedback</span>
				            	</a>
				            </li>
				            </ul>
  </div>
        </td>
      </tr>
      <tr>
        <td valign="top" align="left"><div>
            <div class="headings altheading">
              <h2>Add Customer</h2>
            </div>
            <div class="contentbox">
             <c:choose>
				<c:when test="${empty customer}">
              <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Customer ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="customer_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Customer Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="customer_name" class="input_txtbx" id="inp_customer_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.customer_name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Address :</td>
               	<td><textarea class="input_txtbx1" id="inp_address" name="address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note"></textarea><br/><span class="err"><form:errors path="Customers.address"></form:errors></span></td>
									  </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> City :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="city" class="input_txtbx" id="inp_city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.city"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> State :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="state" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.state"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Country :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="country" class="input_txtbx" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.country"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> ZipCode :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="zipcode" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.zipcode"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Website :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="website" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.website"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Contact Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.contact_name"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Title of Contact :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="title_of_contact" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.title_of_contact"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Telephone :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="telephone" class="input_txtbx" id="inp_telephone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.telephone"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Fax :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="fax" class="input_txtbx" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.fax"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Email Address :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="" /></br><span class="err"><form:errors path="Customers.email_address"></form:errors></span></td>
                </tr>
                
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Customer" class="submit_btn1"></td>
                </tr>
              </table>
              </c:when>
              <c:otherwise>
               <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Customer ID:</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="hidden" name="customer_id" value="<c:out value="${id }"/>"/><c:out value="${id }"/><br/><span class="err"></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span>Customer Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="customer_name" class="input_txtbx" id="inp_customer_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.customer_name}" /></br><span class="err"><form:errors path="Customers.customer_name"></form:errors></span></td>
                </tr>
		<tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Address :</td>
               	<td><textarea class="input_txtbx1" id="inp_address" name="address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');"  style="width: 177px; height: 89px;" name="note">${customer.address}</textarea><br/><span class="err"><form:errors path="Customers.address"></form:errors></span></td>
									  </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> City :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="city" class="input_txtbx" id="inp_city" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.city}" /></br><span class="err"><form:errors path="Customers.city"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> State :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="state" class="input_txtbx" id="inp_state" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.state}" /></br><span class="err"><form:errors path="Customers.state"></form:errors></span></td>
                </tr>
                <tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Country :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="country" class="input_txtbx" id="inp_country" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.country}" /></br><span class="err"><form:errors path="Customers.country"></form:errors></span></td>
                </tr>
                <tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> ZipCode :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="zipcode" class="input_txtbx" id="inp_zipcode" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.zipcode}" /></br><span class="err"><form:errors path="Customers.zipcode"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Website :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="website" class="input_txtbx" id="inp_website" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.website}" /></br><span class="err"><form:errors path="Customers.website"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Contact Name :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="contact_name" class="input_txtbx" id="inp_contact_name" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.contact_name}" /></br><span class="err"><form:errors path="Customers.contact_name"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Title of Contact :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="title_of_contact" class="input_txtbx" id="inp_title_of_contact" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.title_of_contact}" /></br><span class="err"><form:errors path="Customers.title_of_contact"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Telephone :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="telephone" class="input_txtbx" id="inp_telephone" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.telephone}" /></br><span class="err"><form:errors path="Customers.telephone"></form:errors></span></td>
                </tr><tr class="row1">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Fax :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="fax" class="input_txtbx" id="inp_fax" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.fax}" /></br><span class="err"><form:errors path="Customers.fax"></form:errors></span></td>
                </tr><tr class="row2">
                  <td valign="middle" align="right" class="input_txt" width="30%"><span class="err">*</span> Email Address :</td>
                  <td valign="top" align="left" class="input_txt" width="70%"><input type="text" name="email_address" class="input_txtbx" id="inp_email_address" onmouseover="showTooltip('tooltip_id','inp_id3');" onmouseout="hideTooltip('tooltip_id');" value="${customer.email_address}" /></br><span class="err"><form:errors path="Customers.email_address"></form:errors></span></td>
                </tr>
                
                 <tr class="row1">
                  <td valign="top" align="right">&nbsp;</td>
                  <td valign="top" align="left"><input type="submit" value="Add Customer" class="submit_btn1"></td>
                </tr>
              </table>
              </c:otherwise>
              </c:choose>
            </div>
          </div></td>
      </tr>
      </table>
      </div>
      
</form>
      <jsp:include page="footer.jsp"></jsp:include>
