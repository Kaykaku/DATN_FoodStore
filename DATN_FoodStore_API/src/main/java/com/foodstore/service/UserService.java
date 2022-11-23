package com.foodstore.service;

import java.util.List;
import java.util.Optional;

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

	String[] getAllPermission(String username);
	
	Page<User> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date,Optional<Long> create_date ,Optional<Long> create_by,Optional<Boolean> is_display ,Optional<Integer> status,Optional<Long> role_id  , Pageable pageable);
	
	List<User> getByFilter(String keyword , Optional<Boolean> gender , Optional<Long> birth_date,Optional<Long> create_date ,Optional<Long> create_by,Optional<Boolean> is_display ,Optional<Integer> status,Optional<Long> role_id  );
	
	List<User> getByKeyword(String keyword);
	
}
