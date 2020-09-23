package org.itadventure.spring.repository.impl;

import org.itadventure.spring.model.Role;
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
public class RoleRepositoryImpl implements RoleRepository {

    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    @Autowired
    public RoleRepositoryImpl(DataSource dataSource) throws SQLException {
        this.connection = dataSource.getConnection();
    }

    @Override
    public boolean addRole(Role role) {
        try{
            String sql = "INSERT INTO role (role_name, status, user_id) VALUES (? ,?,?);";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,role.getRoleName());
            preparedStatement.setString(2, role.getStatus());
            preparedStatement.setLong(3, role.getUserId());
            if(preparedStatement.executeUpdate() != 0 ){
                return  true;
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateRole(Role role) {
        try{
            String sql = "UPDATE role SET role_name=? WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,role.getRoleName());
            preparedStatement.setLong(2, role.getId());
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
            String sql = "DELETE FROM role WHERE id=?";
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
    public List<Role> findAll() {
        try{
            String sql = "SELECT id, role_name, status, created_date, user_id FROM role;";
            preparedStatement = connection.prepareStatement(sql);

            List<Role> roles = new ArrayList<>();

            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                roles.add(new Role(
                        resultSet.getLong("id"),
                        resultSet.getString("role_name"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status"),
                        resultSet.getLong("user_id")
                ));
            }
            return roles;
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Role findById(Long id) {
        try{
            String sql = "SELECT id, role_name, status, created_date, user_id FROM role WHERE id=?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                return new Role(
                        resultSet.getLong("id"),
                        resultSet.getString("role_name"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status"),
                        resultSet.getLong("user_id"));
            }
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Role> findRolesByUserId(Long id) {
        try{
            String sql = "SELECT id, role_name, status, created_date, user_id FROM role WHERE user_id =?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setLong(1, id);
            List<Role> roles = new ArrayList<>();

            resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                roles.add(new Role(
                        resultSet.getLong("id"),
                        resultSet.getString("role_name"),
                        resultSet.getDate("created_date"),
                        resultSet.getString("status"),
                        resultSet.getLong("user_id")
                ));
            }
            return roles;
        }catch (SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
}
