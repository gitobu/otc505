<%-- 
    Document   : dosagedetails
    Created on : Dec 12, 2016, 10:59:39 PM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dosage Details</title>
    </head>
    <body>
        <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
        
        <sql:query dataSource="${snapshot}" var="dosage_det">
        select d.drug_number, concat(d.age_min, case when d.age_max = 99 then ' years and over' else concat(' to ', d.age_max, ' years') end) age_limit, 
        case when  d.quantity_max is null then 
        concat(d.quantity_min, df.drug_form_description, ' in ', d.period_min, ' to ', d.period_max, ' ', pu.period_unit_description) 
        else 
        concat(d.quantity_min, ' to ', d.quantity_max, ' ', LOWER(df.drug_form_description), 's in ', d.period_min, ' to ', d.period_max, ' ', pu.period_unit_description) 
        end drug_quantity,concat(d.overdose_quantity, ' ',  LOWER(df.drug_form_description), 's in ', d.overdose_period,  ' ', pu.period_unit_description) overdose
        from dosage d, period_unit pu, drug dr, drug_form df
        where d.period_unit_id = pu.period_unit_id
        and d.drug_number = dr.drug_number
        and dr.drug_form_id = df.drug_form_id
        and d.drug_number = ${drug_number};
       </sql:query>
        <table border="10" cellpadding="10">
        
         <tr>
          
            <th>Age</th>
            <th>Dosage</th>
            <th>Overdose</th>
         </tr>
         
         <c:forEach var="row" items="${dosage_det.rows}">
         <tr>   
             
             <td><c:out value="${row.age_limit}"/></td>
            <td><c:out value="${row.drug_quantity}"/></td>
              <td><c:out value="${row.overdose}"/></td>    
            
         </tr>
         </c:forEach>
         </table>   
    </body>
</html>
