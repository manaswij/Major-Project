package com.postgres;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = "com.postgres.model")

public class SimpleformApplication {

	public static void main(String[] args) {
		SpringApplication.run(SimpleformApplication.class, args);
	}

}
