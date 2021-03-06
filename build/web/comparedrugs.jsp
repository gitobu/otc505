<%-- 
    Document   : comparedrugs
    Created on : Nov 9, 2016, 5:02:02 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compare Drugs</title>
    </head>
    <body>
        <c:set var="drug_number" value = "${param.drug_number}"/>
        <%-- 
       <sql:query dataSource="${snapshot}" var="drug_compare">
        SELECT d.drug_number, 
        d.drug_name, 
        case when d.age_max is null then
        concat(d.age_min,  ' years and over')
        else 
        concat(d.age_min, ' to ', d.age_max,' years') end age,
        case when  d.quantity_max is null then 
        concat(d.quantity_min, df.drug_form_description, ' in ', d.period_min, ' to ', d.period_max, ' ', pu.period_unit_description) 
        else 
        concat(d.quantity_min, ' to ', d.quantity_max, ' ', LOWER(df.drug_form_description), 's in ', d.period_min, ' to ', d.period_max, ' ', pu.period_unit_description) 
        end dosage,
        du.drug_use,
        dw.drug_warning
        FROM drug d 
        JOIN drug_form df ON d.drug_form_id = df.drug_form_id 
        JOIN period_unit pu ON d.period_unit_id = pu.period_unit_id
        JOIN vw_drug_use du ON d.drug_number = du.drug_number
        JOIN vw_drug_warning dw ON d.drug_number = dw.drug_number
        where d.drug_number in  (select distinct drug_number from uses where drug_use_id in (select drug_use_id from uses where drug_number = 305730150309));
        </sql:query>
        --%>
         <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
         
        <sql:query dataSource="${snapshot}" var="drug_compare">
        SELECT distinct d2.drug_number, d2.drug_name, du.drug_use, al.age, dw.drug_warning
        from 
        (select drug_number, drug_use_id
        from uses
        where drug_number = ${drug_number}) u1
        left join uses u2 on u1.drug_use_id = u2.drug_use_id
        join drug d on u2.drug_number = d.drug_number
        left join drug d2 on u2.drug_number = d2.drug_number
        JOIN drug_form df ON d.drug_form_id = df.drug_form_id 
        JOIN vw_drug_use du ON d2.drug_number = du.drug_number
        JOIN vw_drug_warning dw ON d2.drug_number = dw.drug_number
        JOIN vw_age_limits al ON d2.drug_number = al.drug_number;
	
        </sql:query>
         <table border="10" cellpadding="10">
             
         <tr>
             <tr>
          
            <th>Drug Name</th>
            <th>Uses</th>
            <th>Age</th>
           
            <th>Warnings</th>
         </tr>
         
         <c:forEach var="row" items="${drug_compare.rows}">
         <tr> 
         
            <td><c:out value="${row.drug_name}"/></td>
            <td><c:out value="${row.drug_use}"/></td>
            <td><a href="<c:url value="dosagedetails.jsp?drug_number=${row.drug_number}"/>"><c:out value="${row.age}"/></a></td>
            
            <td><c:out value="${row.drug_warning}"/></td>   
            
         </tr>
         </c:forEach>
         </table>   
    </body>
</html>
