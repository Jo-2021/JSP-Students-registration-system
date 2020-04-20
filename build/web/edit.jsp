<%-- 
    Document   : edit
    Created on : Feb 24, 2020, 11:56:42 AM
    Author     : Abdul-matin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String id = request.getParameter("id");
    try
    {
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "");
        String sql = "UPDATE register SET first_name = ?, last_name = ?, course = ?, fee = ? WHERE id = ?";

        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, fName);
        pst.setString(2, lName);
        pst.setString(3, course);
        pst.setString(4, fee);
        pst.setString(5, id);
        
        pst.executeUpdate();
    
%>
            <script>
                   alert("Data Edited Successfully"); 
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
        <title>Edit</title>
        <link href="w3-boot/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Students Registration</h1>
            <div class="row">
                <div class="col-sm-4">
                    <form action="#" method="POST">
                        <% 
                                String url = "jdbc:mysql://localhost/student";
                                String user = "root";
                                String pwd = "";

                                Connection con = null;
                                PreparedStatement pst = null;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, pwd);
                                String query = "SELECT * FROM register WHERE id = ?";
                                
                                pst = con.prepareStatement(query);
                                pst.setString(1, id);
                                
                                rs = pst.executeQuery();

                                if(rs.next()){
                                    
                            %>

                        <div align="left">
                            <label class="form-label">First Name</label>
                            <input type="text" id="fname" name="fname" class="form-control" value="<%= rs.getString("first_name") %>">
                        </div>

                        <div align="left">
                            <label class="form-label">Last Name</label>
                            <input type="text" id="lname" name="lname" class="form-control" value="<%= rs.getString("last_name") %>">
                        </div>

                        <div align="left">
                            <label class="form-label">Course</label>
                            <input type="text" id="course" name="course" class="form-control" value="<%= rs.getString("course") %>">
                        </div>
                        <div align="left">
                            <label class="form-label">Fee</label>
                            <input type="number" id="fee" name="fee" class="form-control" value="<%= rs.getString("fee") %>">
                        </div>
                        <%
                                }
                            %>
                        <br>
                        <div align="right">
                            <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Submit">
                            <input type="reset" id="reset" name="reset" class="btn btn-secondary" value="Reset">
                        </div>

                    </form>
                    <a href="index.jsp">Go back to Home</a>
                </div>
                
            </div>
        </div>
        
        
    </body>
</html>
