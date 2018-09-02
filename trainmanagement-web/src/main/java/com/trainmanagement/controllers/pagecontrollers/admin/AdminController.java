package com.trainmanagement.controllers.pagecontrollers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/admin")
public class AdminController {

    @RequestMapping(value ="/index" , method = RequestMethod.GET)
    public String index() {
        return "/admin/index-admin";
    }

    @RequestMapping(value ="/type" , method = RequestMethod.GET)
    public String type() {return "/admin/type-train";}

    @RequestMapping(value ="/accounts" , method = RequestMethod.GET)
    public String accounts() {
        return "/admin/accounts";
    }


}
