--------------------------------------------------------
--  File created - Sunday-May-08-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function GET_ITINERARY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."GET_ITINERARY" 
(
  rsv_code reservation.reservationcode%type
)
RETURN TYPES.REF_CURSOR
AS 
  ticket_cursor TYPES.REF_CURSOR;
BEGIN
  OPEN ticket_cursor FOR
    SELECT r.ReservationCode,firstName,lastName,r.FlightID,DEPARTCITY,DEPARTDATE,DESTINATION,ARIVALDATE,FLIGHTTYPE,r.Amount
    FROM reservation r INNER JOIN flight f
        ON r.flightid = f.flightid
        INNER JOIN customer cust
        ON r.CustomerID = cust.CustomerID
    WHERE  reservationcode = rsv_code;
  RETURN ticket_cursor;
END GET_ITINERARY;

/
--------------------------------------------------------
--  DDL for Function GETDAILYSALES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."GETDAILYSALES" 
(
  flight_id IN reservation.flightid%type
)
RETURN NUMBER 
AS
  total_sales NUMBER;
  cursor getTotal IS
      SELECT SUM(amount)
      FROM   reservation
      WHERE  flightID = flight_id;
BEGIN 
  OPEN getTotal;
  FETCH getTotal INTO total_sales;
    if(getTotal%notfound) then
      total_sales := 0;
    end if;
  CLOSE getTotal;
  RETURN total_sales;
   
END GETDAILYSALES;

/
--------------------------------------------------------
--  DDL for Function GETFLIGHTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."GETFLIGHTS" 
(depart IN varchar2, dest IN varchar2, fType IN VARCHAR2) 
    RETURN Types.ref_cursor
AS
    stock_cursor types.ref_cursor;
BEGIN
    OPEN stock_cursor FOR 
    	SELECT * FROM flight
    	WHERE departcity = depart AND 
            destination = dest AND
            flighttype = fType;
    RETURN stock_cursor;
END getFlights;

/
--------------------------------------------------------
--  DDL for Function VIEWAIRPORTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."VIEWAIRPORTS" 
RETURN TYPES.ref_cursor
  AS 
    flight_cursor Types.ref_cursor;
BEGIN
  OPEN flight_cursor for
    SELECT * 
    FROM airport;    
  RETURN flight_cursor;
END VIEWAIRPORTS;

/
--------------------------------------------------------
--  DDL for Function VIEWCUSTOMER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."VIEWCUSTOMER" 
RETURN TYPES.ref_cursor
AS 
  cust_cursor TYPES.ref_cursor;
BEGIN
  open cust_cursor for 
    select * 
    from customer;
  RETURN cust_cursor;
END VIEWCUSTOMER;

/
--------------------------------------------------------
--  DDL for Function VIEWFLIGHTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADMIN"."VIEWFLIGHTS" 
RETURN TYPES.ref_cursor
  AS 
    flight_cursor Types.ref_cursor;
BEGIN
  OPEN flight_cursor for
    SELECT * 
    FROM flight;    
  RETURN flight_cursor;
END VIEWFLIGHTS;

/
