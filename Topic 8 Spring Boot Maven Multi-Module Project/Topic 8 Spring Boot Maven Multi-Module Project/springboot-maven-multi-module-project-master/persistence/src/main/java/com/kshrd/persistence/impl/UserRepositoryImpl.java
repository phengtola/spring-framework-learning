package com.kshrd.persistence.impl;

import com.kshrd.domain.User;
import com.kshrd.persistence.UserRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by tolapheng on 7/17/17.
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

    @Override
    public User findUserByEmail(String email) {
        return new User(1,"Thai");
    }
}
