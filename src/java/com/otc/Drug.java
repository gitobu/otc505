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
public class Drug {
   private int drug_number;
    private String drug_name; 
    private String  drug_strength; 
    private int drug_form_id; 
    
    private int overdose_quantity; 
    private int overdose_period;
   
            

    
    public void setDrug_number(int dnu){
        drug_number = dnu;
	}
    public void setDrug_name(String dna){
	drug_name = dna;
	}
    public void setDrug_strength (String dst){
        drug_strength = dst;
        }	
    public void setDrug_form_id (int dfi){
        drug_form_id = dfi;
        }
   
    public void setOverdose_quantity (int ovq){
        overdose_quantity = ovq;
        }	
    public void setOverdose_period (int ovp){
        overdose_period = ovp;
        }
  
    
    public int getDrug_number(){
        return drug_number;
	}
    public String getDrug_name(){
	return drug_name;
	}
    public String getDrug_strength(){
        return drug_strength;
        }	
    public int getDrug_form_id(){
        return drug_form_id;
        }
    
    public int getOverdose_quantity(){
        return overdose_quantity;
        }	
    public int getOverdose_period(){
        return overdose_period;
        }

      
    
    
    
    
}
