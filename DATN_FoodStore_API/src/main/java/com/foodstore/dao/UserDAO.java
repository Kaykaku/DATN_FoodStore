package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.User;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

	@Query("SELECT u FROM User u WHERE u.is_display = ?1")
	List<User> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT u FROM Category u WHERE u.is_display = ?1")
	Page<User> findByIsDisplay(Boolean isDisplay, Pageable pageable);

}
