/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.enums;

/**
 *
 * @author manuelmerida
 */
public enum TransactionsType {

    DEPOSIT(1), WITHDRAW(2);

    private Integer value;

    private TransactionsType(Integer value) {
        this.value = value;
    }
    
    public Integer getValue(){
        return this.value;
    }
}
