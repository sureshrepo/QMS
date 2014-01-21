<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div>
<h2>Create a free account</h2>

<sf:form action="submituser" method="POST" modelAttribute="userProfile">         
   <fieldset> 
   <table cellspacing="0">
      <tr>
         <th><sf:label path="fullName">Full name:</sf:label></th>
         <td><sf:input path="fullName" size="15" /><br/>
             
         </td>
      </tr>
      <tr>
         <th><sf:label path="username">Username:</sf:label></th>
         <td><sf:input path="username" size="15" maxlength="15" />
              <small id="username_msg">No spaces, please.</small><br/>
             

            </td>
      </tr>
      <tr>
         <th><sf:label path="password">Password:</sf:label></th>
         <td><sf:password path="password" size="30" 
                            showPassword="true"/> 
             <small>6 characters or more (be tricky!)</small><br/>
             
            </td>
      </tr>

      <tr>
         <th><sf:label path="email">Email Address:</sf:label></th>

         <td><sf:input path="email" size="30"/> 
             <small>In case you forget something</small><br/>
             
            </td>
      </tr>
      <!--<start id="image_field"/>--> 
      <tr>
        <th><label for="image">Profile image:</label></th>
        <td><input name="image" type="file"/>
      </tr>
      <!--<end id="image_field"/>--> 
      <tr>
         <th></th>
         <td>
            <sf:checkbox path="updateByEmail"/>
            <sf:label path="updateByEmail" 
            >Send me email updates!</sf:label>

         </td>
      </tr>
      <tr>
         <th></th>
         <td><input name="commit" type="submit" 
                    value="I accept. Create my account." /></td>
      </tr>
   </table>
</fieldset>
</sf:form>
</div>
