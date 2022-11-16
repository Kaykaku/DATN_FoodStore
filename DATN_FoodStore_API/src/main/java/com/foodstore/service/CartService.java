package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Cart;


@Service
public interface CartService extends IService<Cart> {
	Page<Cart> getByCustomerId(Long id,Pageable pageable);
	
	Page<Cart> getByFoodId(Long id,Pageable pageable);
	
	Cart getByCustomerIdAndFoodId(Long customerId ,Long foodId);
}
