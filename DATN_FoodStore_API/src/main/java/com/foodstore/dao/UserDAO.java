package com.foodstore.dao;

import java.util.List;

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

	@Query("SELECT u FROM User u WHERE u.is_display = ?1")
	Page<User> findByIsDisplay(Boolean isDisplay, Pageable pageable);

	@Query("SELECT u FROM User u WHERE u.username = ?1 AND u.is_display = ?2")
	User findByUsername(String username, Boolean isDisplay);

	@Modifying(clearAutomatically = true)
	@Query("UPDATE User u SET u.is_display = ?1 WHERE u.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT u FROM User u WHERE CONCAT(u.username, u.fullname, u.email) LIKE %?1% AND u.is_display = ?2")
	Page<User> findByKeyword(String keyword, Boolean isDisplay, Pageable pageable);

}
