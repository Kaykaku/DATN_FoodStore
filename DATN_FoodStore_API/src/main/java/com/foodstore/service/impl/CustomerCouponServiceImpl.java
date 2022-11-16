package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerCouponDAO;
import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.service.CustomerCouponService;

@Service
public class CustomerCouponServiceImpl implements CustomerCouponService {
	@Autowired private CustomerCouponDAO customerCouponDAO;
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public CustomerCoupon getById(Long id) {
		return customerCouponDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public List<CustomerCoupon> getAll() {
		return customerCouponDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public CustomerCoupon create(CustomerCoupon entiy) {
		return customerCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public CustomerCoupon update(CustomerCoupon entiy) {
		return customerCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public void delete(Long id) {
		customerCouponDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<CustomerCoupon> getAll(Pageable pageable) {
		return customerCouponDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<CustomerCoupon> getByCustomerId( Long id,Pageable pageable) {
		return customerCouponDAO.findByCustomerId(id,pageable);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<CustomerCoupon> getByCouponId( Long id,Pageable pageable) {
		return customerCouponDAO.findByCouponId(id,pageable);
	}
	
	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<CustomerCoupon> getByStatus(int status,Pageable pageable) {
		return customerCouponDAO.findByStatus(status,pageable);
	}

	@Override
	public CustomerCoupon getByCustomerIdAndCouponId(Long customerId, Long couponId) {
		return customerCouponDAO.findByCustomerIdAndCouponId(customerId,couponId).orElse(null);
	}
}
