package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.User;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {

	List<User> findByIsDisplay(Boolean isDisplay);

	Page<User> findByIsDisplay(Boolean isDisplay, PageRequest pageable);

}
