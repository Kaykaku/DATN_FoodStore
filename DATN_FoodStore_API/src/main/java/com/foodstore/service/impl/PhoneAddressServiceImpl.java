package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
	public Page<PhoneAddress> findByCustomerId(Long id,Pageable pageable) {
		return phoneAddressDAO.findByCustomerId(id,pageable);
	}

	@Override
	public Page<PhoneAddress> findByContactType(Boolean contactType,Pageable pageable) {
		return phoneAddressDAO.findByContactType(contactType,pageable);
	}

	@Override
	public Page<PhoneAddress> findByKeyword(String keyword,Pageable pageable) {
		return phoneAddressDAO.findByKeyword(keyword,pageable);
	}

	@Override
	public Page<PhoneAddress> findByFilter(String keyword, Optional<Long> customerId,
			Optional<Boolean> is_address, Optional<Boolean> is_default,Pageable pageable) {
		List<PhoneAddress> list = phoneAddressDAO.findByKeyword(keyword);
		if(customerId.isPresent()) list = list.stream().filter(o-> o.getCustomer_pa().getId() == customerId.get()).collect(Collectors.toList());
		if(is_address.isPresent()) list = list.stream().filter(o-> o.is_address() == is_address.get()).collect(Collectors.toList());
		if(is_default.isPresent()) list = list.stream().filter(o-> o.is_default() == is_default.get()).collect(Collectors.toList());
		return new PageImpl<PhoneAddress>(list, pageable, list.size());
	}


}
