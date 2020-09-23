package org.itadventure.spring.controller.api;

import org.itadventure.spring.model.Role;
import org.itadventure.spring.model.api.ApiResponse;
import org.itadventure.spring.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

//@Controller
@RestController
@RequestMapping("/api/v1/role")
public class RoleRestController {

    @Autowired
    private RoleService roleService;

    // TODO: FIND ALL API
    /*public List<Role> findAll(){
        List<Role> roles = new ArrayList<>();
        return roles;
    }*/
    //@RequestMapping(value = "/" , method = RequestMethod.GET)
    @GetMapping
    public ApiResponse findAll(){
        //return new ApiResponse("200","Successfully!!!",roleService.findAll());
        List<Role> roles = roleService.findAll();
        if(roles.size() >0){
            return new ApiResponse(
                    "200",
                    "Data retrieved successfully.",
                    roles);
        }else {
            return new ApiResponse("404" , "NO DATA!");
        }
    }

    @GetMapping("/{id}")
    public ApiResponse findById(@PathVariable("id") Long id){
        Role role = roleService.findById(id);
        if(role != null){
            return new ApiResponse(
                    "200",
                    "Data retrieved successfully.",
                    role
            );
        }
        return  new ApiResponse("404", "ID {"+id+"} not found!");
    }

    @PostMapping
    public ApiResponse addRole(@RequestBody Role role){
        if(roleService.addRole(role)){
            return new ApiResponse("201","Data inserted successfully.");
        }
        return new ApiResponse("400","Data did not insert.");
    }

    @PutMapping
    public ApiResponse updateRole(@RequestBody Role role){
        if(roleService.updateRole(role)){
            return new ApiResponse("200", "Data updated successfully");
        }
        return new ApiResponse("400","Data did not updated.");
    }

    @DeleteMapping("/{id}")
    public ApiResponse deleteRoleById(@PathVariable Long id){
        if(roleService.deleteById(id)){
            return new ApiResponse("200","ID {"+id+"} deleted.");
        }
        return new ApiResponse("400","ID {"+id+"} did not deleted.");
    }

}
