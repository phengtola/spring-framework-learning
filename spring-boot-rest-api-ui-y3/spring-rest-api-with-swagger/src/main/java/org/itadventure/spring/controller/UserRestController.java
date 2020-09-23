package org.itadventure.spring.controller;

import org.itadventure.spring.model.Department;
import org.itadventure.spring.model.User;
import org.itadventure.spring.model.api.ApiResponse;
import org.itadventure.spring.model.form.UserAddFrm;
import org.itadventure.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
public class UserRestController {

    @Autowired
    private UserService userService;

    @GetMapping
    public ApiResponse findAll(){
        List<User> users = userService.findAll();
        if(users.size() > 0){
            return new ApiResponse("200","Data retrieved successfully", users);
        }
        return new ApiResponse("404", "No data!");
    }

    @GetMapping("/{id}")
    public ApiResponse findById(@PathVariable("id") Long id){
        User user = userService.findById(id);
        if(user != null){
            return  new ApiResponse("200" , "Data retrieved successfully", user);
        }
        return  new ApiResponse("404", "No data!");
    }

    @PostMapping
    public ApiResponse addUser(@RequestBody UserAddFrm userAddFrm){
        Department department = new Department();
        department.setId(userAddFrm.getDepartmentId());

        User user = new User();
        user.setDepartment(department);
        user.setUsername(userAddFrm.getUsername());
        user.setEmail(userAddFrm.getEmail());
        user.setAddress(userAddFrm.getAddress());
        user.setPassword(userAddFrm.getPassword());
        user.setStatus(userAddFrm.getStatus());

        if(userService.addUser(user)){
            return new ApiResponse("201", "Data inserted successfully");
        }
        return new ApiResponse("500", "Data did not insert.");
    }


}
