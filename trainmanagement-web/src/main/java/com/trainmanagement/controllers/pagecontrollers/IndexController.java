package com.trainmanagement.controllers.pagecontrollers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class IndexController {

    @RequestMapping(value = "/")
    public String indexPage(HttpSession session, HttpServletRequest request) {

        boolean isAdmin = request.isUserInRole("admin");

        if(isAdmin){
            session.setAttribute("admin",true);
            return "redirect:/admin/index";}
        else {
            session.setAttribute("admin",false);
            return "redirect:user/index";}
    }
}
