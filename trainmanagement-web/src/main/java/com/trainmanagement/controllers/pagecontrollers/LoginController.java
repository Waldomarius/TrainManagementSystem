package com.trainmanagement.controllers.pagecontrollers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @RequestMapping(value ="login" , method = RequestMethod.GET)
    public String loginPage(){
        return "login";
    }

    @RequestMapping( value ="/logout" ,method = RequestMethod.GET)
    public String logOutPage(){
        return "redirect:/login";
    }

    @RequestMapping( value ="/access" ,method = RequestMethod.GET)
    public String accessDenied(){
        return "/access";
    }
}
