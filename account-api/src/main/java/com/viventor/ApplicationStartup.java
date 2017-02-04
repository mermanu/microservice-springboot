/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor;

import com.viventor.account.enums.TransactionsType;
import com.viventor.account.model.Accounts;
import com.viventor.account.model.Operationtype;
import com.viventor.account.model.Trantype;
import com.viventor.account.model.Users;
import com.viventor.account.repository.OperationtypeRepository;
import com.viventor.account.repository.TrantypeRepository;
import com.viventor.account.repository.UsersRepository;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class ApplicationStartup
        implements ApplicationListener<ApplicationReadyEvent> {

    @Autowired
    UsersRepository userRepository;
    
    @Autowired
    TrantypeRepository trantypeRepository;
    
    @Autowired
    OperationtypeRepository operationtypeRepository;
    /**
     * This event is executed as late as conceivably possible to indicate that
     * the application is ready to service requests.
     */
    @Override
    public void onApplicationEvent(final ApplicationReadyEvent event) {

        Users user=new  Users();
        
        List<Accounts> accounts = new ArrayList<>();
        Accounts account = new Accounts();
        account.setActivated(Boolean.TRUE);
        account.setActivationkey("1234");
        account.setBalance(BigDecimal.ZERO);
        account.setCreationdate(new Date());
        Date expirationDate=new Date();
        expirationDate.setDate(expirationDate.getYear()+1);
        account.setExpirationdate(expirationDate);
        account.setIdentifier(UUID.randomUUID().toString());
        account.setTransactionsList(null);
        account.setUserid(user);
        accounts.add(account);
        
        
        user.setUsername("mmerida");
        user.setEmail("mmerida@host.com");
        user.setActivated(Boolean.TRUE);
        user.setPassword("nosedeque");
        user.setResetpasswordkey("1234");
        user.setAccountsList(accounts);
        
        userRepository.save(user);
        
        for(TransactionsType transactionType : TransactionsType.values()){
            Trantype trantype = new Trantype(transactionType.getValue(), transactionType.name());
            trantypeRepository.save(trantype);
        }
        
        operationtypeRepository.save(new Operationtype(Integer.SIZE, "Account transaction"));
        operationtypeRepository.save(new Operationtype(Integer.SIZE, "Other transaction"));
        
        return;
    }

}
