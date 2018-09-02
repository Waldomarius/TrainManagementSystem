package com.trainmanagement.data;


import com.trainmanagement.dto.UserDto;
import com.trainmanagement.pojo.User;
import com.trainmanagement.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class UserDataImp implements UserData {

    @Autowired
    UserRepository userRepository;

    @Override
    public List<User> getAll() {
        return userRepository.findAll();
    }


    @Override
    public User save(User user) {
        return userRepository.saveAndFlush(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userRepository.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<UserDto> getUserDTO() {

        List<UserDto> userDTOs = new ArrayList<>();

        for (User user : getAll()) {
            userDTOs.add(constructUserDTO(user));
        }
        return userDTOs;
    }

    private UserDto constructUserDTO(User user) {

        UserDto userDTO = new UserDto();

        userDTO.setId(user.getId());
        userDTO.setName(user.getName());
        userDTO.setLogin(user.getLogin());
        userDTO.setPassword(user.getPassword());
        userDTO.setEnabled(user.getEnabled());
        userDTO.setRole(user.getRole().getRole());

        return userDTO;
    }

}
