<%-- 
    Document   : drug
    Created on : Dec 3, 2016, 6:35:30 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>

<html>
    <head><title>Drug</title>
  
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.drug.drug_number.value === ""){
		alert('Please enter drug number');
		return false;} 
        if (document.drug.drug_name.value === ""){
		alert('Please enter drug name');
		return false;} 
        if (document.drug.drug_strength.value === ""){
		alert('Please enter drug strength');
		return false;}  
			else
		{
			return true;
		}
    }
    </script>
    </head>
    
    <body>
      
            
            <c:set var="edit_mode" value="${not empty param.drug_number}"></c:set>   
            <c:set var="new_mode" value="${ empty param.drug_number}"></c:set> 
            
            
            
<c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="drug_number" value = "${param.drug_number}"/>
           
        <sql:query dataSource="${snapshot}" var="dr_data">
        SELECT drug.drug_number, 
        drug.drug_name, 
        drug.drug_strength,
        drug.drug_form_id,
        drug_form.drug_form_description, 
        drug.age_min, 
        drug.age_max, 
        drug.quantity_min, 
        drug.quantity_max, 
        drug.period_min, 
        drug.period_max, 
        drug.overdose_quantity, 
        drug.overdose_period,
        drug.period_unit_id,
        period_unit.period_unit_description 
	FROM drug, drug_form, period_unit
	WHERE drug.drug_form_id = drug_form.drug_form_id
	AND drug.period_unit_id = period_unit.period_unit_id
	AND drug.drug_number = ${drug_number}
        </sql:query>
        
        <c:forEach var="row" items="${dr_data.rows}">

        <c:set var="drug_number" value="${row.drug_number}"/>
        <c:set var="drug_name" value="${row.drug_name}"/>
        <c:set var="drug_strength" value="${row.drug_strength}"/>
        <c:set var="drug_form_id" value="${row.drug_form_id}"/>
        <c:set var="drug_form_description" value="${row.drug_form_description}"/>
        <c:set var="age_min" value="${row.age_min}"/>
        <c:set var="age_max" value="${row.age_max}"/>
        <c:set var="quantity_min" value="${row.quantity_min}"/>
        <c:set var="quantity_max" value="${row.quantity_max}"/>
        <c:set var="period_min" value="${row.period_min}"/>
        <c:set var="period_max" value="${row.period_max}"/>
        <c:set var="overdose_quantity" value="${row.overdose_quantity}"/>
        <c:set var="overdose_period" value="${row.overdose_period}"/>
        <c:set var="period_unit_id" value="${row.period_unit_id}"/>
        <c:set var="period_unit_description" value="${row.period_unit_description}"/>
       
        </c:forEach> 

        <jsp:setProperty name="dr" property="drug_number" value="${drug_number}"/>
        <jsp:setProperty name="dr" property="drug_name" value="${drug_name}"/>
        <jsp:setProperty name="dr" property="drug_strength" value="${drug_strength}"/>
        <jsp:setProperty name="dr" property="drug_form_id" value="${drug_form_id}"/>
        <jsp:setProperty name="dr" property="age_min" value="${age_min}"/>
        <jsp:setProperty name="dr" property="age_max" value="${age_max}"/>
        <jsp:setProperty name="dr" property="quantity_min" value="${quantity_min}"/>
        <jsp:setProperty name="dr" property="quantity_max" value="${quantity_max}"/>
        <jsp:setProperty name="dr" property="period_min" value="${period_min}"/>
        <jsp:setProperty name="dr" property="period_max" value="${period_max}"/>
        <jsp:setProperty name="dr" property="overdose_quantity" value="${overdose_quantity}"/>
        <jsp:setProperty name="dr" property="overdose_period" value="${overdose_period}"/>
        <jsp:setProperty name="dr" property="period_unit_id" value="${period_unit_id}"/>
        
        
    </c:when>
    <c:when test='${new_mode}'>
         <c:set var="drug_number" value = ""/>
   </c:when>
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="dr_list">
        SELECT drug.drug_number, 
        drug.drug_name, 
        drug.drug_strength, 
        drug_form.drug_form_description, 
        drug.age_min, 
        drug.age_max, 
        drug.quantity_min, 
        drug.quantity_max, 
        drug.period_min, 
        drug.period_max, 
        drug.overdose_quantity, 
        drug.overdose_period, 
        period_unit.period_unit_description 
	FROM drug, drug_form, period_unit
	WHERE drug.drug_form_id = drug_form.drug_form_id
	AND drug.period_unit_id = period_unit.period_unit_id
	ORDER BY drug_name
        </sql:query>
        
        <sql:query dataSource="${snapshot}" var="df">
        SELECT drug_form_id, drug_form_description
        FROM drug_form
        ORDER BY drug_form_description
        </sql:query> 
        
        <sql:query dataSource="${snapshot}" var="pu">
        SELECT period_unit_id, period_unit_description
        FROM period_unit
        ORDER BY period_unit_description
        </sql:query>
        
        <form name="drug" action="savedrug.jsp" method="POST">
         <table border="10" cellpadding="10" align="center">  
             <caption>
                 <h2>Drug</h2>
            </caption>
      <%-- 
             drug_number, drug_name, drug_strength, drug_form_id, age_min, age_max, quantity_min, quantity_max, period_min, 
period_max, overdose_quantity, overdose_period, period_unit_id       
      --%>         
