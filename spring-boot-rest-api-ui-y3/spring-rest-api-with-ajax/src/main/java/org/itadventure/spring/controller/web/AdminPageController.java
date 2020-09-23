package org.itadventure.spring.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author tola on 4/9/20
 **/

@Controller
public class AdminPageController {

    @RequestMapping({"/admin/dashboard","/admin"})
    public String dashboard(){
        return "admin/dashboard";
    }

    @RequestMapping({"/admin/user/list","/admin/user"})
    public String listUser(){
        return "admin/user-list";
    }

    @RequestMapping("/admin/user/add")
    public String addUser(){
        return "admin/user-add";
    }

    @RequestMapping({"/admin/role/list","/admin/role"})
    public String listRole(){
        return "admin/roles/role-list";
    }

    @RequestMapping("/admin/role/add")
    public String addRole(){
        return "admin/roles/role-add";
    }

    @RequestMapping("/admin/role/update/{id}")
    public String updateRole(@PathVariable Long id, ModelMap modelMap){
        modelMap.addAttribute("role_id" , id);
        return "admin/roles/role-update";
    }

    @RequestMapping("/admin/role/view/{id}")
    public String viewRole(@PathVariable Long id, ModelMap modelMap){
        modelMap.addAttribute("role_id" , id);
        return "admin/roles/role-view";
    }

}
