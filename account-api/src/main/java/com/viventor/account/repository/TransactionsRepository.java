/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.repository;

import com.viventor.account.model.Accounts;
import com.viventor.account.model.Transactions;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 *
 * @author manuelmerida
 */
@RepositoryRestResource
public interface TransactionsRepository extends CrudRepository<Transactions, Long>{
   List<Transactions> findByAccountid(Accounts accountid);
}
