--------------------------------------------------------
--  File created - Sunday-May-08-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ADDAIRPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADDAIRPORT" 
(
  airport_id IN airport.airportid%type,
  airport_name IN airport.airportname%TYPE,
  email_addr IN airport.email%TYPE,
  phone_numb IN airport.phone%TYPE,
  airport_addr IN airport.address%TYPE,
  airport_city IN airport.city%TYPE,
  airport_zip  IN airport.zipcode%TYPE,
  airport_state IN airport.state%TYPE,
  airport_web   IN airport.website%TYPE
  
) AS 
BEGIN
  INSERT INTO airport(
    AIRPORTID,
    AIRPORTNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    ZIPCODE,
    STATE,
    WEBSITE)
  VALUES (
    airport_id,
    airport_name,
    email_addr,
    phone_numb,
    airport_addr,
    airport_city,
    airport_zip,
    airport_state,
    airport_web);
   commit; 
END ADDAIRPORT;

/
--------------------------------------------------------
--  DDL for Procedure ADDCONNECTION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADDCONNECTION" 
(
  airport_id IN connection.airportid%type,
  flight_id  IN connection.flightid%type,
  arival_date IN connection.arivaldate%type,
  stop_over   IN connection.stopover%type,
  depart_date IN connection.departdate%type
)
AS 
BEGIN
  INSERT INTO connection
  (
    AirportID, 
    FlightID,
    ArivalDate,
    StopOver,
    DepartDate
  )
  VALUES
  (
    airport_id,
    flight_id,
    arival_date,
    stop_over,
    depart_date
  );
  commit;  
END;

/
--------------------------------------------------------
--  DDL for Procedure ADDCUSTOMER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADDCUSTOMER" 
(
  cust_id IN customer.customerid%type,
  f_name  IN customer.firstname%type,
  l_name  IN customer.lastname%type,
  dob     IN customer.dob%type,
  c_email IN customer.email%type,
  c_phone IN customer.phone%type,
  c_addr  IN customer.address%type,
  c_city  IN customer.city%type,
  c_zip   IN customer.zipcode%type,
  c_state IN customer.state%type
)
AS 
BEGIN
  INSERT INTO customer
  (
    customerID,
    FirstName,
    LastName,
    DOB,
    Email,
    Phone,
    Address,
    City,
    ZipCode,
    State
  )
  VALUES
  (
    cust_id,f_name,l_name,dob,c_email,c_phone,c_addr,c_city,c_zip,c_state
  );
  commit;
END;

/
--------------------------------------------------------
--  DDL for Procedure ADDFLIGHT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADDFLIGHT" 
(
  FLIGHT_ID IN flight.flightid%TYPE
, DEPART_CITY IN flight.departcity%TYPE
, DEPART_DATE IN flight.departdate%TYPE 
, DESTINATION_CITY IN flight.destination%TYPE  
, ARIVAL_DATE IN  flight.arivaldate%TYPE 
, FLIGHT_COST IN  flight.flightcost%TYPE 
, FLIGHT_TYPE IN  flight.flighttype%TYPE
, STOPS_AT    IN  flight.stops_at%type
, STOP_DURATION IN flight.stop_duration%type 
) AS 
BEGIN 
   
  insert into flight(    
    FLIGHTID, 
    DEPARTCITY, 
    DEPARTDATE, 
    DESTINATION, 
    ARIVALDATE, 
    FLIGHTCOST, 
    FLIGHTTYPE,
    STOPS_AT, 
    STOP_DURATION,
    FLIGHTINDEX
    )
  values (
    FLIGHT_ID, 
    DEPART_CITY, 
    DEPART_DATE, 
    DESTINATION_CITY, 
    ARIVAL_DATE, 
    FLIGHT_COST, 
    FLIGHT_TYPE,
    STOPS_AT,
    STOP_DURATION,
    FLIGHTID.nextval);
    commit;
    
END;

/
--------------------------------------------------------
--  DDL for Procedure ADDRESERVATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."ADDRESERVATION" 
(
  reserve_code IN reservation.reservationcode%TYPE,
  flight_id    IN reservation.flightid%TYPE,
  cust_id      IN reservation.customerid%TYPE,
  credit_card  IN reservation.creditcard%TYPE,
  exp_month    IN reservation.expmonth%TYPE,
  exp_year     IN reservation.expyear%TYPE,
  total_amount IN reservation.amount%TYPE
)
AS 
BEGIN
  INSERT INTO reservation (
    ReservationCode,
    FlightID,
    CustomerID,
    CreditCard,
    ExpMonth,
    ExpYear,
    Amount)
  VALUES (
    reserve_code,
    flight_id,
    cust_id,
    credit_card,
    exp_month,
    exp_year,
    total_amount);
    
END ADDRESERVATION ;

/
--------------------------------------------------------
--  DDL for Procedure CANCELRESERVATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."CANCELRESERVATION" 
(
  rsv_code IN reservation.reservationcode%type  
) AS 
BEGIN
  delete from reservation 
  where reservationcode = rsv_code;
  commit;
END CANCELRESERVATION;

/
--------------------------------------------------------
--  DDL for Procedure DELETEAIRPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."DELETEAIRPORT" 
(
  AIRPORT_ID IN airport.airportid%type
) 
AS 
BEGIN
  DELETE 
  FROM   airport
  WHERE  airportid =  AIRPORT_ID;
  commit;
END DELETEAIRPORT;

/
--------------------------------------------------------
--  DDL for Procedure DELETECUSTOMER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."DELETECUSTOMER" 
  (
    cust_id  IN customer.customerid%type
  )
  AS
BEGIN
  DELETE FROM customer
  WHERE customerid = cust_id;
END DELETECUSTOMER;

/
--------------------------------------------------------
--  DDL for Procedure DELETEFLIGHT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."DELETEFLIGHT" 
(
  FLIGHT_ID IN flight.flightid%type
) 
AS 
BEGIN
  DELETE 
  FROM   flight
  WHERE  flightid =  FLIGHT_ID;
  commit;
END DELETEFLIGHT;

/
--------------------------------------------------------
--  DDL for Procedure UPDATEFLIGHT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."UPDATEFLIGHT" 
(
  flight_id IN flight.flightid%type,
  new_price IN flight.flightcost%type 
) AS 
BEGIN
  UPDATE flight
  SET    flightcost = new_price
  WHERE  flightid = flight_id;
  commit;
END UPDATEFLIGHT;

/
