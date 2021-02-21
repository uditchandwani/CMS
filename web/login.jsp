<%-- 
    Document   : login
    Created on : Feb 20, 2021, 7:40:43 PM
    Author     : SHREE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<style type="text/css">
		.registerBody
		{
			height: 310px;
		}
	</style>
</head>
<body class="registerBG">
	<div class="registerBody">
		<div class="registerHeading">
			<h1>Log-in Here</h1>
		</div>
		<hr>
		<div class="registerForm">
                    <form action="loggingIn" method="POST">
				<div class="registerFormRow">
					<label>Email:</label><br>
                                        <input type="email" name="email" required>
				</div>
				<div class="registerFormRow">
					<label>Password:</label><br>
					<input type="password" name="pwd" required>
				</div>
				<div class="registerFormSubmit">
					<button type="submit">Log-in</button>
				</div>
			</form>
                    <br>
                    <a href="register.jsp">Register as a customer?</a>
                </div>
                    
	</div>
</body>
<%
    String err=request.getParameter("err");
    if(err!=null)
    {
        if(err.equals("Invalid"))
        {
            out.print("<script>alert('Invalid email or password!!');</script>");
        }
    }
    String msg=request.getParameter("msg");
    if(msg!=null)
    {
        if(msg.equals("LoggedOut"))
        {
            out.print("<script>alert('Logged Out Successfully!!');</script>");
        }
    }
%>
</html>