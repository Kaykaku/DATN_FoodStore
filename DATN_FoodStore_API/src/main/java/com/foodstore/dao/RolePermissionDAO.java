package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.RolePermission;


@Repository
public interface RolePermissionDAO extends JpaRepository<RolePermission, Long>{
	@Query("Select r From RolePermission r Where r.role_p.id=?1")
	Page<RolePermission> findByRoleId(Long id,Pageable pageable);
	
	@Query("Select r From RolePermission r Where r.permission_r.id=?1")
	Page<RolePermission> findByPermissionId(Long id,Pageable pageable);
	
	@Query("Select r From RolePermission r Where r.is_display=?1")
	Page<RolePermission> findByDisplayStatus(boolean isDisplay,Pageable pageable);
	
	@Query("Select r From RolePermission r Where r.role_p.id=?1 and r.permission_r.id=?2")
	Optional<RolePermission> findByRoleIdAndPermissionId(Long roleId ,Long permissionId);
}
