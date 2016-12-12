<%-- 
    Document   : drugusewarnings
    Created on : Dec 11, 2016, 5:49:32 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>

<jsp:useBean id="dw" class="com.otc.Drug_use_warnings" scope="session"/>

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
            if (document.uses.use_warning_id.value === ""){
                    alert('Please select use warning');
                    return false;} 
                            else
                    {
                            return true;
                    }
        }
        </script>
    </head>
    <body>
        <sql:query dataSource="${snapshot}" var="duw">
        SELECT use_warning_id, use_warning_description
        FROM use_warning
        ORDER BY use_warning_description
        </sql:query> 
        

        
        <form name="usewarning" action="saveusewarning.jsp" method="POST">
         <table border="10" cellpadding="10" align="center">  
             <caption>
                 <h2>Use warning</h2>
            </caption>
             <tr><th align="left">Drug Number</th><td><input type="text" name="drug_number" value="<%= dr.getDrug_number() %>" /></td> </tr>
             <tr><th align="left">Use warning </th>
                 <td>
                <select name="use_warning_id">
                <option value="">[Select use warning]</option>
                <c:forEach var="row" items="${duw.rows}">
                <option value="${row.use_warning_id}" ${row.use_warning_id == dw.getUse_warning_id()? 'selected="selected"' : ''}> 
                    ${row.use_warning_description}
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

