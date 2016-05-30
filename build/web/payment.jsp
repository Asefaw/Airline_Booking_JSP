<%-- 
    Document   : index
    Created on : Apr 6, 2016, 11:12:03 AM
    Author     : abush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        font-weight: bold;
        width: 900px;
        background-color: #ccccff;
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
        <br><br><%=request.getParameter("chooseFlight")%>
        <% String flight_cost = request.getParameter("amount"); 
           String flightID = request.getParameter("chooseFlight");
        %>
        <h3 align="center">Please Fill All Fields Below</h3>
            <div align="center" id="mainChoice">
                 
<div class="reformed-form">
	<form name="customer" action="reservation.jsp" method="POST">
		<fieldset>
			<legend>Customer Information</legend>
			<dl>
                            <dt>
                                <label for="firstName">First Name:</label>
                                <input type="text"   name="firstName" class="required" id="firstName" /> 
                            </dt>
				 
			</dl>
			<dl>
                            <dt>
                                <label for="lastname">Last name:</label>
                                <input type="text"   name="lastname" class="required" id="lastname" />
                            </dt>
				  
			</dl>
			<dl>
                            <dt>
                                <label for="dob">Date of Birth:</label>
                                <input type="text" name="dob" class="datepicker required" id="dob" />
                            </dt>				 
			</dl>
                        <dl>
                            <dt>
                                <label for="driverLicense">Driver License:</label>
                                <input type="text"  name="driverLicense" class="required" id="phone" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="phone">Phone:</label>
                                <input type="text"  name="phone" class="required" id="phone" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="email">Email:</label>
                                <input type="text"   name="email" class="required" id="email" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="street">Steet:</label>
                                <input type="text" name="street" class="required" id="street" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="city">City:</label>
                                <input type="text" value="" name="city" class="required" id="city" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="zipCode">Zip Code:</label>
                                <input type="text" value="" name="zipCode" class="required" id="zipCode" />
                            </dt> 
			</dl>
			<dl>
                            <dt>
                                <label for="state">State:</label> 
                                <select name="state" class="required" id="state">
                                        <option>Choose Your State</option>
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
                                </select>
                             <br><br>
			</dl>
				<fieldset>
				<strong> Payment Information</strong>
				<dl>
				<dt>
					<label for="creditCard">Credit Card Number:</label>
					<input type="text" name="creditCard" class="required" id="street" />
				</dt> 
			</dl>
			<dl>
				<dt>
					<label for="city">Expiration Month:</label>
					<input type="text" value="" name="expMonth" class="required" id="city" />
				</dt> 
			</dl>
			<dl>
				<dt>
					<label for="expYear">Expiration Year:</label>
					<input type="text" value="" name="expYear" class="required" id="zipCode" />
				</dt> 
			</dl>
				</fieldset>
			<input type="hidden" name="chooseFlight" value="<%= flightID %>" />
                        <input type="hidden" name="amount" value="<%= flight_cost%>" />
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
