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
   private String drug_number;
    private String drug_name; 
    private String  drug_strength; 
    private int drug_form_id; 

    public void setDrug_number(String dnu){
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
   
   
  
    
    public String getDrug_number(){
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

}
