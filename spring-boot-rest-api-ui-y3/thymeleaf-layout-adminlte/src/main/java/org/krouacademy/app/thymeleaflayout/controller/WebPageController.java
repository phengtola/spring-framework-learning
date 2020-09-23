package org.krouacademy.app.thymeleaflayout.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebPageController {

    @RequestMapping({"/", "/home","/index"})
    public String home(){
        return "home";
    }

    @RequestMapping("/contact")
    public String contact(){
        return "contact";
    }

    @RequestMapping("/about")
    public String about(){
        return "about";
    }

}
