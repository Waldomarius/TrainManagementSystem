package com.trainmanagement.repositories;


import com.trainmanagement.pojo.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer>{

    User findOneByLogin(String login);

}
