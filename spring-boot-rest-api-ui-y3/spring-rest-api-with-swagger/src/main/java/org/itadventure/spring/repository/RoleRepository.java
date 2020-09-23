package org.itadventure.spring.repository;

import org.itadventure.spring.model.Role;

import java.util.List;

public interface RoleRepository {

    boolean addRole(Role role);
    boolean updateRole(Role role);
    boolean deleteById(Long id);
    List<Role> findAll();
    Role findById(Long id);

    List<Role> findRolesByUserId(Long id);


}
