package com.trainmanagement.config.security;


import com.trainmanagement.pojo.User;
import com.trainmanagement.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.HashSet;
import java.util.Set;

public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(final String login) {

        User user = userRepository.findOneByLogin(login);
        Set<GrantedAuthority> role = new HashSet<>();

        UserDetails userDetails =
                new org.springframework.security.core.userdetails.User(
                        user.getLogin(),
                        user.getPassword(),
                        role
                );
        return userDetails;
    }
}
