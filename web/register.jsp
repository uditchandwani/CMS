<%-- 
    Document   : register
    Created on : Feb 20, 2021, 7:40:17 PM
    Author     : SHREE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body class="registerBG">
	<div class="registerBody">
		<div class="registerHeading">
			<h1>Register Here</h1>
		</div>
		<hr>
		<div class="registerForm">
			<form action="RegisterCustomer" name="register" onsubmit="return checkInput()">
				<div class="registerFormRow">
					<label>Full Name:</label><br>
					<input type="text" name="name" required>
				</div>
				<div class="registerFormRow">
					<label>Email:</label><br>
					<input type="email" name="email" required>
				</div>
				<div class="registerFormRow">
					<label>Phone No.:</label><br>
					<input type="number" name="phone" required>	
				</div>
				<div class="registerFormRow">
					<label>City:</label><br>
					<input type="text" name="city" required>	
				</div>
				<div class="registerFormRow">
					<label>Password:</label><br>
					<input type="password" name="pwd" required>
				</div>
				<div class="registerFormSubmit">
					<button type="submit">Register</button>
				</div>
			</form>
                    <br>
                    <a href="login.jsp">Log-in as Admin?</a>
		</div>
	</div>
    <script type="text/javascript">
		function checkInput() {
			var len = document.register.phone.value.length;
			if(len!=10)
			{
				alert("Phone no. should be of 10 digits!!");
				return false;
			}
			len = document.register.pwd.value.length;
			if(len<8)
			{
				alert("Password should be of atleast 8 letters!!");
				return false;
			}
			return true;
		}
	</script>
        <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
                if(msg.equals("Success"))
                {
                    out.print("<script>alert('Registeration Successful!!');</script>");
                }
                else if(msg.equals("Failed"))
                {
                    out.print("<script>alert('Registeration Failed!!');</script>");
                }
                else if(msg.equals("Exist"))
                {
                    out.print("<script>alert('Customer already exist with same email or phone no.!!');</script>");
                }
                
            }

        %>
</body>
</html>
