package com.kshrd.controllers.rest;

import com.kshrd.domain.User;
import com.kshrd.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by tolapheng on 7/17/17.
 */

@RestController
public class UserRestController {

    private UserService userService;

    @Autowired
    public UserRestController(UserService userService){
        this.userService = userService;
    }

    @RequestMapping("/user")
    public User findUserByEmail(){
        return userService.findUserByEmail("");
    }

}
