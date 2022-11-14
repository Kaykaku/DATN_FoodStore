package com.foodstore.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodstore.dao.CartDAO;
import com.foodstore.model.transaction.Cart;
import com.foodstore.service.CartService;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart getById(Long id) {
		return cartDAO.findById(id).orElse(null);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public List<Cart> getAll() {
		return cartDAO.findAll();
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart create(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart update(Cart entiy) {
		return cartDAO.save(entiy);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public void delete(Long id) {
		cartDAO.deleteById(id);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getAll(int pageSize, int pageNumber) {
		return cartDAO.findAll(PageRequest.of(pageNumber - 1, pageSize));

	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getByCustomerId(Pageable pageable, Long id) {
		return cartDAO.findByCustomerId(pageable, id);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Page<Cart> getByFoodId(Pageable pageable, Long id) {
		return cartDAO.findByFoodId(pageable, id);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class, Throwable.class })
	public Cart getByCustomerIdAndFoodId(Long customerId, Long foodId) {
		return cartDAO.findByCustomerIdAndFoodId(customerId, foodId).orElse(null);
	}
}
