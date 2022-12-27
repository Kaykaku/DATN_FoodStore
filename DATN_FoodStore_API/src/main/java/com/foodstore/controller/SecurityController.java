package com.foodstore.controller;

import java.util.UUID;

import javax.mail.MessagingException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.constraints.Gender;
import com.foodstore.util.constraints.MailConstraints;
import com.foodstore.util.convert.EmailService;
import com.foodstore.util.convert.RemoteCurrentUser;

@Controller
@RequestMapping("security")
public class SecurityController {
	@Autowired
	UserService userService;
	@Autowired
	CustomerService customerService;
	@Autowired
	EmailService emailService;
	@Autowired
	RemoteCurrentUser remoteCurrentUser;

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
	public String signupProcess(@ModelAttribute Customer customer,Model model) throws MessagingException{
		if(customerService.isExist(customer) || userService.isExist(customer)) {
			model.addAttribute("message", "Your name or email address is registered . Please choose another one !");
			model.addAttribute("title", "Login");
			return "security/signup";
		}else {
			customer.setGender(Gender.MALE);
			customer.set_display(Display.SHOW);
			customer.setCode(UUID.randomUUID().toString());
			customer = customerService.create(customer);
			emailService.send(MailConstraints.EmailRegister(customer), MailConstraints.EmailRegisterSubject(customer),customer.getEmail());
			model.addAttribute("message", "Sign Up Success . Please vetify your email");
			model.addAttribute("title", "Login");
			return "security/login";
		}
	}
	
	@GetMapping("/verify-email/{code}")
	public String verify(@PathVariable("code")String code,Model model) {
		Customer customer = customerService.getAll().stream().filter(c ->c.getCode()!=null && c.getCode().equals(code)).findFirst().orElse(null);
		if(customer==null) return "redirect:/security/unauthorized";
		customer.setCode(null);
		customer.setStatus(1);
		customerService.update(customer);
		model.addAttribute("message", "Vetify email successfully!!!");
		model.addAttribute("title", "INFOMATION");
		return "security/success";
	}
	
	@GetMapping("/change/{code}")
	public String change(@PathVariable("code")String code,Model model) {
		Customer customer = customerService.getAll().stream().filter(c ->c.getRemember_token()!=null && c.getRemember_token().equals(code)).findFirst().orElse(null);
		com.foodstore.model.entity.User user = userService.getAll().stream().filter(c ->c.getRemember_token()!=null && c.getRemember_token().equals(code)).findFirst().orElse(null);
		if(customer!=null) {
			model.addAttribute("username", customer.getUsername());
			return "security/changepass";
		}
		if(user!=null) {
			model.addAttribute("username", user.getUsername());
			return "security/changepass";
		}
		
		return "redirect:/security/unauthorized";
	}
	
	@PostMapping("/change/{code}")
	public String changePost(@PathVariable("code")String code,Model model , @ModelAttribute("password")String password) {
		Customer customer = customerService.getAll().stream().filter(c ->c.getRemember_token()!=null && c.getRemember_token().equals(code)).findFirst().orElse(null);
		com.foodstore.model.entity.User user = userService.getAll().stream().filter(c ->c.getRemember_token()!=null && c.getRemember_token().equals(code)).findFirst().orElse(null);
		if(customer!=null) {
			customer.setRemember_token(null);
			customer.setPassword(password);
			customerService.update(customer);
			model.addAttribute("message", "Change password successfully!!!");
			model.addAttribute("title", "INFOMATION");
			return "security/success";
		}
		if(user!=null) {
			user.setRemember_token(null);
			user.setPassword(password);
			userService.update(user);
			model.addAttribute("message", "Change password successfully!!!");
			model.addAttribute("title", "INFOMATION");
			return "security/success";
		}
		
		return "redirect:/security/unauthorized";
	}

	@GetMapping({ "/forgot" })
	public String forgot(@ModelAttribute Customer customer,Model model) {
		return "security/forgot";
	}
	
	@PostMapping({ "/forgot" })
	public String forgotPost(@ModelAttribute Customer customer,Model model) throws MessagingException {
		Customer c = customerService.getByUsername(customer.getUsername());
		if(c == null ) c = customerService.getByEmail(customer.getUsername());
		if(c!=null) {
			c.setRemember_token(UUID.randomUUID().toString());
			customerService.update(c);
			emailService.send(MailConstraints.EmailForgot(c.getRemember_token(),c.getUsername(),c.getId()), MailConstraints.EmailForgotSubject(c.getUsername()),c.getEmail());
			model.addAttribute("message", "Please visit your email to create a new password!!!");
			model.addAttribute("title", "INFORMATION");
			return "security/login";
		}
		
		com.foodstore.model.entity.User u = userService.getByUsername(customer.getUsername());
		if(u == null ) u = userService.getByEmail(customer.getUsername());
		if(u!=null) {
			u.setRemember_token(UUID.randomUUID().toString());
			userService.update(u);
			emailService.send(MailConstraints.EmailForgot(u.getRemember_token(),u.getUsername(),u.getId()), MailConstraints.EmailForgotSubject(u.getUsername()),u.getEmail());
			model.addAttribute("message", "Please visit your email to create a new password!!!");
			model.addAttribute("title", "INFORMATION");
			return "security/login";
		}
		model.addAttribute("message", "Your username or email address does not exist on the system!");
		return "security/forgot";
	}
	
	@GetMapping({ "login/formz" })
	public String login2(Model model) {
		model.addAttribute("message", "Please login to continue");
		model.addAttribute("title", "Login");
		return "security/login";
	}

	@GetMapping("login/success")
	public String loginSuccess(Model model,HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("message", "Logged in successfully!");
		model.addAttribute("title", "Login Success");
		 if(remoteCurrentUser.getCurrentCustomer().getStatus()!=1 &&
			 remoteCurrentUser.getCurrentUser().getStatus()!=1) {
			 model.addAttribute("message", "Please vetify your email");
			 model.addAttribute("title", "Login");
			 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			if (authentication != null) {
				new SecurityContextLogoutHandler().logout(request, response, authentication);
			}
			 return "security/login";
		 }
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
				  customer.setStatus(1L);
				  account = customerService.create(customer);
			  }
			  username = ((Customer)account).getUsername();
			  roles = new String[]{"CUS"};

		  }else {
			  username = ((com.foodstore.model.entity.User)account).getUsername();
			  roles = userService.getAllPermission(((com.foodstore.model.entity.User) account).getUsername());
		  }

		  UserDetails user =
		  User.withUsername(username).password(password).roles(roles).build();
		  Authentication authentication = new  UsernamePasswordAuthenticationToken(user,null, user.getAuthorities());
		  SecurityContextHolder.getContext().setAuthentication(authentication);
		  return "forward:/security/login/success"; }
}
