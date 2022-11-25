package com.foodstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.extend.PhoneAddress;

@Service
public interface PhoneAddressService extends IService<PhoneAddress> {
	Page<PhoneAddress> getByCustomerId(Long id,Pageable pageable);
	
	Page<PhoneAddress> getByContactType(Boolean contactType,Pageable pageable);
	
	Page<PhoneAddress> getByKeyword(String keyword,Pageable pageable);
	
	Page<PhoneAddress> getByFilter(String keyword 
			, Optional<Long> customerId , Optional<Boolean> is_address ,Optional<Boolean> is_default,Pageable pageable);
	
	List<PhoneAddress> getByFilter(String keyword 
			, Optional<Long> customerId , Optional<Boolean> is_address ,Optional<Boolean> is_default);
}
