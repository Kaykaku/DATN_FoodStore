package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.UserPermission;


@Service
public interface UserPermissionService extends IService<UserPermission> {
	Page<UserPermission> getByUserId(Long id,Pageable pageable);
	
	List<UserPermission> getByUserId(Long id);
	
	Page<UserPermission> getByPermissionId(Long id,Pageable pageable);
	
	//Page<UserPermission> getByDisplayStatus(boolean isDisplay,Pageable pageable);
	
	UserPermission getByUserIdAndPermissionId(Long userId ,Long permissionId);
	
}
