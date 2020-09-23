package org.itadventure.spring.repository.impl;

import org.itadventure.spring.model.Department;
import org.itadventure.spring.model.Role;
import org.itadventure.spring.repository.DepartmentRepository;
import org.itadventure.spring.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class DepartmentRepositoryImpl implements DepartmentRepository {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Autowired
    public DepartmentRepositoryImpl(DataSource dataSource) throws SQLException {
        this.connection = dataSource.getConnection();
    }

    @Override
    public boolean addDepartment(Department department) {
        try{
            String sql = "INSERT INTO department (department_name, status) VALUES (? ,?);";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,department.getDepartmentName());
            preparedStatement.setString(2, department.getStatus());
            if(preparedStatement.executeUpdate() != 0 ){
                return  true;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateDepartment(Department department) {
        try{
            String sql = "UPDATE department SET department_name=? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,department.getDepartmentName());
            preparedStatement.setLong(2, department.getId());
            if(preparedStatement.executeUpdate() != 0 ){
                return  true;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteById(Long id) {
        try{
            String sql = "DELETE FROM department WHERE id=?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1,id);
            if(preparedStatement.executeUpdate() != 0 ){
                return  true;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Department> findAll() {
        try{
            String sql = "SELECT id, department_name, status, created_date FROM department;";
            preparedStatement = connection.prepareStatement(sql);

            List<Department> departments = new ArrayList<>();

            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                departments.add(new Department(
                        resultSet.getLong("id"),
                        resultSet.getString("department_name"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status")
                ));
            }
            return departments;
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Department findById(Long id) {
        try{
            String sql = "SELECT id, department_name, status, created_date FROM department WHERE id=?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return new Department(
                        resultSet.getLong("id"),
                        resultSet.getString("department_name"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status"));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
}
