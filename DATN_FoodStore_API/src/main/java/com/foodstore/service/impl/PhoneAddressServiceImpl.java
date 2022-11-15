package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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

	@Override
	public Page<PhoneAddress> findByCustomerId(Pageable pageable, Long id) {
		return phoneAddressDAO.findByCustomerId(pageable,id);
	}

	@Override
	public Page<PhoneAddress> findByContactType(Pageable pageable, Boolean contactType) {
		return phoneAddressDAO.findByContactType(pageable,contactType);
	}

	@Override
	public Page<PhoneAddress> findByKeyword(Pageable pageable, String keyword) {
		return phoneAddressDAO.findByKeyword(pageable,keyword);
	}

	@Override
	public Page<PhoneAddress> findByFilter(Pageable pageable, String keyword, Optional<Long> customerId,
			Optional<Boolean> is_address, Optional<Boolean> is_default) {
		List<PhoneAddress> list = phoneAddressDAO.findByKeyword(keyword);
		if(customerId.isPresent()) list = list.stream().filter(o-> o.getCustomer_pa().getId() == customerId.get()).toList();
		if(is_address.isPresent()) list = list.stream().filter(o-> o.is_address() == is_address.get()).toList();
		if(is_default.isPresent()) list = list.stream().filter(o-> o.is_default() == is_default.get()).toList();
		return new PageImpl<PhoneAddress>(list, pageable, list.size());
	}


}
