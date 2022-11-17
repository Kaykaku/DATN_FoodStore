//package com.foodstore.api;
//
//import javax.validation.Valid;
//
//import org.apache.commons.lang3.ObjectUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.BadCredentialsException;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.foodstore.custom.UserDetailServiceCustom;
//import com.foodstore.dto.request.AuthRequest;
//import com.foodstore.dto.response.AuthResponse;
//import com.foodstore.model.entity.Customer;
//import com.foodstore.service.CustomerService;
//import com.foodstore.util.constraints.Display;
//import com.foodstore.util.constraints.HashPassword;
//import com.foodstore.util.tokens.JwtUtil;
//
//import lombok.extern.slf4j.Slf4j;
//
//@RestController
//@Slf4j
//public class AccountApi {
//
//	@Autowired
//	private CustomerService customerService;
//
//	@Autowired
//	private AuthenticationManager authenticationManager;
//
//	@Autowired
//	private UserDetailServiceCustom userDetailService;
//
//	@Autowired
//	private JwtUtil jwtUtil;
//	
//	@GetMapping("/index")
//	public String index() {
//		return "Hello";
//	}
//
//	@PostMapping("/login")
//	public ResponseEntity<?> doLogin(@RequestBody AuthRequest authRequest) throws Exception {
//		try {
//			authenticationManager.authenticate(
//					new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword()));
//		} catch (BadCredentialsException e) {
//			throw new Exception("Tên người dùng hoặc mật khẩu không đúng", e);
//		}
//
//		final UserDetails userDetails = userDetailService.loadUserByUsername(authRequest.getUsername());
//		final String jwt = jwtUtil.generateToken(userDetails);
//
//		return ResponseEntity.ok(new AuthResponse(jwt));
//	}
//
//	@PostMapping("/signup")
//	public ResponseEntity<?> doRegister(@Valid @RequestBody Customer customerReq) {
//		try {
//			Customer customerResp = new Customer();
//
//			customerResp.setPassword(HashPassword.ENCODER.encode(customerReq.getPassword()));
//			customerResp.set_display(Display.SHOW);
//
//			customerService.create(customerResp);
//
//			if (ObjectUtils.isNotEmpty(customerResp)) {
//				log.info("Dang ky thanh cong!");
//				return new ResponseEntity<>(customerResp, HttpStatus.CREATED);
//			}
//		} catch (Exception ex) {
//			log.error("Them that bai! " + ex.getMessage());
//		}
//		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//	}
//
//}
