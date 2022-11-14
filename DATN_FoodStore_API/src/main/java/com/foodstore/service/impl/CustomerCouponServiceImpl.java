package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CustomerCouponDAO;
import com.foodstore.model.transaction.CustomerCoupon;
import com.foodstore.service.CustomerCouponService;

@Service
public class CustomerCouponServiceImpl implements CustomerCouponService {
	@Autowired
	private CustomerCouponDAO customerCouponDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public CustomerCoupon getById(Long id) {
		return customerCouponDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<CustomerCoupon> getAll() {
		return customerCouponDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public CustomerCoupon create(CustomerCoupon entiy) {
		return customerCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public CustomerCoupon update(CustomerCoupon entiy) {
		return customerCouponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		customerCouponDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<CustomerCoupon> getAll(int pageSize, int pageNumber) {
		return customerCouponDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<CustomerCoupon> getByCustomerId(Pageable pageable, Long id) {
		return customerCouponDAO.findByCustomerId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<CustomerCoupon> getByCouponId(Pageable pageable, Long id) {
		return customerCouponDAO.findByCouponId(pageable, id);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Page<CustomerCoupon> getByStatus(Pageable pageable, int status) {
		return customerCouponDAO.findByStatus(pageable, status);
	}

	@Override
	public CustomerCoupon getByCustomerIdAndCouponId(Long customerId, Long couponId) {
		return customerCouponDAO.findByCustomerIdAndCouponId(customerId, couponId).orElse(null);
	}
}
