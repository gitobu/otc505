<%-- 
    Document   : saveuses
    Created on : Dec 11, 2016, 4:51:32 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>
<jsp:useBean id="us" class="com.otc.Uses" scope="session"/>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uses</title>
    </head>
    <body>
        <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
        <c:set var="drug_use_id" value="<%= request.getParameter("drug_use_id")%>" />
        <sql:update dataSource="${snapshot}" var="result">
            insert into uses (drug_number,drug_use_id )
            values ('${drug_number}', ${drug_use_id})
        </sql:update> 
    <jsp:directive.include file="uses.jsp"/> 
    <jsp:directive.include file="drugusewarnings.jsp"/> 
    </body>
</html>
