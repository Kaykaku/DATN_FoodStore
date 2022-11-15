package com.foodstore.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.PhoneAddress;

@Service
public interface PhoneAddressService extends IService<PhoneAddress> {
	Page<PhoneAddress> findByCustomerId(Pageable pageable,Long id);
	
	Page<PhoneAddress> findByContactType(Pageable pageable,Boolean contactType);
	
	Page<PhoneAddress> findByKeyword(Pageable pageable,String keyword);
	
	Page<PhoneAddress> findByFilter(Pageable pageable,String keyword 
			, Optional<Long> customerId , Optional<Boolean> is_address ,Optional<Boolean> is_default);
}
