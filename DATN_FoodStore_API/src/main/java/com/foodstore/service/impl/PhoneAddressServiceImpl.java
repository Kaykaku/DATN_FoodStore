package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PhoneAddressDAO;
import com.foodstore.model.extend.PhoneAddress;
import com.foodstore.service.PhoneAddressService;

@Service
public class PhoneAddressServiceImpl implements PhoneAddressService {

	@Autowired private PhoneAddressDAO phoneAddressDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public PhoneAddress getById(Long id) {
		return phoneAddressDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<PhoneAddress> getAll() {
		return phoneAddressDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public PhoneAddress create(PhoneAddress entiy) {
		return phoneAddressDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public PhoneAddress update(PhoneAddress entiy) {
		return phoneAddressDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		phoneAddressDAO.deleteById(id);
	}
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<PhoneAddress> getAll(Pageable pageable) {
		return phoneAddressDAO.findAll(pageable);
	}
}
