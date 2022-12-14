package com.foodstore.dao;

import java.util.List;
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
	Page<UserRole> findByUserId(Long id ,Pageable pageable);
	
	@Query("Select u From UserRole u Where u.role_u.id=?1")
	Page<UserRole> findByRoleId(Long id,Pageable pageable);
	
	
	@Query("Select u From UserRole u Where u.user_r.id=?1")
	List<UserRole> findByUserId(Long id);
	
	@Query("Select u From UserRole u Where u.role_u.id=?1")
	List<UserRole> findByRoleId(Long id);
	/*
	 * @Query("Select u From UserRole u Where u.is_display=?1") Page<UserRole>
	 * findByDisplayStatus(boolean isDisplay,Pageable pageable);
	 */
	
	@Query("Select u From UserRole u Where u.user_r.id=?1 and u.role_u.id=?2")
	Optional<UserRole> findByUserIdAndRoleId(Long userId ,Long roleId);
}
