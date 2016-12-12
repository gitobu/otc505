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
    private int drug_number;
    private int use_warning_id;
    
    public void setDrug_number(int dno){
        drug_number = dno;
    }
    public void setUse_warning_id(int uwi){
        use_warning_id = uwi;
    }
    public int getDrug_number(){
        return drug_number;
    }
    public int getUse_warning_id(){
        return use_warning_id;
    }
    
}
