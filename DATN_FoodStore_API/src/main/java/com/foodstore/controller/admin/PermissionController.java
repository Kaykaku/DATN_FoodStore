package com.foodstore.controller.admin;

import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodstore.model.entity.Permission;
import com.foodstore.service.PermissionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/permission")
@Slf4j
public class PermissionController {

	@Autowired
	private PermissionService permissionService;

	@GetMapping("")
	public ResponseEntity<?> doGetAll() {
		List<Permission> permissions = permissionService.getByIsDisplay();
		if (permissions.size() == 0 || permissions.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(permissions);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		Permission permissionResp = permissionService.getById(id);
		if (ObjectUtils.isEmpty(permissionResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(permissionResp);
	}

	@PostMapping("/add")
	public ResponseEntity<?> doCreate(@Valid @RequestBody Permission permissionReq) {
		try {
			if (permissionService.getByNameAndDisplayName(permissionReq.getName(),
					permissionReq.getDisplay_name()) != null) {
				log.error("Name hoặc Display Name đã tồn tại!");
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			} else {
				log.info("Create Successfully!");
				return new ResponseEntity<>(permissionService.create(permissionReq), HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! --->" + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody Permission permissionReq, @PathVariable("id") Long id) {
		Permission currentPermission = permissionService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentPermission)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(permissionService.update(permissionReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		try {
			permissionService.deleteLogical(id);
			log.info("Detele " + id + " Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception ex) {
			log.error("Delete Failed ---> " + ex.getMessage());
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
