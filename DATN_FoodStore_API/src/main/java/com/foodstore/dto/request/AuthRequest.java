package com.foodstore.dto.request;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AuthRequest implements Serializable { 
	
	private static final long serialVersionUID = -4374131674583832468L;
	
	private String username;
	private String password;
}
