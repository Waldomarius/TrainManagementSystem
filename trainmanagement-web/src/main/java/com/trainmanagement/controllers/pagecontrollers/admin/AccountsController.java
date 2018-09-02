package com.trainmanagement.controllers.pagecontrollers.admin;

import com.trainmanagement.data.RoleData;
import com.trainmanagement.data.UserData;
import com.trainmanagement.dto.UserDto;
import com.trainmanagement.pojo.Role;
import com.trainmanagement.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/accounts")
public class AccountsController {

    @Autowired
    UserData userData;

    @Autowired
    RoleData roleData;

    @RequestMapping(value = "/new-role", method = RequestMethod.GET)
    public String newRole() {
        return "/admin/accounts/new-role";
    }

    @RequestMapping(value = "/edit-role/{roleId}", method = RequestMethod.GET)
    public String editRole(ModelMap modelMap,@PathVariable Integer roleId) {
        modelMap.addAttribute("roleId",roleId);
        return "/admin/accounts/edit-role";
    }

    @RequestMapping(value = "/new-account", method = RequestMethod.GET)
    public String newAccount() {
        return "/admin/accounts/new-account";
    }

    @RequestMapping(value = "/edit-account/{userId}", method = RequestMethod.GET)
    public String editAccount(ModelMap modelMap,@PathVariable Integer userId){
    modelMap.addAttribute("userId",userId);
        return "/admin/accounts/edit-account";
    }


}
