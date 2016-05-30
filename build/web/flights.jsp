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
        String depart_city = request.getParameter("departCity");
        String destination = request.getParameter("destination");
        String type = request.getParameter("fType"); 
        
         FlightList flight = new FlightList();
         
        ResultSet rst;
        rst = flight.view_Flights();
        

        // calles method to delete a flight
        
        String flight_id = request.getParameter("removeFlight");
        boolean success = flight.delete_Flights(flight_id);
        if(success){
            rst = flight.view_Flights();
        }
    %>  
    <div align="center">  
        <form action="flights.jsp" method="POST">
        <h1>List of Flights </h1> <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>Flight Number</th>
                    <th>From </th>
                    <th>Stops At</th>
                     <th>Stops For </th>
                    <th>Flight Date</th>
                    <th>Destination</th>
                    <th>Arrival Date</th>
                    <th> Cost</th>
                    <th>Flight Type</th>  
                </tr>  
                    <% while(rst.next()) {%>
                    <tr>
                        <td> <%= rst.getString("FLIGHTID")%> </td>
                        <td> <%= rst.getString("DEPARTCITY")%> </td>
                        <td> <%= rst.getString("STOPS_AT")%> </td>
                        <td> <%= rst.getString("STOP_DURATION")%> </td>
                        <td> <%= rst.getDate("DEPARTDATE")%> </td>
                        <td> <%= rst.getString("DESTINATION")%> </td>
                        <td> <%= rst.getDate("ARIVALDATE")%> </td>
                        <td> <%= rst.getDouble("FLIGHTCOST")%> </td>
                        <td> <%= rst.getString("FLIGHTTYPE")%> </td>  
                        <td>Remove <input type="radio" name="removeFlight" 
                                          value="<%= rst.getString("FLIGHTID")%>" required/>
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

         

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>