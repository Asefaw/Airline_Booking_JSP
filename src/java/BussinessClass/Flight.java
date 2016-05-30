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
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author abush
 */
public class Flight {
     
    private String flightID,depart,destination,departDate,arivalDate,flightCost,flightType;
     
    
    
    public Flight(){
         
    }
    
    // setters
    public void setFlightID(String id){
        this.flightID = id;
    }
    
    public void setDepartCity(String city){
        this.depart = city;
    }
    
    public void setDepartDate(String date){
        this.departDate = date;
    }
    
    public void setDestination(String destCity){
        this.destination = destCity;
    }
    
    public void setArivalDate(String date){
        this.arivalDate = date;
    }
    
    public void setFlightCost(String cost){
        this.flightCost = cost;
    }
    
    public void setFlightType(String type){
        this.flightType = type;
    }
    // end of setters
   
    //getters
    public String getFlightID(){
        return this.flightID;
    }
    
    public String getDepartCity(){
        return this.depart;
    }
    
    public String getDepartDate(){
        return this.departDate;
    }
    
    public String getDestination(){
        return this.destination;
    }
    
    public String getArivalDate(){
        return this.arivalDate;
    }
    
    public String getFlightCost(){
        return this.flightCost;
    }
    
    public String getFlightType(){
        return this.flightType;
    }
    
      
}
