<html>
<head>
  <title>Calculator</title>
  <style>
  
  body {
  background-color: #f7f7f7;
}
  
.header {
  text-align: center;
  background: #1abc9c;
  color: white;
  font-size: 20px;
  }
  
  #loginForm {
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
  <h1>Login </h1>
  <p>Please enter your details below to login</p>
</div>
  
  
  <form method="get" id="loginForm">
  <label for="username">Username</label><br/>
   <input type="text" id="username" name="username" required> <br/>
   <label for="passqord">Password</label><br/>
   <input type="text" id="password" name="password" required> <br/>
   <br/>
   <input type = "submit">
  </form>
 
  <%@ page import = "java.sql.*" %>
  
  <!--add mysql connectorJ jar file to tomcat/lib folder -->

	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		
		Connection conn = DriverManager.getConnection(
         "jdbc:mysql://localhost:3306/calculator?serverTimezone=UTC","root", "root");
     
      
	    String sql = "SELECT * FROM user WHERE username= ? AND password= ? ;";
		PreparedStatement stmt = conn.prepareStatement(sql); 
 
		stmt.setString(1, username);
		stmt.setString(2, password);
	  
      // for debugging
     
      ResultSet rset = stmt.executeQuery();
	  
	  if (username != null && password != null) {
		boolean found = false;
	  
	  while (rset.next()) {
		  if (rset.getString("username").equals(username) && rset.getString("password").equals(password)) {
			  session.setAttribute("username", username);
			  response.sendRedirect("calculator.jsp");
			  found = true;
		  }
		  
	 } // end while
	 
		if (found == false) { %>
			  <p>Error: Login Failed</p>
			  <%
		  }
		}
		
		
		
		%>
	
	<%
      rset.close();
      stmt.close();
      conn.close();
  %>
	

      
        <br>
       
	
  
</body>
</html>