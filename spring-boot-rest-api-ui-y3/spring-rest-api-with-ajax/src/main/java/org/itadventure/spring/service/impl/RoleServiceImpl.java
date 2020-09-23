package org.itadventure.spring.service.impl;

import org.itadventure.spring.model.Role;
import org.itadventure.spring.repository.RoleRepository;
import org.itadventure.spring.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository repository;

    @Override
    public boolean addRole(Role role) {
        return repository.addRole(role);
    }

    @Override
    public boolean updateRole(Role role) {
        Role roleFind = repository.findById(role.getId());
        if(roleFind != null){
            roleFind.setRoleName(role.getRoleName());
            // .....
            // ....
            return repository.updateRole(roleFind);
        }
        return false;
    }

    @Override
    public boolean deleteById(Long id) {
        return repository.deleteById(id);
    }

    @Override
    public List<Role> findAll() {
        return repository.findAll();
    }

    @Override
    public Role findById(Long id) {
        return repository.findById(id);
    }
}
