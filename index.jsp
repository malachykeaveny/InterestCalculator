<html>
<head>
  <title>Register</title>
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
  
  #regForm {
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
}</style>
</head>
<body>
  
  <div class="header">
  <h1>Register </h1>
  <p>Please enter your details below to register</p>
</div>
  
  
  <form method="get" id="regForm">
  <label for="username">Username</label><br/>
   <input type="text" id="username" name="username" required> <br/>
   <label for="password">Password</label><br/>
   <input type="text" id="password" name="password" required> <br/>
   <label for="confirmPassword">Confirm Passsword</label><br/>
   <input type="text" id="confirmPassword" name="password2" required> <br/>
   <input type = "submit" value="Register">
  </form>
 
  <%@ page import = "java.sql.*" %>
  
  <!--add mysql connectorJ jar file to tomcat/lib folder -->

	<%
	String username = request.getParameter("username");
    String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
   
      Connection conn = DriverManager.getConnection(
         "jdbc:mysql://localhost:3306/calculator?serverTimezone=UTC","root", "root");
		 
		 //response.sendRedirect("");
		 
		 
			
			if (password != null && password.equals(password2)) {
				
				PreparedStatement createUser = conn.prepareStatement(
				"INSERT into user "
				+ "(username, password)" +" VALUES (?, ?)");
				createUser.setString(1, username);
				createUser.setString(2, password);
				int rowsUpdated = createUser.executeUpdate();
				createUser.close();
				
				response.sendRedirect("login.jsp");
				
			}
			
			else if (password != null && !password.equals(password2)) { %>
				<p>Error: Passwords do not match</p>
				<%
			}
		
     
      Statement stmt = conn.createStatement();
 
      String sqlStr = "SELECT * FROM user";
      
      // for debugging
      System.out.println("Query statement is " + sqlStr);
      ResultSet rset = stmt.executeQuery(sqlStr);
  %>

      
        <br>
       
	<%
	  rset.close();
      stmt.close();
      conn.close();    
  %>
  
</body>
</html>