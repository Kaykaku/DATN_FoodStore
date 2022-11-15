package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Customer;

@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long> {

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	List<Customer> findByIsDisplay(Boolean isDisplay);

	@Query("SELECT c FROM Customer c WHERE c.is_display = ?1")
	Page<Customer> findByIsDisplay(Boolean isDisplay, Pageable pageable);
}
