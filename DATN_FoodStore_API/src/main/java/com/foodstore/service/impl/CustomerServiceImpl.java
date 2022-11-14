package com.foodstore.service.impl;

import java.util.List;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired private CustomerDAO customerDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Customer getById(Long id) {
		return customerDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<Customer> getAll() {
		return customerDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Customer create(Customer entiy) {
		return customerDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Customer update(Customer entiy) {
		return customerDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		customerDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Customer> getAll(Pageable pageable) {
		return customerDAO.findAll(pageable);
	}

}