<c:choose>  
             <c:when test='${edit_mode}'>
                    
             <input type="hidden" name="drug_number" value="<%= dr.getDrug_number() %>">     
             <tr><th align="left">Drug Number</th><td><input type="text" name="drug_number" value="<%= dr.getDrug_number() %>"></td> </tr>
             <tr><th align="left">Drug Name</th><td><input type="text" name="drug_name" value="<%= dr.getDrug_name() %>"></td> </tr>
             <tr><th align="left">Drug Strength</th><td><input type="text" name="drug_strength" value="<%= dr.getDrug_strength() %>"></td> </tr>
            
             <tr><th align="left">Drug Form </th><td><input type="text" name="drug_form_id" value="<%= dr.getDrug_form_id() %>"></td></tr>
             <tr><th align="left">Min Age</th><td><input type="text" name="age_min" value="<%= dr.getAge_min() %>"></td> </tr>
             <tr><th align="left">Max Age</th><td><input type="text" name="age_max" value="<%= dr.getAge_max() %>"></td> </tr>
             
             <tr><th align="left">Min Quantity</th><td><input type="text" name="quantity_min" value="<%= dr.getQuantity_min() %>"></td> </tr>
             <tr><th align="left">Max Quantity</th><td><input type="text" name="quantity_max" value="<%= dr.getQuantity_max() %>"></td> </tr>
             <tr><th align="left">Min Period</th><td><input type="text" name="period_min" value="<%= dr.getPeriod_min() %>"></td> </tr>
             
             <tr><th align="left">Max Period</th><td><input type="text" name="period_max" value="<%= dr.getPeriod_max() %>"></td> </tr>
             <tr><th align="left">Overdose Quantity</th><td><input type="text" name="overdose_quantity" value="<%= dr.getOverdose_quantity() %>"></td> </tr>
             <tr><th align="left">Overdose Period</th><td><input type="text" name="overdose_period" value="<%= dr.getOverdose_period() %>"></td> </tr>
             
              <tr><th align="left">Period Unit</th><td><input type="text" name="period_unit_id" value="<%= dr.getPeriod_unit_id() %>"></td> </tr>
             </c:when>
             <c:when test='${new_mode}'>                 
             <tr><th align="left">Drug Number</th><td><input type="text" name="drug_number" /></td> </tr>
             <tr><th align="left">Drug Name</th><td><input type="text" name="drug_name" /></td> </tr>
             <tr><th align="left">Drug Strength</th><td><input type="text" name="drug_strength" /></td> </tr>
            
             <tr><th align="left">Drug Form </th>
                 <td>
                <select name="drug_form_id">
                <option value="">[Select drug form]</option>
                <c:forEach var="row" items="${df.rows}">
                <option value="${row.drug_form_id}" ${row.drug_form_id == dr.getDrug_form_id()? 'selected="selected"' : ''}> 
                    ${row.drug_form_description}
                </option>
                </c:forEach>
                </select>  
                </td> 
             </tr>
             <tr><th align="left">Min Age</th><td><input type="text" name="age_min" /></td> </tr>
             <tr><th align="left">Max Age</th><td><input type="text" name="age_max" /></td> </tr>
             
             <tr><th align="left">Min Quantity</th><td><input type="text" name="quantity_min" /></td> </tr>
             <tr><th align="left">Max Quantity</th><td><input type="text" name="quantity_max" /></td> </tr>
             <tr><th align="left">Min Period</th><td><input type="text" name="period_min" /></td> </tr>
             
             <tr><th align="left">Max Period</th><td><input type="text" name="period_max" /></td> 
             <tr><th align="left">Overdose Quantity</th><td><input type="text" name="overdose_quantity" /></td> </tr>
             <tr><th align="left">Overdose Period</th><td><input type="text" name="overdose_period" /></td> </tr>
             
              <tr><th align="left">Period Unit</th>               
               <td>
                <select name="period_unit_id"> 
                <option value="">[Select period Unit]</option>
                <c:forEach var="row" items="${pu.rows}">
                <option value="${row.period_unit_id}" ${row.period_unit_id == dr.getPeriod_unit_id()? 'selected="selected"' : ''}> 
                    ${row.period_unit_description}
                </option>
                </c:forEach>
                </select>  
                </td> 
              </tr>   
            </c:when> 
             </c:choose> 

                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
      <%--
         <table  border="10" cellpadding="10" align="center" >
         <caption><h2>Health care provider</h2></caption>
         <tr>
            <th>Drug Number</th>
            <th>Drug Name</th>
            <th>Drug Strength</th>
            <th>Drug Form</th>
            <th>Min Age</th>
            <th>Max Age</th>
            <th>Min Quantity</th>
            <th>Max Quantity</th>
            <th>Min Period</th>
            <th>Max Period</th>
            <th>Overdose Quantity</th>
            <th>Overdose Period</th>
            <th>Overdose Period Description</th>
            <th>Update</th>
         </tr>
         <c:forEach var="row" items="${dr_list.rows}">
         <tr>
            <td><c:out value="${row.drug_number}"/></td>
            <td><c:out value="${row.drug_name}"/></td>
            <td><c:out value="${row.drug_strength}"/></td>
            <td><c:out value="${row.drug_form_description}"/></td>
            <td><c:out value="${row.age_min}"/></td>
            <td><c:out value="${row.age_max}"/></td>
            <td><c:out value="${row.quantity_min}"/></td>
            <td><c:out value="${row.quantity_max}"/></td>
            <td><c:out value="${row.period_min}"/></td>
            <td><c:out value="${row.period_max}"/></td>
            <td><c:out value="${row.overdose_quantity}"/></td>
            <td><c:out value="${row.overdose_period}"/></td>
            <td><c:out value="${row.period_unit_description}"/></td>
            <td><a href="<c:url value="drug.jsp?drug_number=${row.drug_number}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
       --%> 
    </body>
</html>

