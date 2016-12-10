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
    private int age_min; 
    private int age_max; 
    private int quantity_min; 
    private int quantity_max; 
    private int period_min; 
    private int period_max; 
    private int overdose_quantity; 
    private int overdose_period;
    private int period_unit_id;
            

    
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
    public void setAge_min(int agn){
	age_min = agn;
	}
    public void setAge_max(int agx){
        age_max = agx;
	}
    public void setQuantity_min(int qtn){
	quantity_min = qtn;
	}
    public void setQuantity_max (int qtx){
        quantity_max = qtx;
        }	
    public void setPeriod_min (int pen){
        period_min = pen;
        }
    public void setPeriod_max(int pex){
	period_max = pex;
	}    
    public void setOverdose_quantity (int ovq){
        overdose_quantity = ovq;
        }	
    public void setOverdose_period (int ovp){
        overdose_period = ovp;
        }
    public void setPeriod_unit_id(int pui){
	period_unit_id = pui;
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
    public int getAge_min(){
	return age_min;
	}
    public int getAge_max(){
        return age_max;
	}
    public int getQuantity_min(){
	return quantity_min;
	}
    public int getQuantity_max (){
        return quantity_max;
        }	
    public int getPeriod_min (){
        return period_min;
        }
    public int getPeriod_max(){
	return period_max;
	}    
    public int getOverdose_quantity(){
        return overdose_quantity;
        }	
    public int getOverdose_period(){
        return overdose_period;
        }
    public int getPeriod_unit_id(){
	return period_unit_id;
	} 
      
    
    
    
    
}
