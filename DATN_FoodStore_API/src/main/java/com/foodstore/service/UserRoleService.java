package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.UserRole;


@Service
public interface UserRoleService extends IService<UserRole> {
	Page<UserRole> getByUserId(Long id,Pageable pageable);
	
	Page<UserRole> getByRoleId(Long id,Pageable pageable);
	
	
	List<UserRole> getByUserId(Long id);
	
	List<UserRole> getByRoleId(Long id);
	
	//Page<UserRole> getByDisplayStatus(boolean isDisplay,Pageable pageable);	
	
	UserRole getByUserIdAndRoleId(Long userId ,Long roleId);
}
