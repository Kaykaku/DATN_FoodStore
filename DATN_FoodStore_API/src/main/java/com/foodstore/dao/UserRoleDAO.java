package com.foodstore.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.transaction.UserRole;


@Repository
public interface UserRoleDAO extends JpaRepository<UserRole, Long>{
	@Query("Select u From UserRole u Where u.user_r.id=?1")
	Page<UserRole> findByUserId(Pageable pageable,Long id);
	
	@Query("Select u From UserRole u Where u.role_u.id=?1")
	Page<UserRole> findByRoleId(Pageable pageable,Long id);
	
	@Query("Select u From UserRole u Where u.is_display=?1")
	Page<UserRole> findByDisplayStatus(Pageable pageable,boolean isDisplay);
	
	@Query("Select u From UserRole u Where u.user_r.id=?1 and u.role_u.id=?2")
	Optional<UserRole> findByUserIdAndRoleId(Long userId ,Long roleId);
}
