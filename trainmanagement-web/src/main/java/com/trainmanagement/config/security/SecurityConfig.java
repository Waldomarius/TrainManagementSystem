package com.trainmanagement.config.security;

import com.trainmanagement.config.WebConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
@Import(WebConfig.class)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Autowired
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("SELECT login as USERNAME, PASSWORD, ENABLED FROM USERS WHERE login=?")
                .authoritiesByUsernameQuery("SELECT users.login, roles.role FROM users INNER JOIN roles ON users.role_id=roles.id WHERE login=?")//;
                .rolePrefix("ROLE_");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/api/**").permitAll()
                .antMatchers("/admin/**").hasRole("admin")
                .anyRequest().authenticated() //all requests will checked
                .and()
                    .formLogin()
                        // указываем страницу с формой логина
                        .loginPage("/login").permitAll()
                        // Указываем параметры логина и пароля с формы логина
                        .usernameParameter("j_spring_security_username")
                        .passwordParameter("j_spring_security_password")
                        // указываем action с формы логина
                        .loginProcessingUrl("/j_spring_security_check")
                        // указываем URL при неудачном логине
                        .failureUrl("/login?error")
                .and()
                    .logout().logoutUrl("/logout").logoutSuccessUrl("/login")
                .and()
                .exceptionHandling().accessDeniedPage("/access")
                .and()
                // включаем защиту от CSRF атак
                .csrf().disable();
    }
}
