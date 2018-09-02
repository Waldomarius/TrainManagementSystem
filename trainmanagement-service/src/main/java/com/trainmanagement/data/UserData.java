package com.trainmanagement.data;

import com.trainmanagement.dto.UserDto;
import com.trainmanagement.pojo.User;

import java.util.List;

public interface UserData {

    List<User> getAll();

    List<UserDto> getUserDTO();

    User save(User user);

    void deleteUser(Integer id);

}
