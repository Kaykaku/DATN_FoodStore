package com.foodstore.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CartDAO;
import com.foodstore.model.transaction.Cart;
import com.foodstore.service.CartService;


@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO cartDAO;
	
	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Cart getById(Long id) {
		return cartDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public List<Cart> getAll() {
		return cartDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Cart create(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Cart update(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public void delete(Long id) {
		cartDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Cart> getAll(Pageable pageable) {
		return cartDAO.findAll(pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Cart> getByCustomerId( Long id,Pageable pageable) {
		return cartDAO.findByCustomerId(id,pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Page<Cart> getByFoodId(Long id,Pageable pageable) {
		return cartDAO.findByFoodId(id,pageable);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class, Throwable.class})
	public Cart getByCustomerIdAndFoodId(Long customerId, Long foodId) {
		return cartDAO.findByCustomerIdAndFoodId(customerId,foodId).orElse(null);
	}
}
