package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Customer;

@Service
public interface CustomerService extends IService<Customer> {
	List<Customer> getByIsDisPlay();

	Page<Customer> getByIsDisplay(Pageable pageable) throws Exception;
	
	Boolean isExist(Customer customer);
	
	Customer getByUsername(String username);
	
	Customer getByEmail(String email);
	
	void deleteLogical(Long id) throws Exception;

	Page<Customer> getByKeyword(String keyword, Pageable pageable) throws Exception;
	
	List<Customer> getByFilter(String keyword , Optional<Boolean> gender , Optional<Long> birth_date,Optional<Long> create_date ,Optional<Boolean> is_display ,Optional<Integer> status);
	
	List<Customer> getByKeyword(String keyword);
	
	Page<Customer> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date,Optional<Long> create_date ,Optional<Boolean> is_display ,Optional<Integer> status, Pageable pageable);
}
