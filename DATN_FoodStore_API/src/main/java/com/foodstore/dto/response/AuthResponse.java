package com.foodstore.dto.response;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthResponse implements Serializable {

	private static final long serialVersionUID = -9083906128408295211L;

	private final String jwt;

}
