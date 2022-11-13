package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerCouponDAO;
import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.service.CustomerCouponService;

@Service
public class CustomerCouponServiceImpl implements CustomerCouponService {

	@Autowired
	private CustomerCouponDAO customerCouponDAO;

	@Override
	public CustomerCoupon getById(Long id) {
		Optional<CustomerCoupon> result = customerCouponDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<CustomerCoupon> getAll() {
		return customerCouponDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public CustomerCoupon create(CustomerCoupon cart) {
		return customerCouponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public CustomerCoupon update(CustomerCoupon cart) {
		return customerCouponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			customerCouponDAO.deleteById(id);
		}
	}
}
