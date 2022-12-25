package com.foodstore.controller.rest;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.User;
import com.foodstore.model.transaction.UserPermission;
import com.foodstore.model.transaction.UserRole;
import com.foodstore.service.UserPermissionService;
import com.foodstore.service.UserRoleService;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.TableName;
import com.foodstore.util.convert.RemoteCurrentUser;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/user")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserRoleService userRoleService;
	@Autowired
	private UserPermissionService userPermissionService;
	@Autowired
	private RemoteCurrentUser remoteCurrentUser;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size) {
		try {
			Page<User> pageCategories = userService.getAll(PageRequest.of(page.orElse(0), size.orElse(10)));
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "gender") Optional<Boolean> gender,
			@RequestParam(value = "birthday") Optional<Long> birthday,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "status") Optional<Integer> status,
			@RequestParam(value = "role_id") Optional<Long> role_id,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			
			Page<User> userPage = userService.getByFilter(
					keyword.orElse("")
					,gender
					,birthday
					,create_date
					,create_by
					,is_display
					,status
					,role_id
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(userPage);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@PostMapping("/create")
	public User create(@RequestBody User user) {
		user.setCreate_date(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User currentUser = userService.getByUsername(((UserDetails)principal).getUsername());
		user.setCreate_by(currentUser.getId());
		User u =userService.create(user);
		remoteCurrentUser.createHistory(" create a new record '"+ u.getUsername()+"' with ID", TableName.User , u.getId());
		return u;
	}
	
	@PutMapping("/update/{id}")
	public User update(@RequestBody User user,@PathVariable("id")Integer id) {
		User u =userService.update(user);
		remoteCurrentUser.createHistory(" update record '"+ u.getUsername()+"' with ID", TableName.User , u.getId());
		return u;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		User u =userService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ u.getUsername()+"' with ID", TableName.User , u.getId());
		userService.delete(id);
	}
	@GetMapping("/role/all")
	public List<UserRole> getRoleByAllUser(){	
		return userRoleService.getAll();
	}
	
	@GetMapping("/role/{id}")
	public List<UserRole> getRoleByUser(@PathVariable("id")Long id){	
		return userRoleService.getByUserId(id);
	}
	
	@GetMapping("/permission/{id}")
	public List<UserPermission> getPermissionByUser(@PathVariable("id")Long id){	
		return userPermissionService.getByUserId(id);
	}
	
	@PostMapping("/permission/create")
	public UserPermission addPermission(@RequestBody UserPermission userPermission) {
		UserPermission u =userPermissionService.create(userPermission);
		remoteCurrentUser.createHistory(" create a new record '"+ u.getPermission_u().getName()+"' of '"+u.getUser_p().getUsername()+"' with ID", TableName.UserPermission , u.getId());
		return u;
	}
	
	@DeleteMapping("/permission/delete/{id}")
	public void deletePermission(@PathVariable("id")Long id) {
		UserPermission u =userPermissionService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ u.getPermission_u().getName()+"' of '"+u.getUser_p().getUsername()+"' with ID", TableName.UserPermission , u.getId());
		userPermissionService.delete(id);
	}
	
	@PostMapping("/role/create")
	public UserRole addRole(@RequestBody UserRole userRole) {
		UserRole u =userRoleService.create(userRole);
		remoteCurrentUser.createHistory(" create a new record '"+ u.getRole_u().getName()+"' of '"+u.getUser_r().getUsername()+"' with ID", TableName.UserRole , u.getId());
		return u;
	}
	
	@DeleteMapping("/role/delete/{id}")
	public void deleteRole(@PathVariable("id")Long id) {
		UserRole u =userRoleService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ u.getRole_u().getName()+"' of '"+u.getUser_r().getUsername()+"' with ID", TableName.UserRole , u.getId());
		userRoleService.delete(id);
	}
	

	
}
