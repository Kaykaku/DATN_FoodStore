package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.RolePermission;


@Service
public interface RolePermissionService extends IService<RolePermission> {
	Page<RolePermission> getByPermissionId(Pageable pageable,Long id);
	
	Page<RolePermission> getByRoleId(Pageable pageable,Long id);
	
	Page<RolePermission> getByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	RolePermission getByRoleIdAndPermissionId(Long roleId ,Long permissionId);
}
