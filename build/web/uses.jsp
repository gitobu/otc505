<%-- 
    Document   : uses
    Created on : Dec 10, 2016, 4:17:35 AM
    Author     : Gitobu
--%>
<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="du" class="com.otc.Uses" scope="session"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uses</title>
        <script type="text/javascript">
        function validateFormValues(){
            if (document.uses.drug_number.value === ""){
                    alert('Please enter drug number');
                    return false;} 
            if (document.uses.drug_use_id.value === ""){
                    alert('Please enter drug name');
                    return false;} 
                            else
                    {
                            return true;
                    }
        }
        </script>
    </head>
    <body>
        <sql:query dataSource="${snapshot}" var="dru">
        SELECT drug_use_id, drug_use_description
        FROM drug_use
        ORDER BY drug_use_description
        </sql:query> 
        

        
        <form name="uses" action="saveuses.jsp" method="POST">
         <table border="10" cellpadding="10" align="center">  
             <caption>
                 <h2>Drug use</h2>
            </caption>
             <tr><th align="left">Drug Number</th><td><input type="text" name="drug_number" value="<%= dr.getDrug_number() %>" /></td> </tr>
             <tr><th align="left">Drug Use </th>
                 <td>
                <select name="drug_use_id">
                <option value="">[Select drug use]</option>
                <c:forEach var="row" items="${dru.rows}">
                <option value="${row.drug_use_id}" ${row.drug_use_id == du.getDrug_use_id()? 'selected="selected"' : ''}> 
                    ${row.drug_use_description}
                </option>
                </c:forEach>
                </select>  
                </td> 
             </tr>
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
    </body>
</html>
