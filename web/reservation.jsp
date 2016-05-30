<%@page import="BussinessClass.Reservation"%>
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
                    <img src="http://placehold.it/150x50&text=Logo" alt="">
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
           String flight_cost = request.getParameter("amount"); 
           String flight_id = request.getParameter("chooseFlight");
           String first_name = request.getParameter("firstName");
           String last_name = request.getParameter("lastname");
           String dob = request.getParameter("dob");
           String cust_id = request.getParameter("driverLicense");
           String phone = request.getParameter("phone");
           String email = request.getParameter("email");
           String street = request.getParameter("street");
           String city = request.getParameter("city");
           String zipCode = request.getParameter("zipCode");
           String state = request.getParameter("state");
           
           //payment info
           String creditCard = request.getParameter("creditCard");
           String expMonth = request.getParameter("expMonth");
           String expYear = request.getParameter("expYear"); 
           
           // call processing classes
           
           Reservation reserve = new Reservation();
           // Save Customer
           boolean customerSaved = reserve.saveCustomer(cust_id, first_name, last_name, dob, email, 
                                                        phone, street, city, zipCode, state);
           
           // msave reservation and return reservation code
           String reservation_code = reserve.saveReservation(flight_id, cust_id, creditCard, 
                   Integer.parseInt(expMonth), Integer.parseInt(expYear), Double.parseDouble(flight_cost));
            
           if(customerSaved && reservation_code != null){ 
               out.println("<h1 align=center> CONFIRMATION</h1> <hr>");
               out.println("<h2 align=center> Your Filight has Been Booked Succuessfully.</h2>");
               out.println("<h2 align=center> Your Reservation Code is: <b>"+reservation_code + "<b> </h2>");
               out.println("<h2 align=center> Please Save this Code for your reference.</h2>");
           }%>
           
        
            </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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



 