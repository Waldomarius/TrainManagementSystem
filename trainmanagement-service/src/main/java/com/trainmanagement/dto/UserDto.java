package com.trainmanagement.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class UserDto {

    private int id;
    private String name;
    private String login;
    private String password;
    private String enabled;
    private String role;

}
