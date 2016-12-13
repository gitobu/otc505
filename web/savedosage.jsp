<%-- 
    Document   : savedosage
    Created on : Dec 12, 2016, 5:57:24 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>
<jsp:useBean id="dos" class="com.otc.Dosage" scope="session"/>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dosage</title>
        
    </head>
    <body>

            <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
            <c:set var="age_min" value="<%= request.getParameter("age_min")%>" />
            <c:set var="age_max" value="<%= request.getParameter("age_max")%>" />
            <c:set var="quantity_min" value="<%= request.getParameter("quantity_min")%>" />
            <c:set var="quantity_max" value="<%= request.getParameter("quantity_max")%>" />
            <c:set var="period_min" value="<%= request.getParameter("period_min")%>" />
            <c:set var="period_max" value="<%= request.getParameter("period_max")%>" />
            <c:set var="period_unit_id" value="<%= request.getParameter("period_unit_id")%>" />
    
            <sql:update dataSource="${snapshot}" var="result">
            insert into dosage (drug_number, 
                                    age_min, 
                                    age_max, 
                                    quantity_min, 
                                    quantity_max, 
                                    period_min, 
                                    period_max,
                                    period_unit_id)
                            values ('${drug_number}', 
                                    ${age_min},
                                    ${age_max},
                                    ${quantity_min},
                                    ${quantity_max},
                                    ${period_min},
                                    ${period_max},
                                    ${period_unit_id})
            </sql:update> 
            
            <jsp:setProperty name="dr" property="drug_number" value="${drug_number}"/>
  
        <sql:query dataSource="${snapshot}" var="dos_list">
        SELECT dosage.drug_number, 
        dosage.age_min, 
        dosage.age_max, 
        dosage.quantity_min, 
        dosage.quantity_max, 
        dosage.period_min, 
        dosage.period_max
	FROM dosage
        WHERE dosage.drug_number = '${drug_number}'
	
        </sql:query>
        
         <table  border="10" cellpadding="10" align="center" >
         <caption><h2>Dosage</h2></caption>
         <tr>
            <th>Drug Number</th>
            
            <th>Min Age</th>
            <th>Max Age</th>
            <th>Min Quantity</th>
            <th>Max Quantity</th>
            <th>Min Period</th>
            <th>Max Period</th>
            
            <th>Update</th>
         </tr>
         <c:forEach var="row" items="${dos_list.rows}">
         <tr>
            <td><c:out value="${row.drug_number}"/></td>
            <td><c:out value="${row.age_min}"/></td>
            <td><c:out value="${row.age_max}"/></td>
            <td><c:out value="${row.quantity_min}"/></td>
            <td><c:out value="${row.quantity_max}"/></td>
            <td><c:out value="${row.period_min}"/></td>
            <td><c:out value="${row.period_max}"/></td>
            
            <td><a href="<c:url value="dosage.jsp?drug_number=${row.drug_number}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
         
         <jsp:directive.include file="dosage.jsp"/>
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
