package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerDAO;
import com.foodstore.model.entity.Customer;
import com.foodstore.model.entity.User;
import com.foodstore.service.CustomerService;
import com.foodstore.util.constraints.Display;
import com.foodstore.util.convert.Convert;

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

	@Override
	public Customer getByEmail(String email) {
		return customerDAO.findByEmail(email).orElse(null);
	}
	
	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Customer> getByKeyword(String keyword) {
		return customerDAO.findByKeyword(keyword);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<Customer> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date ,  Optional<Long> create_date, 
			Optional<Boolean> is_display, Optional<Integer> status, Pageable pageable) {
		List<Customer> list = getByFilter(keyword,gender,birth_date,create_date,is_display,status);
		Page<Customer> page =(Page<Customer>) Convert.toPage(list, pageable);
		return page ;
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Customer> getByFilter(String keyword, Optional<Boolean> gender, Optional<Long> birth_date,
			Optional<Long> create_date, Optional<Boolean> is_display,
			Optional<Integer> status) {
		List<Customer> list = customerDAO.findByKeyword(keyword.trim());
		if(gender.isPresent()) list = list.stream().filter(o-> o.isGender() == gender.get()).toList();
		if(birth_date.isPresent()) list = list.stream().filter(o-> o.getBirthday().getTime() >= birth_date.get()).toList();
		if(create_date.isPresent()) list = list.stream().filter(o-> o.getCreate_date()==null || o.getCreate_date().getTime() >= create_date.get()).toList();
		if(is_display.isPresent()) list = list.stream().filter(o-> o.is_display() == is_display.get()).toList();
		if(status.isPresent()) list = list.stream().filter(o-> o.getStatus() >= status.get()).toList();

		return list ;
	}

	@Override
	public Boolean isExist(Customer customer) {
		return customerDAO.findByEmail(customer.getEmail()).isPresent() || customerDAO.findByUsername(customer.getUsername()).isPresent();
	}
}
