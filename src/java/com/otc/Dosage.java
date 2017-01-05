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
public class Dosage {
    private String drug_number;
    private int age_min;
    private int age_max;
    private int quantity_min;
    private int quantity_max;
    private int period_min;
    private int period_max;
    private int overdose_quantity; 
    private int overdose_period;
    private int period_unit_id;
    
    public void setDrug_number(String dno){
        drug_number = dno;
    }
    public void setAge_min(int ami){
        age_min = ami;
    }
    public void setAge_max(int ama){
        age_max = ama;
    }
    public void setQuantity_min(int qmi){
        quantity_min = qmi;
    }
    public void setQuantity_max(int qma){
        quantity_max = qma;
    }
    public void setPeriod_min(int pmi){
        period_min = pmi;
    }
    public void setPeriod_max(int pma){
        period_max = pma;
    }
    public void setPeriod_unit_id(int pui){
	period_unit_id = pui;
    } 
    public void setOverdose_quantity (int ovq){
        overdose_quantity = ovq;
        }	
    public void setOverdose_period (int ovp){
        overdose_period = ovp;
        }
    public String getDrug_number(){
        return drug_number;
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
    public int getQuantity_max(){
        return quantity_max;
    }
    public int getPeriod_min(){
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
