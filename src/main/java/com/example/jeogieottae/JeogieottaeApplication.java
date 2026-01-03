package com.example.jeogieottae;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@EnableJpaAuditing
@SpringBootApplication
public class JeogieottaeApplication {

    public static void main(String[] args) {

        System.out.println("성공하면말해ㄹ다오ㅎㄹ12231");
        SpringApplication.run(JeogieottaeApplication.class, args);
    }

}
