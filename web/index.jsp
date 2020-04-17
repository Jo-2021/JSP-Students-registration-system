<%-- 
    Document   : index
    Created on : Feb 19, 2020, 11:34:58 AM
    Author     : Abdul-matin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% 
    if(request.getParameter("submit") != null){
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        
        String url = "jdbc:mysql://localhost/student";
        String user = "root";
        String pwd = "";
        
        Connection con = null;
        PreparedStatement pst = null;
        
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pwd);
        
            String sql = "INSERT INTO register(first_name, last_name, course, fee) VALUES(?, ?, ?, ?)";
            
            pst = con.prepareStatement(sql);
            
            pst.setString(1, fName);
            pst.setString(2, lName);
            pst.setString(3, course);
            pst.setString(4, fee);
            
            pst.executeUpdate();
            
            %>
            <script>
                   alert("Record Added Successfully"); 
            </script>
             <%    
    }
 
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Students Registration System</title>
        <link href="w3-boot/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1>Students Registration</h1>
            <div class="row">
                <div class="col-sm-4">
                    <form action="#" method="POST">

                        <div align="left">
                            <label class="form-label">First Name</label>
                            <input type="text" id="fname" name="fname" class="form-control" required>
                        </div>

                        <div align="left">
                            <label class="form-label">Last Name</label>
                            <input type="text" id="lname" name="lname" class="form-control" required>
                        </div>

                        <div align="left">
                            <label class="form-label">Course</label>
                            <input type="text" id="course" name="course" class="form-control" required>
                        </div>
                        <div align="left">
                            <label class="form-label">Fee</label>
                            <input type="number" id="fee" name="fee" class="form-control" required>
                        </div>
                       
                        <br>
                        <div align="right">
                            <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Submit">
                            <input type="reset" id="reset" name="reset" class="btn btn-secondary" value="Reset">
                        </div>

                    </form>
                </div>
                <div class="col-sm-8">
                    <div class="panel-control">
                        <table class="table table-responsive table-dark table-striped" id="tab">
                            <thead>
                                <tr>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Course</th>
                                    <th>Fee</th>
                                </tr>
                            </thead>
                            <% 
                                String url = "jdbc:mysql://localhost/student";
                                String user = "root";
                                String pwd = "";

                                Connection con = null;
                                PreparedStatement pst = null;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, pwd);
                                String query = "SELECT * FROM register";
                                
                                pst = (PreparedStatement)con.prepareStatement(query);
                                rs = pst.executeQuery();

                                while(rs.next()){
                                    
                            %>
                            
                            <tbody>
                                <tr>
                                    <td><%= rs.getString("first_name") %></td>
                                    <td><%= rs.getString("last_name") %></td>
                                    <td><%= rs.getString("course") %></td>
                                    <td><%= rs.getString("fee") %></td>
                                    <td><a href="delete.jsp?id=<%= rs.getString("id") %>">Delete</a></td>
                                    <td><a href="edit.jsp?id=<%= rs.getString("id") %>">Edit</a></td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
                
            </div>
        </div>
    </body>
</html>
