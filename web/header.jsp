<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%
//    session=request.getSession();
    String customerName=(String)session.getAttribute("Name");
    if(customerName==null)
    {
        out.println("<script>alert('Login first!!');window.location.href='login.jsp';</script>");
    }
%>
        <header>
		<div class="container">
			<div class="headerHeading">
				<img src="images/cmsLogo.png">
				<!-- <h2>CMS</h2> -->
			</div>
			<div class="headerContent">
				<span>Welcome <%=customerName%></span>
				<button onclick="logoutCustomer()" class="logoutBTN">Logout</button>
			</div>
		</div>
	</header>
                                <script>
                                    function logoutCustomer()
                                    {
                                        window.location.href="logout.jsp";
                                    }
                                </script>