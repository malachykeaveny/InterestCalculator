<html>
<head>
  <title>Calculator</title>
  <style>
  
  body {
  background-color: #f7f7f7;
}
  
table, td, th {
  border: 1px solid black;
  padding: 15px;
  border-collapse: collapse;
  text-align: center;
}

th {
	  background-color: #1abc9c;
}

#table1 {
  border-collapse: collapse;
   margin: 0px auto; 
}

tr:nth-child(odd) {background-color: #f2f2f2;}

.header {
  text-align: center;
  background: #1abc9c;
  color: white;
  font-size: 20px;
}

#form1 {
	text-align: center;
	border-radius: 5px;
  background-color: #f2f2f2;
  padding: 5px;
}

input[type=text], select {
  width: 20%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 20%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

</style>
</head>
<body>

  <div class="header">
  <h1>Compound Interest Calculator</h1>
  <p>Welcome <%=session.getAttribute("username") %></p>
</div>
  
  

 
  <%@ page import = "java.sql.*" %>
  <%@page import = "java.text.NumberFormat"%>
  <%@page import = "java.util.Locale"%>
  
  <form method="get" id = "form1">
   <label for="baseAmt">Base Amount ($)</label><br/>
   <input type="text" id = "baseAmt" name="baseAmount" required>
   <br/>
   <label for="annIR">Annual Interest Rate (%)</label><br/>
    <input type="text" id="annIR" name="annualInterestRate" required> <br/>
   <label for="calcP">Calculation Period (Years)</label><br/>
   <input type="text" id="calcP" name="calculationPeriod" required> <br/>
   <input type = "submit" value="Calculate">
  </form>

	<br>
       
	   <%
			String bA = request.getParameter("baseAmount");
			String AIR = request.getParameter("annualInterestRate");
			String cP = request.getParameter("calculationPeriod");
			
			if (bA != null && AIR != null && cP != null) {
			Double baseAmount = Double.parseDouble(bA);
			Double annualInterestRate = Double.parseDouble(AIR);
			int calculationPeriod = Integer.parseInt(cP);
			Double totalInterest = 0.0;
			Double totalBalance = 0.0;
			
			Locale locale = new Locale("en", "US");
			NumberFormat formatter = NumberFormat.getCurrencyInstance(locale);
			//String totalBalanceFormatted = formatter.format(totalBalance);
			
			
	   %>
	   
	   
	   
	   <table id="table1">
          <tr>
            <th>Year</th>
            <th>Total Interest</th>
            <th>Balance Per Year</th>       
          </tr>
	
		<%
			for (int y = 1; y <= calculationPeriod; y ++) {
				double interestCalculation = (1+ annualInterestRate / 100);
				totalInterest = Math.pow(interestCalculation, y);
				double totalInterest1 = Math.pow(interestCalculation, y) * (baseAmount) -  baseAmount;
				totalBalance = baseAmount * totalInterest;
				String totalBalanceFormatted = formatter.format(totalBalance);
				String totalInterestFormatted = formatter.format(totalInterest1);
				%>
		<tr>
			
            <td><%=y%></td>
			<td><%=totalInterestFormatted%></td>
            <td><%=totalBalanceFormatted%></td>
          
          </tr>
		  
			<%}
			}
		  %>
  
  
</body>
</html>