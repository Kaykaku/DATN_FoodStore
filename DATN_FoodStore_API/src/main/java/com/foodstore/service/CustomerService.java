package com.foodstore.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.foodstore.model.entity.Customer;

@Service
public interface CustomerService extends IService<Customer> {
	List<Customer> getByIsDisPlay();

	Page<Customer> getByIsDisplay(int pageSize, int pageNumber) throws Exception;
}
