package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.UserRole;


@Service
public interface UserRoleService extends IService<UserRole> {
	Page<UserRole> getByUserId(Pageable pageable,Long id);
	
	Page<UserRole> getByRoleId(Pageable pageable,Long id);
	
	Page<UserRole> getByDisplayStatus(Pageable pageable,boolean isDisplay);	
	
	UserRole getByUserIdAndRoleId(Long userId ,Long roleId);
}
