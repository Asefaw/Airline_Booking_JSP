/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BussinessClass;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abush
 */
public class FlightList {
    
    String url  = "jdbc:oracle:thin:@localhost:1521:oracle";
    String user = "admin";
    String pass = "admin";
    Connection conn; 
     Flight flight; 
    
    public FlightList(){ 
        this.flight =  new Flight();
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
            conn = DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Flight.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     
    
   
    // to show flights for customer
    public ResultSet get_Flights(String depart,String dest,String type){
        String command = "select * from flight WHERE DEPARTCITY = ? AND DESTINATION = ? AND FLIGHTTYPE = ? ";
      try{
       
            PreparedStatement stmt = conn.prepareStatement(command); 
            stmt.setString(1, depart);
            stmt.setString(2, dest); 
            stmt.setString(3, type); 
            ResultSet rst = stmt.executeQuery();           
             
            return rst;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return null;
    }
    
    // to show all flights list for employee
    public ResultSet view_Flights(){
        String command = ("{? = call VIEWFLIGHTS()}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command);
            stmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            stmt.execute();  
            ResultSet rst = (ResultSet) stmt.getObject(1);
             
            return rst;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return null;
    }
    
    // deletes a flight
    public boolean delete_Flights(String flight_id){
        String command = ("{call DELETEFLIGHT(?)}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command); 
            stmt.setString(1, flight_id);
            stmt.execute();                
            return true;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return false;
    }
    
    // Adds a flight
    public boolean add_Flight(String flight_id,String depart,String depart_date,String destination,String arival_date,
                              String flight_cost, String flight_type,String stops_at,String duration){ 
      try{
             
            String sql = "{(call addFlight(?,?,?,?,?,?,?,?,?)}";
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             java.util.Date ddate = sdf.parse(depart_date);
             java.sql.Date departDate = new java.sql.Date(ddate.getTime());
             
             java.util.Date adate = sdf.parse(arival_date);
             java.sql.Date arivalDate = new java.sql.Date(adate.getTime());
             
              
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, flight_id);
            stmt.setString(2, depart);
            stmt.setDate(3,departDate); 
            stmt.setString(4, destination);
            stmt.setDate(5, arivalDate); 
            stmt.setDouble(6, Double.parseDouble(flight_cost));
            stmt.setString(7, flight_type);   
            stmt.setString(8, stops_at);
            stmt.setString(9, duration);
                stmt.execute();
                conn.close();
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    
    // deletes a flight
    public boolean update_Flight(String flight_id,String flight_cost){ 
      try{
             
            String sql = "{(call UPDATEFLIGHT(?,? )}";          
              
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, flight_id);
            stmt.setDouble(2, Double.parseDouble(flight_cost));            
            stmt.execute();
            conn.close();
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    
    // Adds airport
     public boolean add_Airport(String airport_id,String name,String email,String phone,String address,
                              String city, String zip, String state, String website){ 
      try{
             
            String sql = "{(call addAirport(?,?,?,?,?,?,?,?,?)}";           
                                    
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, airport_id);
            stmt.setString(2, name);
            stmt.setString(3,email); 
            stmt.setString(4, phone);
            stmt.setString(5, address); 
            stmt.setString(6, city);
            stmt.setString(7, zip);  
            stmt.setString(8, state);   
            stmt.setString(9, website);   
                stmt.execute();
                conn.close();
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
      return false;
     }
     
     
     // to show all Airports list for employee
    public ResultSet view_Airports(){
        String command = ("{? = call VIEWAIRPORTS()}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command);
            stmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            stmt.execute();  
            ResultSet rst = (ResultSet) stmt.getObject(1);
             
            return rst;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return null;
    }
    
    // deletes an Airport
    public boolean delete_airport(String airport_id){
        String command = ("{call DELETEAIRPORT(?)}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command); 
            stmt.setString(1, airport_id);
            stmt.execute();                
            return true;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return false;
    }
    
    
     // to show all Customers list for employee
    public ResultSet view_customers(){
        String command = ("{? = call VIEWCUSTOMER()}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command);
            stmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            stmt.execute();  
            ResultSet rst = (ResultSet) stmt.getObject(1);
             
            return rst;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return null;
    }
    
    // deletes an Airport
    public boolean delete_customer(String cust_id){
        String command = ("{call DELETECUSTOMER(?)}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command); 
            stmt.setString(1, cust_id);
            stmt.execute();                
            return true;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return false;
    }
    
    
     // to show a daily sale for a given flight for employee
    public double get_daily_sales(String flight_id){
        String command = ("{? = call GETDAILYSALES(?)}");
      try{
       
            CallableStatement stmt = conn.prepareCall(command);
            stmt.registerOutParameter(1, oracle.jdbc.OracleTypes.DOUBLE);
            stmt.setString(2, flight_id);
            stmt.execute();  
            double total = (double) stmt.getObject(1);
             
            return total;
            
      }catch(Exception ex){
          System.out.println(ex.toString());
      }
        return 0;
    }
}
