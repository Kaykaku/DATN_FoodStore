package com.foodstore.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.User;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

	@Query("SELECT u FROM User u WHERE u.is_display = ?1")
	List<User> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT u FROM Category u WHERE u.is_display = ?1")
	Page<User> findByIsDisplay(Boolean isDisplay, Pageable pageable);
	
	@Query("SELECT u FROM User u WHERE u.username = ?1")
	Optional<User> findByUsername(String username);
	
	@Query("SELECT u FROM User u WHERE u.email = ?1")
	Optional<User> findByEmail(String email);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE User u SET u.is_display = ?1 WHERE u.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT u FROM User u WHERE CONCAT(u.username, u.fullname, u.email) LIKE %?1% AND u.is_display = ?2")
	Page<User> findByKeyword(String keyword, Boolean isDisplay, Pageable pageable);

	@Query("SELECT u FROM User u WHERE  u.username LIKE %?1% or u.fullname LIKE %?1% or u.email LIKE %?1% or u.phone LIKE %?1% or u.address LIKE %?1%")
	Page<User> findByKeyword(String keyword, Pageable pageable);
	
	@Query("SELECT u FROM User u WHERE  u.username LIKE %?1% or u.fullname LIKE %?1% or u.email LIKE %?1% or u.phone LIKE %?1% or u.address LIKE %?1%"  )
	List<User> findByKeyword(String keyword);
}
