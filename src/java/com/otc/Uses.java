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
public class Uses {
    private int drug_number;
    private int drug_use_id;
    
    public void setDrug_number(int dno){
        drug_number = dno;
    }
    public void setDrug_use_id(int dui){
        drug_use_id = dui;
    }
    public int getDrug_number(){
        return drug_number;
    }
    public int getDrug_use_id(){
        return drug_use_id;
    }
}
