package com.trainmanagement.pojo;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "login", nullable = false)
    private String login;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "enabled", columnDefinition ="1")
    private String enabled;

    @ManyToOne ( fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id")
    private Role role;

    public User(String name, String password, String login, Role role) {
        this.name = name;
        this.password = password;
        this.login = login;
        this.role = role;
    }

}
