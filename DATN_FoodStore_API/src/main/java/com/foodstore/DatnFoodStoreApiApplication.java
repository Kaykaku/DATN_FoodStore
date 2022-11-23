package com.foodstore;

import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication
@EnableAutoConfiguration(exclude = { SecurityAutoConfiguration.class })
public class DatnFoodStoreApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(DatnFoodStoreApiApplication.class, args);
		
//		Runtime rt = Runtime.getRuntime(); try {
//		  rt.exec("cmd /c start chrome.exe http://localhost:8080/security/login/form");
//	  	} catch (IOException e) { e.printStackTrace(); }
		 
	}

}
