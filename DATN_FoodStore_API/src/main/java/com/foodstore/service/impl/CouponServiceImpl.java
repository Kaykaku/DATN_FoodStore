package com.foodstore.service.impl;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CouponDAO;
import com.foodstore.model.entity.Coupon;
import com.foodstore.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDAO couponDAO;

	@Override
	public Coupon getById(Long id) {
		Optional<Coupon> result = couponDAO.findById(id);
		return result.isPresent() ? result.get() : null;
	}

	@Override
	public List<Coupon> getAll() {
		return couponDAO.findAll();
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Coupon create(Coupon cart) {
		return couponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public Coupon update(Coupon cart) {
		return couponDAO.save(cart);
	}

	@Transactional(rollbackOn = { Throwable.class })
	@Override
	public void delete(Long id) {
		if (id != null) {
			couponDAO.deleteById(id);
		}
	}

}
