package org.itadventure.spring.service;

import org.itadventure.spring.model.User;

import java.util.List;

public interface UserService {

    List<User> findAll();
    User findById(long id);
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean deleteById(Long id);

}
