package com.phengtola.services;

import com.phengtola.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by tolapheng on 7/17/17.
 */

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

    private UserService userService;

    @Autowired
    public CustomUserDetailsService(UserService userService){
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String email){

        User user = userService.findUserByEmail(email);

        if(user == null){
            throw new UsernameNotFoundException("User not found!");
        }

        System.out.println("After Fond user: enabled= " + user.isEnabled());

        return user;
    }



}
