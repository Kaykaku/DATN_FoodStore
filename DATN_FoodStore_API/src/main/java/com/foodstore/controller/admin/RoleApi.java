package com.foodstore.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.foodstore.model.entity.Role;
import com.foodstore.service.RoleService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/roles")
@Slf4j
public class RoleApi {

	@Autowired
	private RoleService roleService;

	@GetMapping("")
	public ResponseEntity<?> doGetAll() {
		List<Role> roles = roleService.getByIsDisplay();
		if (roles.size() == 0 || roles.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(roles);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Role roleResp = roleService.getById(id);
		if (ObjectUtils.isEmpty(roleResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(roleResp);
	}

	@PostMapping("/add")
	public ResponseEntity<?> doCreate(@Valid @RequestBody Role roleReq) {
		try {
			if (roleService.getByNameAndDisplayName(roleReq.getName(), roleReq.getDisplay_name()) != null) {
				log.error("Name hoặc Display Name đã tồn tại!");
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			} else {
				log.info("Create Successfully!");
				return new ResponseEntity<>(roleService.create(roleReq), HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! --->" + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Role roleReq, @PathVariable("id") Long id) {
		Role currentRole = roleService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentRole)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(roleService.update(roleReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			roleService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
