<%-- 
    Document   : cancelReservation
    Created on : May 6, 2016, 6:05:06 PM
    Author     : abush
--%>

<%@page import="BussinessClass.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Confirmation</title>
    </head>
    <body> 
        <%
            Reservation reservation = new Reservation();
        String rsv_code = request.getParameter("RSVCode");
        boolean success = reservation.cancel_reservation(rsv_code);
        if(success){ %>
        <script type="text/javascript">
             alert("Your Reservation Has Been Canceled");
             window.location = "customer.jsp";
        </script>
            
        <%} %>
        

        
    </body>
</html>
