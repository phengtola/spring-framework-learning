package com.phengtola.services;

import com.phengtola.domain.User;

/**
 * Created by tolapheng on 7/17/17.
 */
public interface UserService {

    User findUserByEmail(String email);

}
