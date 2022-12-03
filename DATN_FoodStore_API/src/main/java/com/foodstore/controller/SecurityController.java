package com.foodstore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Gender;

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
		return "security/login";
	}
	
	@GetMapping({ "signup/form" })
	public String signup(Model model) {
		model.addAttribute("title", "Signup");
		model.addAttribute("customer", new Customer());
		return "security/signup";
	}
	
	@PostMapping({ "signup" })
	public String signupProcess(@ModelAttribute Customer customer,Model model) {
		if(customerService.isExist(customer) || userService.isExist(customer)) {
			model.addAttribute("message", "Your name or email address is registered . Please choose another one !");
			model.addAttribute("title", "Login");
			return "security/signup";
		}else {
			customer.setGender(Gender.MALE);
			customer.set_display(Display.SHOW);
			customerService.create(customer);
			UserDetails cus  =
					  User.withUsername(customer.getUsername()).password(customer.getPassword()).roles(new String[]{"CUS"}).build();
					  Authentication authentication = new  UsernamePasswordAuthenticationToken(cus,null, cus.getAuthorities());
					  SecurityContextHolder.getContext().setAuthentication(authentication);
		}

		return "redirect:/index";
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

	@RequestMapping("login/error")
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

	@GetMapping("/logoff")
	public String doGetLogout(HttpServletRequest request, HttpServletResponse response) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			new SecurityContextLogoutHandler().logout(request, response, authentication);
		}
		return "redirect:/index";
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
			  if(account == null) {
				  Customer customer = new Customer();
				  customer.setUsername(email);
				  customer.setEmail(email);
				  customer.setPassword(password);
				  customer.setGender(Gender.MALE);
				  customer.set_display(Display.SHOW);
				  account = customerService.create(customer);
			  }
			  username = ((Customer)account).getUsername();
			  roles = new String[]{"CUS"};

		  }else {
			  username = ((com.foodstore.model.entity.User)account).getUsername();
			  roles = userService.getAllPermission(((com.foodstore.model.entity.User) account).getUsername());
		  }

		  
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
