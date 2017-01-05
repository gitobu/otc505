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
public class Drug_use_warnings {
    private String drug_number;
    private int use_warning_id;
    
    public void setDrug_number(String dno){
        drug_number = dno;
    }
    public void setUse_warning_id(int uwi){
        use_warning_id = uwi;
    }
    public String getDrug_number(){
        return drug_number;
    }
    public int getUse_warning_id(){
        return use_warning_id;
    }
    
}
