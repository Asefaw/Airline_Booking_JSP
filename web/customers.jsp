<%@page import="BussinessClass.FlightList"%>
<%@page import="BussinessClass.Flight"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Travel Agency</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/small-business.css" rel="stylesheet">

    
<style type="text/css">
    #mainChoice {
        font-size: 30pt;
    }
</style>
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                 <a class="navbar-brand" href="index.jsp">
                    <img src="http://placehold.it/150x50&text=HOME" alt="">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Heading Row -->
        <div class="row">
            <div class="col-md-8">
                 
            </div>
             
            <!-- /.col-md-4 -->
        </div>
        <br><br>
    
            <%   
        
         FlightList flight = new FlightList();
         
        ResultSet rst;
        rst = flight.view_customers();
        

        // calles method to delete a flight
        
        String cust_id = request.getParameter("removeCustomer");
        boolean success = flight.delete_customer(cust_id);
        if(success){
            rst = flight.view_customers();
        }
    %>  
    <div align="center">  
        <form action="customers.jsp" method="POST">
        <h1>List of Flights </h1> <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Driver License</th>
                    <th>First Name </th>
                    <th>Last Name</th>
                    <th>Date of Birth</th>
                    <th>Email</th>
                    <th> Phone</th>
                    <th>Address</th>  
                    <th>City</th> 
                    <th>Zip Code</th>  
                    <th>State</th>  
                </tr>  
                    <% while(rst.next()) {%>
                    <tr>
                        <td> <%= rst.getString("CUSTOMERID")%> </td>
                        <td> <%= rst.getString("FIRSTNAME")%> </td>
                        <td> <%= rst.getString("LASTNAME")%> </td>
                        <td> <%= rst.getString("DOB")%> </td>
                        <td> <%= rst.getString("EMAIL")%> </td>
                        <td> <%= rst.getString("PHONE")%> </td>
                        <td> <%= rst.getString("ADDRESS")%> </td>  
                        <td> <%= rst.getString("CITY")%> </td>
                        <td> <%= rst.getString("ZIPCODE")%> </td> 
                        <td> <%= rst.getString("STATE")%> </td>  
                        <td>Remove <input type="radio" name="removeCustomer" 
                                          value="<%= rst.getString("CUSTOMERID")%>" required/>
                        </td>
                        
                    </tr>
                    <%}%>             
        </table><br><br> 
        <input type="submit" value="CONFIRM">
        </form>
        <br><br><br>
         
        

</div>
  <br><br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>       
        
        <!-- /.row -->

        <hr>

        

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>