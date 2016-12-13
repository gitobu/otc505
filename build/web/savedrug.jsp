<%-- 
    Document   : savedrug
    Created on : Dec 8, 2016, 10:36:06 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTC Drug</title>
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

            <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
            <c:set var="drug_name" value="<%= request.getParameter("drug_name")%>" />
            <c:set var="drug_strength" value="<%= request.getParameter("drug_strength")%>" />
            <c:set var="drug_form_id" value="<%= request.getParameter("drug_form_id")%>" />
            <%--
            <c:set var="age_min" value="<%= request.getParameter("age_min")%>" />
            <c:set var="age_max" value="<%= request.getParameter("age_max")%>" />
            <c:set var="quantity_min" value="<%= request.getParameter("quantity_min")%>" />
            <c:set var="quantity_max" value="<%= request.getParameter("quantity_max")%>" />
            <c:set var="period_min" value="<%= request.getParameter("period_min")%>" />
            <c:set var="period_max" value="<%= request.getParameter("period_max")%>" />
           --%>
            <c:set var="overdose_quantity" value="<%= request.getParameter("overdose_quantity")%>" />
            <c:set var="overdose_period" value="<%= request.getParameter("overdose_period")%>" />
            <c:set var="period_unit_id" value="<%= request.getParameter("period_unit_id")%>" />
    
            <sql:update dataSource="${snapshot}" var="result">
            insert into drug (drug_number, 
                                    drug_name, 
                                    drug_strength, 
                                    drug_form_id, 
                                    <%--
                                    age_min, 
                                    age_max, 
                                    quantity_min, 
                                    quantity_max, 
                                    period_min, 
                                    period_max,
                                    --%>
                                    overdose_quantity, 
                                    overdose_period, 
                                    period_unit_id)
            values ('${drug_number}', 
                                    '${drug_name}',
                                    '${drug_strength}',
                                    ${drug_form_id},
                                    <%--
                                    ${age_min},
                                    ${age_max},
                                    ${quantity_min},
                                    ${quantity_max},
                                    ${period_min},
                                    ${period_max},
                                    --%>
                                    ${overdose_quantity},
                                    ${overdose_period},
                                    ${period_unit_id})
            </sql:update> 
            
            <jsp:setProperty name="dr" property="drug_number" value="${drug_number}"/>
  
        <sql:query dataSource="${snapshot}" var="dr_list">
        SELECT drug.drug_number, 
        drug.drug_name, 
        drug.drug_strength, 
        drug_form.drug_form_description,
        <%--
        drug.age_min, 
        drug.age_max, 
        drug.quantity_min, 
        drug.quantity_max, 
        drug.period_min, 
        drug.period_max, 
        --%>
        drug.overdose_quantity, 
        drug.overdose_period, 
        period_unit.period_unit_description 
	FROM drug, drug_form, period_unit
	WHERE drug.drug_form_id = drug_form.drug_form_id
	AND drug.period_unit_id = period_unit.period_unit_id
        AND drug.drug_number = '${drug_number}'
	
        </sql:query>
        
         <table  border="10" cellpadding="10" align="center" >
         <caption><h2>Drug</h2></caption>
         <tr>
            <th>Drug Number</th>
            <th>Drug Name</th>
            <th>Drug Strength</th>
            <th>Drug Form</th>
        <%--
            <th>Min Age</th>
            <th>Max Age</th>
            <th>Min Quantity</th>
            <th>Max Quantity</th>
            <th>Min Period</th>
            <th>Max Period</th>
        --%>
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
        <%--
            <td><c:out value="${row.age_min}"/></td>
            <td><c:out value="${row.age_max}"/></td>
            <td><c:out value="${row.quantity_min}"/></td>
            <td><c:out value="${row.quantity_max}"/></td>
            <td><c:out value="${row.period_min}"/></td>
            <td><c:out value="${row.period_max}"/></td>
        --%>
            <td><c:out value="${row.overdose_quantity}"/></td>
            <td><c:out value="${row.overdose_period}"/></td>
            <td><c:out value="${row.period_unit_description}"/></td>
            <td><a href="<c:url value="drug.jsp?drug_number=${row.drug_number}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
         
         <jsp:directive.include file="uses.jsp"/>
         <%--     
         <form name="drug" action="savedrug.jsp" method="POST">
         <table border="10" cellpadding="10" align="center">  
             <caption>
                 <h2>Drug</h2>
            </caption>
      <%-- 
             drug_number, drug_name, drug_strength, drug_form_id, age_min, age_max, quantity_min, quantity_max, period_min, 
period_max, overdose_quantity, overdose_period, period_unit_id       
      --%>         
 <%-- 
            
                            
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
                     </td> </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
            --%>
    </body>
</html>
