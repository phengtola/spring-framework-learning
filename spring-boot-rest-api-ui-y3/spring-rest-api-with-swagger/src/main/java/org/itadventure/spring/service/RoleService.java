package org.itadventure.spring.service;

import org.itadventure.spring.model.Role;

import java.util.List;

public interface RoleService {

    boolean addRole(Role role);
    boolean updateRole(Role role);
    boolean deleteById(Long id);
    List<Role> findAll();
    Role findById(Long id);


}
