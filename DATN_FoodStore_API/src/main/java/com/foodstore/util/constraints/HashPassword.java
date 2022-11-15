package com.foodstore.util.constraints;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class HashPassword {
	public static final BCryptPasswordEncoder ENCODER = new BCryptPasswordEncoder();
	
	private HashPassword() {}
}
