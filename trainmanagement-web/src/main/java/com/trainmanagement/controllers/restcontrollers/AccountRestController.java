package com.trainmanagement.controllers.restcontrollers;

import com.trainmanagement.data.RoleData;
import com.trainmanagement.data.UserData;
import com.trainmanagement.dto.RoleDto;
import com.trainmanagement.dto.UserDto;
import com.trainmanagement.pojo.Role;
import com.trainmanagement.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/api")
public class AccountRestController {

    @Autowired
    UserData userData;

    @Autowired
    RoleData roleData;

    @RequestMapping(value = "/allUsers", method = RequestMethod.GET)
    public List<UserDto> getUsers() {return userData.getUserDTO();}

	@RequestMapping(value = "/allRoles", method=RequestMethod.GET)
	public List<RoleDto> allRole(){
		return roleData.getRoleDTO();
	}

    @RequestMapping(value = "/saveRole", method = RequestMethod.POST)
    public void saveRole(@RequestBody Role role) {
        roleData.save(role);
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public void saveAccount(@RequestBody User user) {
        userData.save(user);
    }

    @RequestMapping(value = "/deleteRole/{id}", method = RequestMethod.DELETE)
    public void deleteRole(@PathVariable("id") Integer id) { roleData.deleteRole(id); }

    @RequestMapping(value = "/deleteUser/{id}", method = RequestMethod.DELETE)
    public void deleteUser(@PathVariable("id") Integer id) {
        userData.deleteUser(id);
    }

}
