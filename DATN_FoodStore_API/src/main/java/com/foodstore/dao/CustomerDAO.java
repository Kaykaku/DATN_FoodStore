package com.foodstore.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.foodstore.model.entity.Customer;

@Repository
public interface CustomerDAO extends JpaRepository<Customer, Long> {
	List<Customer> findByIsDisplay(Boolean isDisplay);

	Page<Customer> findByIsDisplay(Boolean isDisplay, PageRequest pageable);
}
