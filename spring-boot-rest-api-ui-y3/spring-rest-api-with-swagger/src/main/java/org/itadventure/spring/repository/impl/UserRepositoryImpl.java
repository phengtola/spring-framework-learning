package org.itadventure.spring.repository.impl;

import org.itadventure.spring.model.Department;
import org.itadventure.spring.model.Role;
import org.itadventure.spring.model.User;
import org.itadventure.spring.repository.RoleRepository;
import org.itadventure.spring.repository.UserRepository;
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
public class UserRepositoryImpl implements UserRepository {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Autowired
    private RoleRepository repository;

    @Autowired
    public UserRepositoryImpl(DataSource dataSource) throws SQLException {
        this.connection = dataSource.getConnection();
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT " +
                " u.id ,u.username, u.email, u.password, u.address, " +
                " u.created_date, u.status, " +
                " d.id as department_id, d.department_name " +
                " FROM users u INNER JOIN department d ON u.department_id = d.id;";
        try{
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            List<User> users = new ArrayList<>();
            while (resultSet.next()){
                // TODO: findRolesByUserId
                List<Role> roles = repository.findRolesByUserId(resultSet.getLong("id"));

                Department department = new Department();
                department.setId(resultSet.getLong("department_id"));
                department.setDepartmentName(resultSet.getString("department_name"));
                users.add(
                    new User(
                            resultSet.getLong("id"),
                            resultSet.getString("username"),
                            resultSet.getString("email"),
                            resultSet.getString("password"),
                            resultSet.getString("address"),
                            resultSet.getDate("created_date"),
                            resultSet.getString("status"),
                            department,
                            roles
                    )
                );
            }
            return users;
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public User findById(long id) {
        String sql = "SELECT " +
                " u.id ,u.username, u.email, u.password, u.address, " +
                " u.created_date, u.status, " +
                " d.id as department_id, d.department_name " +
                " FROM users u INNER JOIN department d ON u.department_id = d.id WHERE u.id=?;";
        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                // TODO: findRolesByUserId
                List<Role> roles = repository.findRolesByUserId(resultSet.getLong("id"));

                Department department = new Department();
                department.setId(resultSet.getLong("department_id"));
                department.setDepartmentName(resultSet.getString("department_name"));
                return new User(
                        resultSet.getLong("id"),
                        resultSet.getString("username"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        resultSet.getString("address"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status"),
                        department,
                        roles
                );
            }
            return null;
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean addUser(User user) {
        System.out.println(user.toString());
        String sql = "INSERT INTO users(" +
                " username, email, password, address, status, department_id) " +
                " VALUES( " +
                " ? , ?, ?, ?, ?, ?" +
                ")";
        try{
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getStatus());
            preparedStatement.setLong(6, user.getDepartment().getId());
            if(preparedStatement.executeLargeUpdate() != 0){
                return true;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return false;
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
