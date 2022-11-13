package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.UserPermission;


@Repository
public interface UserPermissionDAO extends JpaRepository<UserPermission, Long>{
	@Query("Select u From UserPermission u Where u.user_p.id=?1")
	Page<UserPermission> findByUserId(Pageable pageable,Long id);
	
	@Query("Select u From UserPermission u Where u.permission_u.id=?1")
	Page<UserPermission> findByPermissionId(Pageable pageable,Long id);
	
	@Query("Select u From UserPermission u Where u.is_display=?1")
	Page<UserPermission> findByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	@Query("Select u From UserPermission u Where u.user_p.id=?1 and u.permission_u.id=?2")
	Optional<UserPermission> findByUserIdAndPermissionId(Long userId ,Long permissionId);
}
