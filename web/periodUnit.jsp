<%-- 
    Document   : periodUnit
    Created on : Nov 19, 2016, 7:03:56 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="df" class="com.otc.Period_Unit" scope="session"/>

<html>
    <head><title>Selecting OTC - Period Unit</title>
    
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.drugform.period_unit.value === ""){
		alert('Please enter Period Unit');
		return false;}      
			else
		{
			return true;
		}
    }
    </script>
    </head>
    
    <body>
      
        <div id="section">
            
            <c:set var="edit_mode" value="${not empty param.period_unit_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.period_unit_id}"></c:set> 
            
            
            
            <c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="job_title_id" value = "${param.period_unit_id}"/>
           
        <sql:query dataSource="${snapshot}" var="df_data">
        SELECT df.period_unit_id,  df.period_unit_description
        FROM period_unit df 
        WHERE jt.period_unit_id = ${period_unit_id}
        </sql:query>
        
        <c:forEach var="row" items="${jt_data.rows}">
        <c:set var="period_unit_id" value = "${row.period_unit_id}"/>
        <c:set var="period_unit_description" value = "${row.period_unit_description}"/>
    

        </c:forEach> 

        <jsp:setProperty name="df" property="period_unit_id" value="${period_unit_id}"/>
        <jsp:setProperty name="df" property="period_unit_description" value="${period_unit}"/>
     
    </c:when>
    

   
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="df_list">
        SELECT df.period_unit_id, df.period_unit_description
        FROM period_unit df 
        ORDER BY period_unit_description
        </sql:query>
        
        <form name="drugform" action="savedrugform.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>New Period Unit</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <input type="hidden" name="period_unit_id" value="<%= df.getPeriod_unit_id() %>">   
                  
             <tr><th align="left">Period Unit</th><td><input type="text" name="period_unit" value="<%= df.getPeriod_unit_description() %>"></td> </tr>
             </c:when>
             <c:when test='${new_mode}'>
             <tr><th align="left">Period Unit</th><td><input type="text" name="period_unit" ></td> </tr>
            </c:when> 
             </c:choose> 
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
         <table border="0" cellpadding="10" align="center" >
         <caption><h2>Period Unit</h2></caption>
         <tr>
      
            <th>Period Unit</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${df_list.rows}">
         <tr>
         
            <td><c:out value="${row.period_unit_description}"/></td>
            <td><a href="<c:url value="drugForm.jsp?period_unit_id=${row.period_unit_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
       
    </body>
</html>



