/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.api;

import com.viventor.account.model.Accounts;
import com.viventor.account.model.Transactions;
import com.viventor.account.enums.TransactionsType;
import com.viventor.account.exceptions.BaseException;
import com.viventor.account.model.Trantype;
import com.viventor.account.repository.AccountsRepository;
import com.viventor.account.repository.TransactionsRepository;
import com.viventor.account.utils.MoneySerializer;
import java.math.BigDecimal;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author manuelmerida
 */
@RestController
@RequestMapping("/v1/transactions")
public class TransactionsRestController {

    @Autowired
    TransactionsRepository transactionRepository;

    @Autowired
    AccountsRepository accountsRepository;

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public @ResponseBody
    ResponseEntity<Transactions> getTransaction(@PathVariable Long id) {
        Transactions transaction = transactionRepository.findOne(id);
        if (transaction != null) {
            return new ResponseEntity<>(transaction, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deposit")
    @ExceptionHandler(BaseException.class)
    public @ResponseBody
    ResponseEntity<Transactions> deposit(@RequestBody Transactions transaction) throws BaseException {
        return executeOperationByType(transaction, TransactionsType.DEPOSIT);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/withdraw")
    @ExceptionHandler(BaseException.class)
    public @ResponseBody
    ResponseEntity<Transactions> widthdraw(@RequestBody Transactions transaction) throws BaseException {
        return executeOperationByType(transaction, TransactionsType.WITHDRAW);
    }

    /**
     * Execute the arithmetic operation specified by the type of transaction
     *
     * @param transaction
     * @param transactionType
     */
    private ResponseEntity<Transactions> executeOperationByType(Transactions transaction, TransactionsType transactionType) throws BaseException {
        transaction.setTrantypeid(new Trantype(transactionType.getValue()));
        transaction.setDate(new Date());

        Accounts account = accountsRepository.findOne(transaction.getAccountid().getId());
        BigDecimal amount = null;
        switch (transactionType) {
            case DEPOSIT:
                amount = account.getBalance().add(transaction.getAmount());
                break;
            case WITHDRAW:
                BigDecimal tmpAmount = account.getBalance().subtract(transaction.getAmount());
                if (tmpAmount.compareTo(BigDecimal.ZERO) < 0) {
                    throw new BaseException("Operation not allowed, not enough money in your account. Remaining: " 
                            + MoneySerializer.getLocaleValue(account.getBalance()));
                } else {
                    amount = account.getBalance().subtract(transaction.getAmount());
                    break;
                }
        }

        account.setBalance(amount);
        transaction.setBalance(amount);

        accountsRepository.save(account);
        transactionRepository.save(transaction);
        return new ResponseEntity<>(transaction, HttpStatus.OK);
    }

}
