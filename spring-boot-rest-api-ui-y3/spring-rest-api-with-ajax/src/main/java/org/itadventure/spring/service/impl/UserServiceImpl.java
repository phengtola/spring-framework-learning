package org.itadventure.spring.service.impl;

import org.itadventure.spring.model.User;
import org.itadventure.spring.repository.UserRepository;
import org.itadventure.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User findById(long id) {
        return userRepository.findById(id);
    }

    @Override
    public boolean addUser(User user) {
        return userRepository.addUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return false;
    }

    @Override
    public boolean deleteById(Long id) {
        return false;
    }
}
