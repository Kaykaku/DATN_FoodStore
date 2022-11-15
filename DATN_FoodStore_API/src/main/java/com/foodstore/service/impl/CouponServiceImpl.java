package com.foodstore.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.foodstore.dao.CouponDAO;
import com.foodstore.model.entity.Coupon;
import com.foodstore.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO couponDAO;

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Coupon getById(Long id) {
		return couponDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public List<Coupon> getAll() {
		return couponDAO.findAll();
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Coupon create(Coupon entiy) {
		return couponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public Coupon update(Coupon entiy) {
		return couponDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class, Throwable.class })
	public void delete(Long id) {
		couponDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackOn = {Exception.class, Throwable.class})
	public Page<Coupon> getAll(int pageSize, int pageNumber) {
		return couponDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));
	}
}
