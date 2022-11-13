package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.UserPermission;


@Service
public interface UserPermissionService extends IService<UserPermission> {
	Page<UserPermission> getByUserId(Pageable pageable,Long id);
	
	Page<UserPermission> getByPermissionId(Pageable pageable,Long id);
	
	Page<UserPermission> getByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	UserPermission getByUserIdAndPermissionId(Long userId ,Long permissionId);
}
