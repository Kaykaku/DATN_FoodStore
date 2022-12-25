package com.foodstore.controller.rest;

import java.util.Date;
import java.util.Optional;
import java.util.List;

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

import com.foodstore.model.entity.Role;
import com.foodstore.model.entity.User;
import com.foodstore.model.transaction.RolePermission;
import com.foodstore.service.RolePermissionService;
import com.foodstore.service.RoleService;
import com.foodstore.service.UserService;
import com.foodstore.util.constraints.TableName;
import com.foodstore.util.convert.RemoteCurrentUser;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/role")
public class RoleRestController {
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private RolePermissionService rolePermissionService;
	@Autowired
	private UserService userService;
	@Autowired
	private RemoteCurrentUser remoteCurrentUser;
	
	@GetMapping("")
	public ResponseEntity<?> doGetAll() {
		try {
			List<Role> pageCategories = roleService.getAll();
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping("/all")
	public ResponseEntity<?> getNoNeedPermission() {
		return doGetAll();
	}
	
	@GetMapping("/filter")
	public ResponseEntity<?> doGetByFilter(
			@RequestParam(value = "keyword") Optional<String> keyword,
			@RequestParam(value = "create_date") Optional<Long> create_date,
			@RequestParam(value = "create_by") Optional<Long> create_by,
			@RequestParam(value = "is_display") Optional<Boolean> is_display,
			@RequestParam(value = "page") Optional<Integer> page,
			@RequestParam(value = "size") Optional<Integer> size,
			@RequestParam(value = "sort") Optional<String> sort) {
		try {
			
			Page<Role> pageCategories = roleService.getByFilter(
					keyword.orElse("")
					,create_date
					,create_by
					,is_display
					,PageRequest.of(page.orElse(0), size.orElse(10),Sort.by(sort.orElse("id")).descending()));
			return ResponseEntity.ok(pageCategories);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	
	@GetMapping("/{id}")
	public Role getById(@PathVariable("id")Long id){	
		return roleService.getById(id);
	}
	
	@GetMapping("/permission/{id}")
	public List<RolePermission> getPermissionsByRole(@PathVariable("id")Long id){	
		return rolePermissionService.getByRoleId(id);
	}
	
	@PostMapping("/permission/create")
	public RolePermission addPermission(@RequestBody RolePermission rolePermission) {
		RolePermission r = rolePermissionService.create(rolePermission);
		remoteCurrentUser.createHistory(" create a new record '"+ r.getPermission_r().getName()+"' of '"+r.getRole_p().getName()+"'  with ID", TableName.RolePermission , r.getId());
		return r;
	}
	
	@DeleteMapping("/permission/delete/{id}")
	public void deletePermission(@PathVariable("id")Long id) {
		RolePermission r = rolePermissionService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ r.getPermission_r().getName()+"' of '"+r.getRole_p().getName()+"'  with ID", TableName.RolePermission , r.getId());
		rolePermissionService.delete(id);
	}
	
	@PostMapping("/create")
	public Role create(@RequestBody Role role) {
		role.setCreate_date(new Date());
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user = userService.getByUsername(((UserDetails)principal).getUsername());
		role.setCreate_by(user.getId());
		Role r = roleService.create(role);
		remoteCurrentUser.createHistory(" create a new record '"+ r.getDisplay_name()+"' with ID", TableName.Role , r.getId());
		return r;
	}
	
	@PutMapping("/update/{id}")
	public Role update(@RequestBody Role role,@PathVariable("id")Integer id) {
		Role r = roleService.update(role);
		remoteCurrentUser.createHistory(" update record '"+ r.getDisplay_name()+"' with ID", TableName.Role , r.getId());
		return r;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id")Long id) {
		Role r = roleService.getById(id);
		remoteCurrentUser.createHistory(" delete record '"+ r.getDisplay_name()+"' with ID", TableName.Role , r.getId());
		roleService.delete(id);
	}
	
}
