package com.trainmanagement.controllers.pagecontrollers.user;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value ="/user")
public class UserController {

    @RequestMapping(value ="/index" , method = RequestMethod.GET)
    public String index() {
        return "/user/index-user";
    }

    @RequestMapping(value ="/passenger" , method = RequestMethod.GET)
    public String passenger() {
        return "/user/trains/passenger";
    }

    @RequestMapping(value ="/freight" , method = RequestMethod.GET)
    public String freight() {
        return "/user/trains/freight";
    }

    @RequestMapping(value = "/freight-sell/{trainId}", method = RequestMethod.GET)
    public String sellFreight(ModelMap modelMap,@PathVariable Integer trainId) {
        modelMap.addAttribute("trainId", trainId);
        return "/user/trains/freight-sell";
    }

}
