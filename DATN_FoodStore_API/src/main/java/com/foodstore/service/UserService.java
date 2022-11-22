package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.User;

@Service
public interface UserService extends IService<User> {
	List<User> getByIsDisPlay();

	Page<User> getByIsDisplay(Pageable pageable) throws Exception;
	
	User getByUsername(String username);
	
	User getByEmail(String email);

	void deleteLogical(Long id) throws Exception;

	Page<User> getByKeyword(String keyword, Pageable pageable) throws Exception;
	
	String[] getAllPermission(String username);
}
