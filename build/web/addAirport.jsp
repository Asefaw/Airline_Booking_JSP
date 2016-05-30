<%-- 
    Document   : addFlight
    Created on : Apr 24, 2016, 10:57:22 PM
    Author     : A
--%>

<%@page import="BussinessClass.FlightList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Small Business - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/small-business.css" rel="stylesheet">
 
<style type="text/css">
    #mainChoice {
        font-size: 15pt;
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
            String airport_id = request.getParameter("airportID");
            String airport_name = request.getParameter("airportName");
            String airport_email = request.getParameter("airportEmail");
            String airport_phone = request.getParameter("airportPhone");
            String airport_address = request.getParameter("airportAddress");
            String airport_city= request.getParameter("airportCity");
            String airport_zip= request.getParameter("airportZipCode");
            String airport_state = request.getParameter("airportState");
            String airport_web = request.getParameter("airportWebsite");
            
            // adding a new flight
            FlightList flight = new FlightList();
            
            
            boolean success = flight.add_Airport(airport_id, airport_name, airport_email, airport_phone, airport_address, 
                                                 airport_city, airport_zip, airport_state, airport_web);
            if(success){ %>
            <script type="text/javaScript"> 
                window.location = "airports.jsp"; 
            </script>
                
            <%}
        %>
        
        
        
            <div align="center" id="mainChoice"> 
                <h1>Add Airport Form</h1> <br>
        <form method="post" name="customer" id="customer" action="addAirport.jsp">
	<fieldset>
            <dl> 
            Airport ID:
            <input type="text" name="airportID" required /> 
            </dl>
            <dl>
            Airport Name:
            <input type="text" name="airportName" required />
            </dl>
            <dl>
            Airport Email:
            <input type="text" name="airportEmail" required />
            </dl>
            <dl>
            Phone Number:
            <input type="text" name="airportPhone" required />
            </dl>
            <dl>
            Airport Address:
            <input type="text" name="airportAddress" required /> </dl>
            <dl>
            Airport City:
            <input type="text" name="airportCity" required />   </dl>
            <dl>
            Airport Zip Code:
            <input type="text" name="airportZipCode" required /> </dl>
            <dl>
            Airport State:
            <select name="airportState" required>
                <option> </option>
            <option value="AL">Alabama</option>
            <option value="AK">Alaska</option>
            <option value="AZ">Arizona</option>
            <option value="AR">Arkansas</option>
            <option value="CA">California</option>
            <option value="CO">Colorado</option>
            <option value="CT">Connecticut</option>
            <option value="DE">Delaware</option>
            <option value="DC">District of Columbia</option>
            <option value="FL">Florida</option>
            <option value="GA">Georgia</option>
            <option value="HI">Hawaii</option>
            <option value="ID">Idaho</option>
            <option value="IL">Illinois</option>
            <option value="IN">Indiana</option>
            <option value="IA">Iowa</option>
            <option value="KS">Kansas</option>
            <option value="KY">Kentucky</option>
            <option value="LA">Louisiana</option>
            <option value="ME">Maine</option>
            <option value="MD">Maryland</option>
            <option value="MA">Massachusetts</option>
            <option value="MI">Michigan</option>
            <option value="MN">Minnesota</option>
            <option value="MS">Mississippi</option>
            <option value="MO">Missouri</option>
            <option value="MT">Montana</option>
            <option value="NE">Nebraska</option>
            <option value="NV">Nevada</option>
            <option value="NH">New Hampshire</option>
            <option value="NJ">New Jersey</option>
            <option value="NM">New Mexico</option>
            <option value="NY">New York</option>
            <option value="NC">North Carolina</option>
            <option value="ND">North Dakota</option>
            <option value="OH">Ohio</option>
            <option value="OK">Oklahoma</option>
            <option value="OR">Oregon</option>
            <option value="PA">Pennsylvania</option>
            <option value="RI">Rhode Island</option>
            <option value="SC">South Carolina</option>
            <option value="SD">South Dakota</option>
            <option value="TN">Tennessee</option>
            <option value="TX">Texas</option>
            <option value="UT">Utah</option>
            <option value="VT">Vermont</option>
            <option value="VA">Virginia</option>
            <option value="WA">Washington</option>
            <option value="WV">West Virginia</option>
            <option value="WI">Wisconsin</option>
            <option value="WY">Wyoming</option>
            </select> </dl>
            <dl>
            Airport Website:
            <input type="text" name="airportWebsite"  required /> </dl>
             
            
             
            <div id="submit_buttons">
                    <button type="reset">Reset</button>
                    <button type="submit">Submit</button>
            </div>
	</fieldset>
</form>
            </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <!-- /.row -->

        <hr>

         
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








  
