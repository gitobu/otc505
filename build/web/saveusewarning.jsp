<%-- 
    Document   : saveusewarning
    Created on : Dec 11, 2016, 6:11:38 AM
    Author     : Gitobu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>
<%--
<jsp:useBean id="dw" class="com.otc.Drug_use_warnings" scope="session"/>
--%>
<jsp:directive.include file="sqllink.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uses</title>
    </head>
    <body>
        <c:set var="drug_number" value="<%= request.getParameter("drug_number")%>" />
        <c:set var="use_warning_id" value="<%= request.getParameter("use_warning_id")%>" />
        <sql:update dataSource="${snapshot}" var="result">
            insert into drug_use_warnings (drug_number,use_warning_id )
            values ('${drug_number}', ${use_warning_id})
        </sql:update> 
   
    <jsp:directive.include file="drugusewarnings.jsp"/> 
     <jsp:directive.include file="dosage.jsp"/> 
    </body>
</html>
