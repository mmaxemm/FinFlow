package com.finflow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.finflow"})
public class FinFlowApp {
    public static void main(String[] args) {
        SpringApplication.run(FinFlowApp.class, args);
    }
}