package com.trainmanagement.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;

@Configuration
@Import(DaoConfig.class)
@PropertySource("classpath:app.properties")
@ComponentScan("com.trainmanagement.data")
public class ServiceConfig {
}
