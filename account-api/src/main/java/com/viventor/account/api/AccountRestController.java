/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.api;

import com.viventor.account.model.Accounts;
import com.viventor.account.model.Transactions;
import com.viventor.account.repository.AccountsRepository;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/v1/accounts")
public class AccountRestController {
    
    @Autowired
    AccountsRepository accountsRepository;
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}/transactions")
    public @ResponseBody
    ResponseEntity<List<Transactions>> getAllAccountTransactions(@PathVariable Long id) {
        Accounts account = accountsRepository.findOne(id);
        if (account != null) {
            return new ResponseEntity<>(account.getTransactionsList(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public @ResponseBody
    ResponseEntity<Accounts> getAccount(@PathVariable Long id) {
        Accounts account = accountsRepository.findOne(id);
        if (account != null) {
            return new ResponseEntity<>(account, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }
    
    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody
    ResponseEntity<Accounts> create(@RequestBody Accounts account) {
        UUID uuid = UUID.randomUUID();
        account.setIdentifier(uuid.toString());
        account.setCreationdate(new Date());
        Date expirationDate =new Date();
        expirationDate.setYear(expirationDate.getYear() + 1);
        account.setExpirationdate(expirationDate);
        return new ResponseEntity<>(accountsRepository.save(account), HttpStatus.OK);
    }
    
}
