<%-- 
    Document   : delete
    Created on : Feb 24, 2020, 11:56:42 AM
    Author     : Abdul-matin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
        
        String sql = "DELETE FROM register WHERE id=" + id;
        
        PreparedStatement st = conn.prepareStatement(sql);
        st.executeUpdate();
    
%>
            <script>
                   alert("Record Deleted Succesfuly"); 
            </script>
<%    
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="w3-boot/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Confirm Delete</title>
    </head>
    <body>
        <a href="index.jsp">Go back to Home</a>
    </body>
</html>
