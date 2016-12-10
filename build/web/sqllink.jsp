<%-- 
    Document   : sqllink
    Created on : Nov 7, 2016, 5:47:10 AM
    Author     : Gitobu
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/otc?zeroDateTimeBehavior=convertToNull"
     user="root"  password="ist303@cgu"/>