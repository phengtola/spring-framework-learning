package com.kshrd.services;

import com.kshrd.domain.User;

/**
 * Created by tolapheng on 7/17/17.
 */
public interface UserService {

    User findUserByEmail(String email);

}
