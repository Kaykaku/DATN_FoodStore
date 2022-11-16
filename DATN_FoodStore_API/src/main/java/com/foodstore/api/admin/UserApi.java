package com.foodstore.api.admin;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.foodstore.service.UserService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/api/users")
@Slf4j
public class UserApi {

	@Autowired
	private UserService userService;

	@GetMapping("")
	public ResponseEntity<?> doGetAllByPaginate(
			@RequestParam(value = "page", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "size", required = false) int pageSize) {
		List<User> users = new ArrayList<>();
		try {
			Page<User> pageUsers = userService.getByIsDisplay(PageRequest.of(pageNumber - 1, pageSize));
			users = pageUsers.getContent();
			if (users.size() > 0) {
				return ResponseEntity.ok(users);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}

	@GetMapping("/{id}")
	public ResponseEntity<?> doGetById(@PathVariable("id") Long id) {
		User userResp = userService.getById(id);
		if (ObjectUtils.isEmpty(userResp)) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return ResponseEntity.ok(userResp);
	}

	@PostMapping("/add")
	public ResponseEntity<?> doCreate(@Valid @RequestBody User userReq) {
		User userResp = userService.create(userReq);
		try {
			if (ObjectUtils.isNotEmpty(userResp)) {
				log.info("Create Successfully! ---> " + userResp.getUsername());
				return new ResponseEntity<>(userResp, HttpStatus.CREATED);
			}
		} catch (Exception ex) {
			log.error("Create Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@PutMapping("/update/{id}")
	public ResponseEntity<?> doUpdate(@RequestBody User userReq, @PathVariable("id") Long id) {
		User currentUser = userService.getById(id);
		try {
			if (ObjectUtils.isNotEmpty(currentUser)) {
				log.info("Update Successfully!");
				return new ResponseEntity<>(userService.update(userReq), HttpStatus.OK);
			}
		} catch (Exception ex) {
			log.error("Update Failed! ---> " + ex.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> doDelete(@PathVariable("id") Long id) {
		if (id != null) {
			userService.delete(id);
			log.info("Detele Successfully!");
			return new ResponseEntity<>(HttpStatus.OK);
		}

		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
}