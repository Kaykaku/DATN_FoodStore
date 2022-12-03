package com.foodstore.util.convert;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.foodstore.model.entity.Customer;
import com.foodstore.model.extend.Notification;
import com.foodstore.service.CategoryService;
import com.foodstore.service.CustomerService;
import com.foodstore.service.NotificationService;
import com.foodstore.service.UserService;

@Component
public class GlobalInterceptor implements HandlerInterceptor{
	@Autowired 
	private CategoryService cateService;
	@Autowired
	private UserService userService;
	@Autowired
	CustomerService customerService;
	@Autowired
	NotificationService notificationService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("cates", cateService.getAll());
		String username = request.getRemoteUser();
		if(username==null) return;
		request.setAttribute("news",new ArrayList<>());
		
		//String username = ((UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUsername(); 
		String password=Long.toHexString(System.currentTimeMillis()); 
		Object account ;
		String[] roles = null;
		account= userService.getByUsername(username);
		if(account == null) {
			account = customerService.getByUsername(username);
			username = ((Customer)account).getUsername();
			roles = new String[]{"CUS"};
			
			List<Notification> list = notificationService.getByCustomerId(((Customer)account).getId()).stream().filter(n -> !n.is_watched()).toList();
			request.setAttribute("news",list);
		}else {
			username = ((com.foodstore.model.entity.User)account).getUsername();
			roles = userService.getAllPermission(((com.foodstore.model.entity.User) account).getUsername());
		}
	  

		UserDetails user = User.withUsername(username).password(password).roles(roles).build();
		Authentication authentication = new  UsernamePasswordAuthenticationToken(user,null, user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
	}
}
