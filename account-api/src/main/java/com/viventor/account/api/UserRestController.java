/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.viventor.account.api;

import com.viventor.account.model.Accounts;
import com.viventor.account.model.Users;
import com.viventor.account.repository.UsersRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author manuelmerida
 */
@RestController
@RequestMapping("/v1/users")
public class UserRestController {

    @Autowired
    UsersRepository userRepository;

    @RequestMapping(method = RequestMethod.GET, value = "/{id}/accounts")
    public @ResponseBody
    ResponseEntity<List<Accounts>> getAllUserAccounts(@PathVariable Long id) {
        List<Accounts> accounts = userRepository.findOne(id).getAccountsList();
        if (accounts != null) {
            return new ResponseEntity<>(accounts, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public @ResponseBody
    ResponseEntity<Users> getUser(@PathVariable Long id) {
        Users user = userRepository.findOne(id);
        if (user != null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

}
