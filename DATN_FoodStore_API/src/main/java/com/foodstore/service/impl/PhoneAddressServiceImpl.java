package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.PhoneAddressDAO;
import com.foodstore.model.extend.PhoneAddress;
import com.foodstore.service.PhoneAddressService;

@Service
public class PhoneAddressServiceImpl implements PhoneAddressService {

	@Autowired
	private PhoneAddressDAO phoneAddressDAO;

	@Override
	public PhoneAddress getById(Long id) {
		Optional<PhoneAddress> result = phoneAddressDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<PhoneAddress> getAll() {
		return phoneAddressDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public PhoneAddress create(PhoneAddress cart) {
		return phoneAddressDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public PhoneAddress update(PhoneAddress cart) {
		return phoneAddressDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			phoneAddressDAO.deleteById(id);
		}
	}

}
