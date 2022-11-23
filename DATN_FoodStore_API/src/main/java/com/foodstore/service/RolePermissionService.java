package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.RolePermission;


@Service
public interface RolePermissionService extends IService<RolePermission> {
	Page<RolePermission> getByPermissionId(Long id,Pageable pageable);
	
	List<RolePermission> getByPermissionId(Long id);
	
	Page<RolePermission> getByRoleId(Long id,Pageable pageable);
	
	List<RolePermission> getByRoleId(Long id);
	
	//Page<RolePermission> getByDisplayStatus(boolean isDisplay,Pageable pageable);
	
	RolePermission getByRoleIdAndPermissionId(Long roleId ,Long permissionId);
}
