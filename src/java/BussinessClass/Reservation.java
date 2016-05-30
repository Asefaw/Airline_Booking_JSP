/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BussinessClass;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abush
 */

public class Reservation {
    
    String url  = "jdbc:oracle:thin:@localhost:1521:oracle";
    String user = "admin";
    String pass = "admin";
    Connection conn;
    
    
    public Reservation(){
         
    }
    public void getConnection(){
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
            conn = DriverManager.getConnection(url, user, pass);
        } catch (SQLException ex) {
            System.out.println(ex.toString());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Flight.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public boolean saveCustomer(String id, String fn, String ln,String Dob,String email,String phone,
                                String addr,String city,String zip, String state){
        
        try{
            this.getConnection();
            String sql = "{(call addCustomer(?,?,?,?,?,?,?,?,?,?)}";
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             java.util.Date date = sdf.parse(Dob);
             java.sql.Date dob = new java.sql.Date(date.getTime());
              
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, id);
            stmt.setString(2, fn);
            stmt.setString(3,ln); 
            stmt.setDate(4, dob);
            stmt.setString(5, email); 
            stmt.setString(6, phone);
            stmt.setString(7, addr);
            stmt.setString(8, city);
            stmt.setString(9, zip);
            stmt.setString(10, state);            
                stmt.execute();
                conn.close();
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    } 
    
    public String saveReservation(String flight_id,String cust_id,String ccard,int exp_mon,int exp_year,double amount){
         System.out.println(flight_id);
        try{
            String reservationCode = UUID.randomUUID().toString();
            this.getConnection();
            String sql = "{(call ADDRESERVATION (?,?,?,?,?,?,?)}";
            CallableStatement stmt = conn.prepareCall(sql);
            stmt.setString(1, reservationCode);
            stmt.setString(2, flight_id);
            stmt.setString(3,cust_id); 
            stmt.setString(4, ccard);
            stmt.setInt(5, exp_mon); 
            stmt.setInt(6, exp_year);
            stmt.setDouble(7, amount);
             
            stmt.execute();
                conn.close();
                return reservationCode;      
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    
    
    public ResultSet get_itinerary(String rsv_code){
        String command = ("{? = call GET_ITINERARY(?)}");
        this.getConnection();
        try{
            CallableStatement cstmt = conn.prepareCall(command);
            cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            cstmt.setString(2, rsv_code);
            cstmt.execute();
            
            ResultSet rst = (ResultSet) cstmt.getObject(1);
            
            return rst;
        }catch(Exception ex){
            ex.printStackTrace();
        }
         
            
        return null;
    }
    
    public boolean cancel_reservation(String rsv_code){
        this.getConnection();
        String command = ("{call CANCELRESERVATION(?)}");
        try{
            CallableStatement cstmt = conn.prepareCall(command);
            cstmt.setString(1, rsv_code);
            cstmt.execute();
            conn.close();
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
    
    
}
