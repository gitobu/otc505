<%-- 
    Document   : description
    Created on : Nov 7, 2016, 5:33:26 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Advil</title>
    </head>
    <body>
        <c:set var="search_string" value="<%= request.getParameter("search")%>" />
        
        <sql:query dataSource="${snapshot}" var="drug_desc">
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
        WHERE d.drug_number like '${search_string}'
        </sql:query>
        
        <table border="10" cellpadding="10">
            <c:forEach var="row" items="${drug_desc.rows}"> 
                
            <tr><th align="left">Drug name</th><td><c:out value="${row.drug_name}"/></td></tr>
            <tr><th align="left">Age</th><td><c:out value="${row.age}"/></td></tr>
            <tr><th align="left">Dosage</th><td><c:out value="${row.dosage}"/></td></tr>
            <tr><th align="left">Directions</th><td><c:out value="${row.drug_use}"/></td></tr>
            <tr><th align="left">Warnings</th><td><c:out value="${row.drug_warning}"/></td></tr>
            </c:forEach>
        </table>
    </body>
</html>
