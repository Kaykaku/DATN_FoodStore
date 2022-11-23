package com.foodstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.service.UserService;

@Controller
@RequestMapping("security")
public class SecurityController {
	@Autowired
	UserService userService;
	@Autowired
	CustomerService customerService;

	@GetMapping({ "login/form" })
	public String login(Model model) {
		model.addAttribute("title", "Login");
		userService.getAllPermission("admin");
		//userService.getByUsername("admin");
		return "security/login";
	}

	@GetMapping({ "login/formz" })
	public String login2(Model model) {
		model.addAttribute("message", "Please login to continue");
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping("login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Logged in successfully!");
		model.addAttribute("title", "Login Success");
		return "security/login";
	}

	@GetMapping("login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Incorrect account information");
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping("unauthorized")
	public String unauthorized(Model model) {
		model.addAttribute("message", "Access is denied");
		model.addAttribute("title", "Access Denied");
		return "security/unauthorized";
	}

	@GetMapping("logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("title", "Login");
		model.addAttribute("message", "You are logged out!");
		return "security/login";
	}

	
	  @RequestMapping("login2/success") public String
	  loginOauth2(OAuth2AuthenticationToken oauth2) { 
		  String username; 
		  String email=oauth2.getPrincipal().getAttribute("email"); 	
		  String password=Long.toHexString(System.currentTimeMillis()); 
		  Object account ;
		  String[] roles = null;
		  account= userService.getByEmail(email);
		  if(account == null) {
			  account = customerService.getByEmail(email);
			  username = ((Customer)account).getUsername();
			  roles = new String[]{"CUS"};
		  }else {
			  username = ((com.foodstore.model.entity.User)account).getUsername();
			  roles = userService.getAllPermission(((com.foodstore.model.entity.User) account).getUsername());
		  }
		  
			/*
			 * if(account.getUsername()==null) { account.setEmail(email);
			 * account.setUsername(email); account.setFullname(name);
			 * account.setPassword(password); account.setPhoto("no_avatar.png");
			 * userService.create(account); authorityS.create(new Authority(null, account,
			 * new Role("CUST","Customers",null))); roles = new String[]{"CUST"}; }else {
			 * roles = account.getAuthorities().stream() .map(el->el.getRole().getId())
			 * .collect(Collectors.toList()).toArray(new String[0]); }
			 */
		  
		  System.out.println("Login : "+username);
		  for (String string : roles) {
			System.out.println(string);
		  }
		  UserDetails user =
		  User.withUsername(username).password(password).roles(roles).build();
		  Authentication authentication = new  UsernamePasswordAuthenticationToken(user,null, user.getAuthorities());
		  SecurityContextHolder.getContext().setAuthentication(authentication);
		  return "forward:/security/login/success"; }
}
