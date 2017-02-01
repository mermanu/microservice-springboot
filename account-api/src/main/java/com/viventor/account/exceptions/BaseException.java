/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.exceptions;

/**
 *
 * @author manuelmerida
 */
public class BaseException extends Exception {

    private static final long serialVersionUID = 1L;
    private String errorMessage;

    public String getErrorMessage() {
        return errorMessage;
    }

    public BaseException(String errorMessage) {
        super(errorMessage);
        this.errorMessage = errorMessage;
    }

    public BaseException() {
        super();
    }
}
