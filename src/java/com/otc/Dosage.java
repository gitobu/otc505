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
    private int drug_number;
    private int age_min;
    private int age_max;
    private int quantity_min;
    private int quantity_max;
    private int period_min;
    private int period_max;
    private int overdose_quantity; 
    private int overdose_period;
    private int period_unit_id;
    
    public void setDrug_number(int dno){
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
    public int getDrug_number(){
        return drug_number;
    }
    public int getAge_min(){
        return drug_number;
    }
    public int getAge_max(){
        return drug_number;
    }
    public int getQuantity_min(){
        return drug_number;
    }
    public int getQuantity_max(){
        return drug_number;
    }
    public int getPeriod_min(){
        return drug_number;
    }
    public int getPeriod_max(){
        return drug_number;
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
