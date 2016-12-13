<%-- 
    Document   : dosage
    Created on : Dec 12, 2016, 5:57:10 AM
    Author     : Gitobu
--%>

<jsp:directive.include file="sqllink.jsp"/>
<jsp:useBean id="dos" class="com.otc.Dosage" scope="session"/>
<jsp:useBean id="dr" class="com.otc.Drug" scope="session"/>
<html>
    <head><title>Drug</title>
  
    <script type="text/javascript">
    function validateFormValues(){
	
	
        if (document.dosage.drug_number.value === ""){
		alert('Please enter drug number');
		return false;} 
        if (document.dosage.quantity_max.value === ""){
		alert('Please enter maximum quantity');
		return false;}  
			else
		{
			return true;
		}
    }
    </script>
    </head>
    
    <body>

        
        <form name="drug" action="savedosage.jsp" method="POST">
         <table border="10" cellpadding="10" align="center">  
             <caption>
                 <h2>Dosage</h2>
            </caption>
             <tr><th align="left">Drug Number</th><td><input type="text" name="drug_number" value="<%= dr.getDrug_number() %>"/></td> </tr>
             <tr><th align="left">Min Age</th><td><input type="text" name="age_min" /></td> </tr>
             <tr><th align="left">Max Age</th><td><input type="text" name="age_max" /></td> </tr>
             <tr><th align="left">Min Quantity</th><td><input type="text" name="quantity_min" /></td> </tr>
             <tr><th align="left">Max Quantity</th><td><input type="text" name="quantity_max" /></td> </tr>
             <tr><th align="left">Min Period</th><td><input type="text" name="period_min" /></td> </tr>
             <tr><th align="left">Max Period</th><td><input type="text" name="period_max" /></td></tr>
             <tr><th align="left">Overdose Quantity</th><td><input type="text" name="overdose_quantity" /></td> </tr>
             <tr><th align="left">Overdose Period</th><td><input type="text" name="overdose_period" /></td> </tr>
             <tr><th align="left">Period Unit</th>               
               <td>
                <select name="period_unit_id"> 
                <option value="">[Select period Unit]</option>
                <c:forEach var="row" items="${pu.rows}">
                <option value="${row.period_unit_id}" ${row.period_unit_id == dos.getPeriod_unit_id()? 'selected="selected"' : ''}> 
                    ${row.period_unit_description}
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

