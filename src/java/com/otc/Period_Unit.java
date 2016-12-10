/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.otc;

/**
 *
 * @author Gitobu
 */
public class Period_Unit {
     private int period_unit_id;
  
    private String period_unit_description;
    
   public void setPeriod_unit_id(int id){
	period_unit_id = id;
	}
 
  public void setPeriod_unit_description (String f){
      period_unit_description = f;
        }	
 public int getPeriod_unit_id() {   
    return period_unit_id;
    }

  public String getPeriod_unit_description(){
     return period_unit_description;
 }  
}
