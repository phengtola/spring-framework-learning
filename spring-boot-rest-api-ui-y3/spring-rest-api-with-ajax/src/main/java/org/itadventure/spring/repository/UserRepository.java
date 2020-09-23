package org.itadventure.spring.repository;

import org.itadventure.spring.model.User;

import java.util.List;

public interface UserRepository {

    List<User> findAll();
    User findById(long id);
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean deleteById(Long id);

}
