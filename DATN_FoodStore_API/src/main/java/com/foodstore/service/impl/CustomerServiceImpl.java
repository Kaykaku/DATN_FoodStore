package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;
import com.foodstore.util.constraints.Display;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Customer getById(Long id) {
		return customerDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Customer> getAll() {
		return customerDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Customer create(Customer entiy) {
		return customerDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Customer update(Customer entiy) {
		return customerDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		customerDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Customer> getAll(int pageSize, int pageNumber) {
		return customerDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Customer> getByIsDisPlay() {
		return customerDAO.findByIsDisplay(Display.SHOW);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Customer> getByIsDisplay(int pageSize, int pageNumber) throws Exception {
		if (pageNumber >= 1) {
			return customerDAO.findByIsDisplay(Display.SHOW, PageRequest.of(pageNumber - 1, pageSize));
		} else {
			throw new Exception("Số trang phải lớn hơn 0!");
		}
	}

}
