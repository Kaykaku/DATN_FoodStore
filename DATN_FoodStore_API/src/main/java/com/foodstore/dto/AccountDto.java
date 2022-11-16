package com.foodstore.dto;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class AccountDto implements Serializable {

	private static final long serialVersionUID = 3005370097494510397L;

	private Long id;
	private String username;
	private String password;
	private String fullname;
	private boolean gender;
	private String avatar;
	private String email;
	private String phone;
	private Date birthday;
	private String remember_token;
	private String code;
	private long status;
	private String address;
	private boolean is_display;
	private Long create_by;
	private Date create_date;
}
