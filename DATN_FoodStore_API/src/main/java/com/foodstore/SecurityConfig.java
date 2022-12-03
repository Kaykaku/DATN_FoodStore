package com.foodstore;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.service.UserService;


@SuppressWarnings("deprecation")
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired private UserService userService;
	@Autowired private CustomerService customerService;
	@Autowired private BCryptPasswordEncoder pe;
	
	
	
	//Cung cấp nguồn dữ liệu đăng nhập
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(username->{
			try {
				com.foodstore.model.entity.User user = userService.getByUsername(username);
				
				String password = pe.encode(user.getPassword());
				String[] roles = userService.getAllPermission(username);
				return User.withUsername(username).password(password).roles(roles).build();
			} catch (Exception e) {
				throw new UsernameNotFoundException(username + "not found!");
			}
		});
		auth.userDetailsService(username->{
			try {
				Customer customer = customerService.getByUsername(username);
				
				String password = pe.encode(customer.getPassword());
				String[] roles =  {"CUS"};
				return User.withUsername(username).password(password).roles(roles).build();
			} catch (Exception e) {
				throw new UsernameNotFoundException(username + "not found!");
			}
		});
	}
	
	//Phân quyền sử dụng
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.authorizeRequests()
			.antMatchers("/user/**").hasRole("CUS")
			.antMatchers("/cart/checkout").hasRole("CUS")
			.antMatchers("/admin/**").not().hasRole("CUS")
			.antMatchers("/rest/category/filter").hasRole("CAT01")
			.antMatchers("/rest/category/update/**").hasRole("CAT02")
			.antMatchers("/rest/category/create/**").hasRole("CAT03")
			.antMatchers("/rest/category/delete/**").hasRole("CAT04")
			.anyRequest().permitAll();
		
		http.formLogin()
			.loginPage("/security/login/form")
			.loginProcessingUrl("/security/login")
			.defaultSuccessUrl("/security/login/success",false)
			.failureForwardUrl("/security/login/error")
			.usernameParameter("username") // [username]
			.passwordParameter("password"); // [password];
		
		http.rememberMe()
			.rememberMeParameter("remember")
			.tokenValiditySeconds(86400);
		
		http.exceptionHandling()
			.accessDeniedPage("/security/unauthorized");
		
		http
	  		.logout()
	  		.logoutUrl("/security/logoff")
	  		.invalidateHttpSession(true)
	  		.logoutSuccessUrl("/index");
		
		http.oauth2Login()
			.defaultSuccessUrl("/security/login2/success",true)
			.failureUrl("/security/login/error")
			.authorizationEndpoint()
			.baseUri("/security/login/oauth2");
	}
	
	//Cơ chế mã hoá mật khẩu
	@Bean
	public BCryptPasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	//Cho phép truy xuất REST API từ bên ngoài (domain khác)
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers(HttpMethod.OPTIONS,"/**");
	}
}
