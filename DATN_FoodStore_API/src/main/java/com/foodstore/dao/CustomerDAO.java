package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Customer;

@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long> {

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	List<Customer> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	Page<Customer> findByIsDisplay(Boolean isDisplay, Pageable pageable);
	
	@Modifying(clearAutomatically = true)
	@Query("UPDATE Customer c SET c.is_display = ?1 WHERE c.id = ?2")
	void deleteLogical(Boolean isDisplay, Long id);

	@Query("SELECT c FROM Customer c WHERE CONCAT(c.username, c.fullname, c.email) LIKE %?1% AND c.is_display = ?2")
	Page<Customer> findByKeyword(String keyword, Boolean isDisplay, Pageable pageable);
}
