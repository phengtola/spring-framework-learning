package org.krouacademy.app.thymeleaflayout.controller;

import org.springframework.stereotype.Controller;
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

}
