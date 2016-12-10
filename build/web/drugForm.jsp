<%-- 
    Document   : drugForm
    Created on : Nov 19, 2016, 6:49:43 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="df" class="com.otc.Drug_Form" scope="session"/>

<html>
    <head><title>Kenya Clinic: Job Title</title>
    
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.drugform.drug_form.value === ""){
		alert('Please enter drug form');
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
            
            <c:set var="edit_mode" value="${not empty param.drug_form_id}"></c:set>   
            <c:set var="new_mode" value="${ empty param.drug_form_id}"></c:set> 
            
            
            
            <c:choose>
    <c:when test='${edit_mode}'>
        <c:set var="job_title_id" value = "${param.drug_form_id}"/>
           
        <sql:query dataSource="${snapshot}" var="df_data">
        SELECT df.drug_form_id,  df.drug_form_description
        FROM drug_form df 
        WHERE jt.drug_form_id = ${drug_form_id}
        </sql:query>
        
        <c:forEach var="row" items="${jt_data.rows}">
        <c:set var="drug_form_id" value = "${row.drug_form_id}"/>
        <c:set var="drug_form_description" value = "${row.drug_form_description}"/>
    

        </c:forEach> 

        <jsp:setProperty name="df" property="drug_form_id" value="${drug_form_id}"/>
        <jsp:setProperty name="df" property="drug_form_description" value="${drug_form}"/>
     
    </c:when>
    

   
</c:choose>

            
       
        <sql:query dataSource="${snapshot}" var="df_list">
        SELECT df.drug_form_id, df.drug_form_description
        FROM drug_form df 
        ORDER BY drug_form_description
        </sql:query>
        
        <form name="drugform" action="savedrugform.jsp" method="POST">
         <table border="0" cellpadding="10" align="center">  
             <caption>
                 <h2>New Drug Form</h2>
            </caption>
             
         <c:choose>  
             <c:when test='${edit_mode}'>
                 <input type="hidden" name="drug_form_id" value="<%= df.getDrug_form_id() %>">   
                  
             <tr><th align="left">Drug Form</th><td><input type="text" name="drug_form" value="<%= df.getDrug_form_description() %>"></td> </tr>
             </c:when>
             <c:when test='${new_mode}'>
             <tr><th align="left">Drug Form</th><td><input type="text" name="drug_form" ></td> </tr>
            </c:when> 
             </c:choose> 
             <tr><th></th><td><input type="submit" value="Submit" onclick="return validateFormValues()"/></td> </tr>
            </table>
            </form>
         <table border="0" cellpadding="10" align="center" >
         <caption><h2>Drug Form</h2></caption>
         <tr>
      
            <th>Drug Form</th>
            <th>Edit</th>

         </tr>
         <c:forEach var="row" items="${df_list.rows}">
         <tr>
         
            <td><c:out value="${row.drug_form_description}"/></td>
            <td><a href="<c:url value="drugForm.jsp?drug_form_id=${row.drug_form_id}"/>">Edit</a></td>
         </tr>
         </c:forEach>
         </table>
        </div>
       
    </body>
</html>


