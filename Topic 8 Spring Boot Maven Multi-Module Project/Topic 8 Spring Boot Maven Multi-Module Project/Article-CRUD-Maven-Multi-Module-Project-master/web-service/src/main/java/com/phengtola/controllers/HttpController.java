package com.phengtola.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by tolapheng on 7/17/17.
 */

@Controller
@RequestMapping("/")
public class HttpController {


    @RequestMapping("test")
    @ResponseBody
    public String errorPage(){
        return "error";
    }

}

