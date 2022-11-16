package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Customer;

@Service
public interface CustomerService extends IService<Customer> {
	List<Customer> getByIsDisPlay();

	Page<Customer> getByIsDisplay(Pageable pageable) throws Exception;
	
	void deleteLogical(Long id) throws Exception;

	Page<Customer> getByKeyword(String keyword, Pageable pageable) throws Exception;
}
