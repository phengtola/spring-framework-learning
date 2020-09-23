package org.itadventure.spring.repository;


import org.itadventure.spring.model.Department;

import java.util.List;

public interface DepartmentRepository {

    boolean addDepartment(Department role);
    boolean updateDepartment(Department department);
    boolean deleteById(Long id);
    List<Department> findAll();
    Department findById(Long id);

}
