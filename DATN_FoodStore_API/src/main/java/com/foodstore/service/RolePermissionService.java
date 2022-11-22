package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.RolePermission;


@Service
public interface RolePermissionService extends IService<RolePermission> {
	Page<RolePermission> getByPermissionId(Long id,Pageable pageable);
	
	Page<RolePermission> getByRoleId(Long id,Pageable pageable);
	
	//Page<RolePermission> getByDisplayStatus(boolean isDisplay,Pageable pageable);
	
	RolePermission getByRoleIdAndPermissionId(Long roleId ,Long permissionId);
}
