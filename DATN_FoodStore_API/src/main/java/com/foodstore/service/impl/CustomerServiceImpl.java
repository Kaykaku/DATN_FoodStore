package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDAO;

	@Override
	public Customer getById(Long id) {
		Optional<Customer> result = customerDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Customer> getAll() {
		return customerDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Customer create(Customer cart) {
		return customerDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Customer update(Customer cart) {
		return customerDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			customerDAO.deleteById(id);
		}
	}

}
