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
public class Drug_Form {
  private int drug_form_id;
  
    private String drug_form_description;
    
   public void setDrug_form_id(int id){
	drug_form_id = id;
	}
 
  public void setDrug_form_description (String f){
      drug_form_description = f;
        }	
 public int getDrug_form_id() {   
    return drug_form_id;
    }

  public String getDrug_form_description(){
     return drug_form_description;
 }  
}
