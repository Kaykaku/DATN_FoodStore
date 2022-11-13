package com.foodstore.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.model.transaction.Cart;


@Service
public interface CartService extends IService<Cart> {
	Page<Cart> getByCustomerId(Pageable pageable,Long id);
	
	Page<Cart> getByFoodId(Pageable pageable,Long id);
	
	Cart getByCustomerIdAndFoodId(Long customerId ,Long foodId);
}
