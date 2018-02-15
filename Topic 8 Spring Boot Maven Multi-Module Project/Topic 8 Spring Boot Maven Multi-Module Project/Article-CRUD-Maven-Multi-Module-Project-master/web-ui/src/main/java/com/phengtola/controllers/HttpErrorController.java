package com.phengtola.controllers;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by tolapheng on 7/17/17.
 */
public class HttpErrorController {

    @RequestMapping("/403")
    public String accessDeniedPage(){
        return "errors/access-denied";
    }

    @RequestMapping("/401")
    public String notAuthorize(){
        return "errors/401";
    }


}
