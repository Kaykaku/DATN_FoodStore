package com.foodstore.api;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.HashPassword;

import lombok.extern.slf4j.Slf4j;

@RestController("customer")
@RequestMapping("/api/customer")
@Slf4j
public class CustomerApi {

	@Autowired
	private CustomerService customerService;

	@PostMapping("/login")
	public ResponseEntity<?> doLogin() {
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@PostMapping("/signup")
	public ResponseEntity<?> doRegister(@Valid @RequestBody Customer customerReq) {
		try {
			Customer customerResp = new Customer();

			customerResp.setPassword(HashPassword.ENCODER.encode(customerReq.getPassword()));
			customerResp.set_display(Display.SHOW);

			customerService.create(customerResp);

			if (ObjectUtils.isNotEmpty(customerResp)) {
				log.info("Dang ky thanh cong!");
				return new ResponseEntity<>(customerResp, HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Them that bai! " + ex.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

}
