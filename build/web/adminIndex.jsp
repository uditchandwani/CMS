<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Details</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<%@include file="header.jsp"%> 
	<div class="container">
		<div class="customerDetails">
			<h2>Customer Details</h2>
		</div>
	</div>
	<hr>
        <div class="container">
                <div class="searchCustomer">
			<form action="adminIndex.jsp" method="POST">
				<input type="text" name="search" placeholder="Search Customer">
				<button type="submit">Search</button>
			</form>
		</div>
		<table class="customerTable">
			<tr>
				<th>Name</th>
				<th>Email</th>
				<th>Phone No.</th>
				<th>City</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
        <%
        try
        {
            String search = request.getParameter("search");
            Connection con = new DBConnection().getConnection();
            String query = "select name,email,phone,city,status,customerID from customer";
            if(search!=null)
            {
                query=query+" where name  like '%"+search+"%';";
            }
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                do
                {
                    out.println("<tr>");
                        out.println("<td>"+rs.getString(1)+"</td>");
                        out.println("<td>"+rs.getString(2)+"</td>");
                        out.println("<td>"+rs.getString(3)+"</td>");
                        out.println("<td>"+rs.getString(4)+"</td>");
                        out.println("<td>"+rs.getString(5)+"</td>");
                        out.println("<td><button onclick=\"openForm('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"')\">Edit</button></td>");
                        out.println("<td><button onclick=\"deleteCustomer('"+rs.getString(6)+"');\">Delete</button></td>");
                    out.println("</tr>");
                }while(rs.next());
            }
            else
                out.println("<script>alert('No record found');window.location.href='adminIndex.jsp';</script>");
        }
        catch(Exception e)
        {
            out.println("<h1>"+e+"</h1>");
        }
        %>    
	
<!--			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button onclick="openForm('Vaibhav Bahule','vaibhavbahule@gmail.com','3216587496','Indore','Pending')">Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>
			<tr>
				<td>Vaibhav Bahule</td>
				<td>vaibhavbahule@gmail.com</td>
				<td>3216587496</td>
				<td>Indore</td>
				<td>Pending</td>
				<td><button>Edit</button></td>
				<td><button>Delete</button></td>
			</tr>-->
		</table>
	</div>
        <div class="form-popup" id="myForm">
            <form action="UpdateUser" method="POST" onsubmit="return checkInput()" name="editDetails" class="form-container">
              <!-- <h1>Login</h1> -->
              <label><b>Customer ID</b></label>
              <input type="number" name="id" readonly>
              
              <label><b>Name</b></label>
              <input type="text" placeholder="Enter Email" name="name" required>

              <label><b>Email</b></label>
              <input type="email" placeholder="Enter Email" name="email" required>
              <label><b>Phone No.</b></label>
              <input type="number" placeholder="Enter Email" name="phone" required>
              <label><b>City</b></label>
              <input type="text" placeholder="Enter Email" name="city" required>
              <label><b>Status</b></label>
              <select name="status">
                          <option value="Pending">Pending</option>
                          <option value="Approved">Approved</option>
                          <option value="Denied">Denied</option>
               </select>

              <button type="submit" class="btn">Update</button>
              <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
            </form>
        </div>
	<footer>
		<div>
			<p>&copy; All Rights Reserved. 2020-2021</p>
		</div>
	</footer>
        <script>
            function openForm(name,email,phone,city,status,id) {
              document.getElementById("myForm").style.display = "block";
              document.editDetails.name.value=name;
              document.editDetails.email.value=email;
              document.editDetails.phone.value=phone;
              document.editDetails.city.value=city;
              document.editDetails.status.value=status;
              document.editDetails.id.value=id;
            }

            function closeForm() {
              document.getElementById("myForm").style.display = "none";
            }
            
            function deleteCustomer(id)
            {
                if(confirm("Are you sure ?"))
                window.location.href="DeleteUser.jsp?id="+id;
            }
            function checkInput() {
		var len = document.editDetails.phone.value.length;
		if(len!=10)
		{
		alert("Phone no. should be of 10 digits!!");
                    return false;
		}
		len = document.editDetails.pwd.value.length;
		if(len<8)
		{
                    alert("Password should be of atleast 8 letters!!");
                    return false;
		}
		return true;
            }
	</script>
        <%
            String err=request.getParameter("err");
            if(err!=null)
            {
                if(err.equals("3"))
                {
                    out.print("<script>alert('Unable to delete record!!');</script>");
                }
                else if(err.equals("UpdateError"))
                {
                    out.print("<script>alert('Unable to update record!!');</script>");
                }
            }   
        %>
</body>
</html>
