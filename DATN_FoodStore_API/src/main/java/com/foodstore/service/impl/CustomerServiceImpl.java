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
import com.foodstore.util.constraints.Display;

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

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Customer> getByIsDisPlay() {
		return customerDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	public Page<Customer> getByIsDisplay(Pageable pageable) throws Exception {
		return customerDAO.findByIsDisplay(Display.SHOW, pageable);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Customer getByUsername(String username) {
		return customerDAO.findByUsername(username, Display.SHOW);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void deleteLogical(Long id) throws Exception {
		customerDAO.deleteLogical(Display.HIDE, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Customer> getByKeyword(String keyword, Pageable pageable) throws Exception {
		return customerDAO.findByKeyword(keyword, Display.SHOW, pageable);
	}
}
