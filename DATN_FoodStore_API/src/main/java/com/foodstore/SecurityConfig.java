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
			
			.antMatchers("/rest/customer/filter").hasRole("CUS01")
			.antMatchers("/rest/customer/update/**").hasRole("CUS02")
			.antMatchers("/rest/customer/create/**").hasRole("CUS03")
			.antMatchers("/rest/customer/delete/**").hasRole("CUS04")
			
			.antMatchers("/rest/customer/contact/filter").hasRole("PHO01")
			.antMatchers("/rest/customer/contact/update/**").hasRole("PHO02")
			.antMatchers("/rest/customer/contact/create/**").hasRole("PHO03")
			.antMatchers("/rest/customer/contact/delete/**").hasRole("PHO04")
			
			.antMatchers("/rest/discount/filter").hasRole("DIS01")
			.antMatchers("/rest/discount/update/**").hasRole("DIS02")
			.antMatchers("/rest/discount/create/**").hasRole("DIS03")
			.antMatchers("/rest/discount/delete/**").hasRole("DIS04")
			
			.antMatchers("/rest/food/filter").hasRole("FOO01")
			.antMatchers("/rest/food/update/**").hasRole("FOO02")
			.antMatchers("/rest/food/create/**").hasRole("FOO03")
			.antMatchers("/rest/food/delete/**").hasRole("FOO04")
			
			.antMatchers("/rest/food/image/filter").hasRole("IMA01")
			.antMatchers("/rest/food/image/update/**").hasRole("IMA02")
			.antMatchers("/rest/food/image/create/**").hasRole("IMA03")
			.antMatchers("/rest/food/image/delete/**").hasRole("IMA04")
			
			.antMatchers("/rest/history/filter").hasRole("HIS01")
			.antMatchers("/rest/history/update/**").hasRole("HIS02")
			.antMatchers("/rest/history/create/**").hasRole("HIS03")
			.antMatchers("/rest/history/delete/**").hasRole("HIS04")
			
			.antMatchers("/rest/order/filter").hasRole("ORD01")
			.antMatchers("/rest/order/update/**").hasRole("ORD02")
			.antMatchers("/rest/order/create/**").hasRole("ORD03")
			.antMatchers("/rest/order/delete/**").hasRole("ORD04")
			
			.antMatchers("/rest/role/filter").hasRole("ROL01")
			.antMatchers("/rest/role/update/**").hasRole("ROL02")
			.antMatchers("/rest/role/create/**").hasRole("ROL03")
			.antMatchers("/rest/role/delete/**").hasRole("ROL04")
			
			.antMatchers("/rest/role/permission/filter").hasRole("ROL01")
			.antMatchers("/rest/role/permission/update/**").hasRole("ROL02")
			.antMatchers("/rest/role/permission/create/**").hasRole("ROL03")
			.antMatchers("/rest/role/permission/delete/**").hasRole("ROL04")
			
			.antMatchers("/rest/user/filter").hasRole("USE01")
			.antMatchers("/rest/user/update/**").hasRole("USE02")
			.antMatchers("/rest/user/create/**").hasRole("USE03")
			.antMatchers("/rest/user/delete/**").hasRole("USE04")
			
			.antMatchers("/rest/user/role/filter","/rest/user/permission/filter").hasRole("ROL01")
			.antMatchers("/rest/user/role/update/**","/rest/user/permission/update/**").hasRole("ROL02")
			.antMatchers("/rest/user/role/create/**","/rest/user/permission/create/**").hasRole("ROL03")
			.antMatchers("/rest/user/role/delete/**","/rest/user/permission/delete/**").hasRole("ROL04")

			.antMatchers("/rest/summary/**").hasRole("SUM01")
			
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
